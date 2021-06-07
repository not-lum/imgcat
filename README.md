<p align="center">
  <img width=105 height=105 src="https://raw.githubusercontent.com/not-lum/imgcat/master/logo/kitty.png">
</p>

<h2 align="center"><b>imgcat</b></h2>

<p align="center">
  <b>See images in your terminal.
  <br>
  Written in Nim
  <br/>
  <br/>
  </b>
  <img src="https://img.shields.io/github/license/not-lum/imgcat?style=flat-square">

   <img src="https://img.shields.io/badge/version-0.2.0-green?style=flat-square">

   <img src="https://img.shields.io/badge/made_with-nim-green?style=flat-square">
</p>
<br>

# About
**imgcat** is a crossplatform util written in Nim. You can print image in your terminal just by one command:
```bash
$ imgcat <IMAGENAME>
```
If you need any help write:
```
$ imgcat --help
```
> **Note:** if you are a Windows user, use Windows Terminal instead of cmd.exe<br>

# Utils

## Images:
**proc imgcatP(imagename: string; symbol="█"; width=0; height=0): string** - returns a string that contains a picture<br><br>
**proc imgcat(imagename: string; symbol="█"; width=0; height=0)** - prints a picture<br><br>


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
Requires @nim-lang to build
```bash
$ nimble install imgcat
```

<p align="center">Icon made by <a href="http://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></p>
