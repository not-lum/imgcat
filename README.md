<p align="center">
  <img width=105 height=105 src="https://raw.githubusercontent.com/not-lum/imgcat/master/logo/kitty.png">
</p>

<h2 align="center"><b>imgcat</b></h2>

<p align="center">
  <b>This utility prints pictures in your console
  <br/>
  </b>
  <img src="https://img.shields.io/github/license/not-lum/imgcat?style=flat-square">

   <img src="https://img.shields.io/badge/version-1.3-green?style=flat-square">

   <img src="https://img.shields.io/badge/made_with-nim-green?style=flat-square">
</p>
<br>

# Usage
To print an image write:
```bash
$ imgcat <IMAGENAME>
```
To get help write:
```bash
$ imgcat --help
```

# Utils

You can also use imgcat as a Nim library:
```nim
import imgcatpkg/utils

echo $imgcat("imagename.png",
            pattern="NIM",
            width=0,
            height=0,
            black_and_white=false,
            transparency=false)

```
Pixel type:
```nim
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
```

imgcat proc:
```nim
proc imgcat*(imagename: string;
             pattern="█";
             width=(-1);
             height=(-1);
             black_and_white=false;
             transparency=false): seq[Pixel]
```
$ operators
```nim
proc `$`*(pixel: Pixel): string
```
```nim
proc `$`*(pixels: seq[Pixel]): string
```

# Gallery
<img src="https://raw.githubusercontent.com/not-lum/imgcat/master/logo/kitty_printed.png" width=70% height=70%>
<img src="https://raw.githubusercontent.com/not-lum/imgcat/master/logo/kitty_printed_nim.png" width=70% height=70%>
<img src="https://raw.githubusercontent.com/not-lum/imgcat/master/logo/kitty_printed_bw.png" width=70% height=70%>

<p align="center">Icon made by <a href="http://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></p>
