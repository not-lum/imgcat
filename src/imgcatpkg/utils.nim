import imageman
import terminal
import strformat
import strutils
import unicode

proc rgb(text: string;
         r, g, b: uint8;
         black_and_white: bool): string =

  if not black_and_white:
    return &"\x1b[38;2;{r};{g};{b}m{text}"
  else:
    let brightness = float(r) * 0.2126 + float(g) * 0.7152 + float(b) * 0.0722

    if brightness < 128:
      return &"\x1b[30m{text}"
    else:
      return &"\x1b[37m{text}"


proc imgcat*(imagename: string;
             pattern="█";
             width=0;
             height=0;
             black_and_white=false;
             transparency=false): string =

  var img = loadImage[ColorRGBAU](imagename)

  let patternLen = pattern.runeLen

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
      var pix: string

      if transparency and color.a == 0:
        result &= "  "
      else:
        if patternLen > 1:
          pix = pattern[patternCounter mod patternLen] &
                pattern[(patternCounter + 1) mod patternLen]
        
          patternCounter += 2
        else:
          pix = pattern.repeat(2)

        result &= pix.rgb(color.r, color.g, color.b, black_and_white)

    result &= "\n"

  result & "\x1b[0m"
