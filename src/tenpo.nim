#[ tenpo pi toki pona
Calendar and clock for toki pona
By Albey Amakiir, 2021 ]#

import os, strutils, docopt
include tenpolib

const
  versionStr = "0.1-alpha"
  outputHelpEnglish = dedent """
    tenpo pi toki pona
    Outputs the current date and/or time in toki pona

    Usage:
      tenpo [options] [<longitude>]

    Options:
      -h --help      this helptext
      -v --version   version info
      -s             include day number
      -o             one-line output
    """


proc outputTenpo(tenpo: TenpoDate, inclSuno: bool = false) =
  echo "tenpo sike  ", $tenpo.sike
  echo "tenpo mun   ", monthName(tenpo.mun)
  if inclSuno:
    echo "tenpo suno  ", $tenpo.suno


proc outputTenpoBrief(tenpo: TenpoDate, separator: string, inclSuno: bool = false) =
  var output = $tenpo.sike & separator & monthName(tenpo.mun)
  if inclSuno:
    output = output & separator & $tenpo.suno
  echo output


proc main() =
  let args = docopt(outputHelpEnglish, version = versionStr)

  var inclSuno = args["-s"]
  var brief = args["-o"]
  var customLon = args["<longitude>"]
  var currentLon = 0.0
  if customLon:
    try:
      currentLon = parseFloat($args["<longitude>"]).normaliseLongitude()
    except ValueError:
      echo "Longitude invalid"
      return

  let timeInUTC = getTime().utc() + durationModifierByLon(currentLon)

  if brief:
    outputTenpoBrief(timeInUTC.tenpoDateSinceTime(), "/", inclSuno)
  else:
    outputTenpo(timeInUTC.tenpoDateSinceTime(), inclSuno)


main()

