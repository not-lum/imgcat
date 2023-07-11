import imgcatpkg/utils
import argparse
import terminal

var parser = newParser:
  help("This utility prints pictures in your console.")

  arg("imagename")

  flag("-bw", "--black-and-white", help="Black and white mode")
  flag("-iw", "--ignore-warnings", help="Ignores true colors warning")
  flag("-t",  "--transparency",    help="Replaces transparent pixels with spaces")

  option("-p", "--pattern", default=some("█"), help="May consist of several characters")
  option("-w", "--width",   default=some("0"), help="0 - auto resizing, depending on your terminal size. -1 - original width")
  option("-h", "--height",  default=some("0"), help="0 - auto resizing, depending on your terminal size. -1 - original height")

  run:
    try:
      enableTrueColors()

      if not isTrueColorSupported() and not opts.ignore_warnings:
        echo "WARNING: your terminal emulator does not support true colors."
        opts.black_and_white = true

      echo imgcat(opts.imagename,
                  opts.pattern,
                  parseInt(opts.width),
                  parseInt(opts.height),
                  opts.black_and_white,
                  opts.transparency)

      disableTrueColors()
    except ValueError:
      echo "ValueError: width, height: int"
    except IOError:
      echo "IOError: cannot open file"

parser.run()
