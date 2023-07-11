# Package

version       = "1.2"
author        = "not-lum"
description   = "This utility prints pictures in your console"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["imgcat"]


# Dependencies

requires "nim >= 1.0.0"
requires "imageman 0.8.2"
requires "argparse 3.0.0"
