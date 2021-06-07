import imgcatpkg/utils
import argparse
import strutils


const helpText = """imgcat is a utility that allows you to view pictures in your terminal.

NOTE: If width=0 and height=0 then the width and height are set automatically,
depending on the size of the terminal.""".bold

var p = newParser:
  help(helpText)
  arg("imagename")
  option("-s", "--symbol", help="set a custom symbol", default=some("█"))
  option("-w", "--width", help="", default=some("0"))
  option("-h", "--height", help="", default=some("0"))

  run:
    try:
      imgcat(opts.imagename, opts.symbol,
            parseInt(opts.width), parseInt(opts.height))
    except ValueError:
      echo "ValueError: width and height must be integers!"
    except IOError:
      echo "IOError: Cannot open file"
    except RangeDefect:
      echo "RangeDefect: The picture is too big"


try:
  p.run()
except UsageError as e:
  echo getCurrentExceptionMsg()
