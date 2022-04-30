import imgcatpkg/utils
import argparse
import terminal


var parser = newParser:
  help("This utility prints pictures in your console.")

  arg("imagename")

  flag("-bw", "--black-and-white")
  flag("-iw", "--ignore-warnings")

  option("-p", "--pattern", default=some("█"))
  option("-w", "--width",   default=some("0"))
  option("-h", "--height",  default=some("0"))

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
                  opts.black_and_white)

      disableTrueColors()
    except ValueError:
      echo "ValueError: width, height: int; black-and-white: bool"
    except IOError:
      echo "IOError: cannot open file"

parser.run()
