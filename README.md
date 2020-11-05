<p align="center">
  <img width=105 height=105 src="logo/kitty.png">
</p>

<h2 align="center"><b>imgcat</b></h2>

<p align="center">
  <b>See images in your terminal.
  <br>
  Written in Nim
  <br/>
  <br/>
  </b>
  <img src="https://img.shields.io/badge/license-MIT-green?style=flat-square">

   <img src="https://img.shields.io/badge/version-0.1.0-green?style=flat-square">

   <img src="https://img.shields.io/badge/made_with-nim-green?style=flat-square">
</p>
<br>

# About
**imgcat** is a crossplatform util written Nim. You can see image in your terminal just by one command:
```bash
$ imgcat -i:filename.png
```
You often need to minify the picture. You can do this by the **-m**, **--minify** option(by default it's 2):<br>
```bash
$ imgcat -i:filename.png -m:int
```
For full help write:
```
$ imgcat --help
```
> **Note:** if you are Windows user it is highly recommended to use Windows Terminal instead of usual cmd.exe<br>
> **Second note:** only PNG pictures are supported at the moment 

# Utils

## Images:
**proc image\*(imagename: string; minify=2; symbol="█"): string** - returns a string that contains a picture<br><br>
**proc imgcat\*(imagename: string; minify=2; symbol="█"): string** - prints a picture<br><br>


## Colors:
```nim
import imgcatpkg/utils

echo "Hello, World!".green
```
All supported colors:
**black**,
**red**,
**green**,
**yellow**,
**blue**,
**purple**,
**cyan**,
**white**<br>
You can also use any other color by the rgb procedure:
```nim
echo "I am red".rgb(255, 0, 0)
```
You can change background color by adding "back" at the start of the color:
```nim
echo "I am yellow".backYellow
```
Also, you can format text:
```nim
echo "underline".underline
echo "italic".italic
echo "bold".bold
```
But this ansi codes automaticly resets. This is mean, that
```nim
echo italicOn()
echo "italic"
echo italicOff()
```
is equal to:
```nim
echo "italic".italic
```
Bold and underline work similary.
Color ansi codes(like green, yellow or blue) don't automatickly resets. This is an example:
```nim
echo "red".red
echo "I am red too!"
```
So, you need to reset it. You can do it by writing "reset" at the end:
```nim
echo "red".red.reset
echo "I am not red anymore..."
```
Also, there two more ways to reset: **resetBack()** and **resetFore()**<br>
As you might have guessed, the first one resets only background color and another resets only foreground.


# Installing
```bash
$ git clone https://github.com/not-lum/imgcat.git
$ cd imgcat
$ nimble install
```

<p align="center">Icon made by <a href="http://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></p>
