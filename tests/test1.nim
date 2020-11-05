import imgcatpkg/utils
import os, strutils

let dir = getCurrentDir()

proc printImg(path: string) = 
  when hostOS == "windows":
    imgcat(dir & path.replace("/", "\\"), minify=4)
  else:
    imgcat(dir & path, minify=4)

printImg("/tests/images/image2.png")
echo "Another image:".green.reset
printImg("/tests/images/image3.png")
