# Package

version       = "0.2.0"
author        = "not-lum"
description   = "See pictures in your console"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["imgcat"]


# Dependencies

requires "nim >= 1.0.0"
requires "imageman 0.8.2"
requires "argparse 2.0.0"