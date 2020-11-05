import flippy
import strformat
import os


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


proc termImage(img: Image; y: int; symbol: string): string =
  var x = 0
  var pix_pic: string

  while x < img.width:

    var color = img.getRgba(x, y)
    var pix = symbol.rgb($color.r, $color.g, $color.b)

    if x != img.width - 1:
      pix_pic &= pix
    else:
      pix_pic &= pix & "\n"
    inc x
  return pix_pic


proc image*(imagename: string; minify=2; symbol="█"): string =
  var image = loadImage(imagename)
  var full_image: string
  image = image.minify(minify)
  
  for y in 0..<image.height:
    full_image &= image.termImage(y, symbol=symbol*2)

  return full_image & reset()


proc imgcat*(imagename: string; minify=2; symbol="█") =
  let path = splitFile(imagename)

  if path.ext == ".png":
    echo image(imagename=imagename, minify=minify, symbol=symbol)
  else:
    echo "Error: ".red.reset & "images only with png extension are available"
