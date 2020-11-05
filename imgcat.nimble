# Package

version       = "0.1.0"
author        = "not-lum"
description   = "See pictures in your console"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["imgcat"]


# Dependencies

requires "nim >= 1.0.0"
requires "flippy 0.4.5"
requires "cligen 1.2.2"