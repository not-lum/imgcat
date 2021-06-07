import imageman
import terminal
import strformat


proc bold*(text: string): string =
  return &"\x1b[1m{text}\x1b[22m"

proc boldOn*(): string =
  return "\x1b[1m"

proc boldOff*(): string =
  return &"\x1b[22m"

proc italic*(text: string): string =
  return &"\x1b[3m{text}\x1b[23m"

proc italicOn*(): string =
  return "\x1b[3m"

proc italicOff*(): string =
  return &"\x1b[23m"


proc underline*(text: string): string =
  return &"\x1b[4m{text}\x1b[24m"

proc underlineOn*(): string =
  return "\x1b[4m"

proc underlineOff*(): string =
  return &"\x1b[24m"



proc black*(text=""): string =
  return &"\x1b[30m{text}"

proc red*(text=""): string =
  return &"\x1b[31m{text}"

proc green*(text=""): string =
  return &"\x1b[32m{text}"

proc yellow*(text=""): string =
  return &"\x1b[33m{text}"

proc blue*(text=""): string =
  return &"\x1b[34m{text}"

proc purple*(text=""): string =
  return &"\x1b[35m{text}"

proc cyan*(text=""): string =
  return &"\x1b[36m{text}"

proc white*(text=""): string =
  return &"\x1b[37m{text}"

proc resetFore*(text=""): string =
  return &"{text}\x1b[49m"




proc backBlack*(text=""): string =
  return &"\x1b[40m{text}"

proc backRed*(text=""): string =
  return &"\x1b[41m{text}"

proc backGreen*(text=""): string =
  return &"\x1b[42m{text}"

proc backYellow*(text=""): string =
  return &"\x1b[43m{text}"

proc backBlue*(text=""): string =
  return &"\x1b[44m{text}"

proc backPurple*(text=""): string =
  return &"\x1b[45m{text}"

proc backCyan*(text=""): string =
  return &"\x1b[46m{text}"

proc backWhite*(text=""): string =
  return &"\x1b[47m{text}"

proc resetBack*(text=""): string =
  return &"{text}\x1b[49m"

proc reset*(text=""): string =
  return &"{text}\x1b[0m" # resets background and foreground


proc rgb*(text: string; r, g, b: string): string =
  return &"\x1b[38;2;{r};{g};{b}m{text}" # Works on terminals with rgb-ansi support


proc `*`(str: string; times: int): string =
  for i in 1..times:
    result &= str



proc imgcatP*(imagename: string; symbol="█";
              width=0; height=0): string =
  var img = loadImage[ColorRGBU](imagename)
  var str_image: string

  if width == 0 and height == 0:
    let diff = max(img.width, img.height) - min(img.width, img.height)
    let terminalMin = min(terminalHeight(), terminalWidth())

    if img.width > img.height:
      img = img.resizedBicubic(terminalMin, terminalMin - diff)
    else:
      img = img.resizedBicubic(terminalMin - diff, terminalMin)

  elif width > 0 and height > 0:
    img = img.resizedBicubic(width, height)

  for y in 0..<img.height:
    for x in 0..<img.width:
      let color = img[x, y]
      let pix = symbol.rgb($color.r, $color.g, $color.b) * 2

      if x != img.width - 1:
        str_image &= pix
      else:
        str_image &= pix & "\n"

  return str_image & reset()

proc imgcat*(imagename: string; symbol="█";
            width=0; height=0) =
  echo imgcatP(imagename, symbol, width, height)
