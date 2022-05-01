<p align="center">
  <img width=105 height=105 src="https://raw.githubusercontent.com/not-lum/imgcat/master/logo/kitty.png">
</p>

<h2 align="center"><b>imgcat</b></h2>

<p align="center">
  <b>This utility prints pictures in your console
  <br/>
  </b>
  <img src="https://img.shields.io/github/license/not-lum/imgcat?style=flat-square">

   <img src="https://img.shields.io/badge/version-1.0-green?style=flat-square">

   <img src="https://img.shields.io/badge/made_with-nim-green?style=flat-square">
</p>
<br>

# Usage
To print an image write:
```bash
$ imgcat <IMAGENAME>
```
To get help write:
```
$ imgcat --help
```

# Utils

You can also use imgcat as a Nim library:
```nim
import imgcat

echo imgcat("imagename.png",
            pattern="NIM",
            width=100,
            height=100,
            black_and_white=false)

```
# Gallery
<img src="logo/kitty_printed.png" width=70% height=70%>
<img src="logo/kitty_printed_nim.png" width=70% height=70%>
<img src="logo/kitty_printed_bw.png" width=70% height=70%>

<p align="center">Icon made by <a href="http://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></p>
