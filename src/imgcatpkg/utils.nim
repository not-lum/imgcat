import imageman
import terminal
import strformat
import strutils
import unicode

type
  PixelKind* = enum
    rgbPixel,
    bwpixel,
    transparentPixel,
    newLine
  Pixel* = object
    case kind*: PixelKind
      of rgbPixel:
        r*: uint8
        g*: uint8
        b*: uint8
        rgbPattern*: string
      of bwPixel:
        black*: bool
        bwPattern*: string
      of transparentPixel:
        discard
      of newLine:
        discard


proc `$`*(pixel: Pixel): string =
  case pixel.kind
    of rgbPixel:
       return &"\x1b[38;2;{pixel.r};{pixel.g};{pixel.b}m{pixel.rgbPattern}"
    of bwPixel:
      if pixel.black:
        return &"\x1b[30m{pixel.bwPattern}"
      else:
        return &"\x1b[37m{pixel.bwPattern}"
    of transparentPixel:
      return "  "
    of newLine:
      return "\n"


proc imgcat*(imagename: string;
             pattern="█";
             width=(-1);
             height=(-1);
             black_and_white=false;
             transparency=false): seq[Pixel] =

  var img = loadImage[ColorRGBAU](imagename)

  let patternRunes = pattern.toRunes()
  let patternLen = patternRunes.len()

  # Resizing the image to match the size of the console
  let terminalMin = min(terminalHeight(), terminalWidth())
  
  if width == 0 and height == 0:
    img = img.resizedBicubic(terminalMin, img.height * terminalMin div img.width)
  elif width > 0 and height == 0:
    img = img.resizedBicubic(width, img.height * terminalMin div img.width)
  elif width == 0 and height > 0:
    img = img.resizedBicubic(terminalMin, height)
  elif width > 0 and height > 0:
    img = img.resizedBicubic(width, height)
  elif width == -1 and height > 0:
    img = img.resizedBicubic(img.width, height)
  elif height == -1 and width > 0:
    img = img.resizedBicubic(width, img.height)
  elif width == -1 and height == 0:
    img = img.resizedBicubic(img.width, img.height * terminalMin div img.width)
  elif height == -1 and width == 0:
    img = img.resizedBicubic(terminalMin, img.height)
  elif width == -1 and height == -1:
    img = img.resizedBicubic(img.width, img.height)

  # Textualizing the image
  var patternCounter = 0

  for y in 0..<img.height:
    for x in 0..<img.width:
      let color = img[x, y]
      var patt: string 

      if transparency and color.a == 0:
        result.add Pixel(kind: transparentPixel)
      else:
        if patternLen > 1:
          patt = `$`(patternRunes[patternCounter mod patternLen]) &
                 `$`(patternRunes[(patternCounter + 1) mod patternLen])
        
          patternCounter += 2
        else:
          patt = pattern.repeat(2)

        if not black_and_white:
          result.add Pixel(kind: rgbPixel,
                           r: color.r, g: color.g, b: color.b,
                           rgbPattern: patt)
        else:
          let brightness = float(color.r) * 0.2126 + float(color.g) * 0.7152 + float(color.b) * 0.0722
          
          if brightness < 128:
            result.add Pixel(kind: bwPixel, black: true, bwPattern: patt)
          else:
            result.add Pixel(kind: bwPixel, black: false, bwPattern: patt)

    result.add Pixel(kind: newLine)


proc `$`*(pixels: seq[Pixel]): string =
  for pixel in pixels:
    result &= $pixel

