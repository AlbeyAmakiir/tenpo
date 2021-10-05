#[ tenpo pi toki pona
Calendar and clock for toki pona
By Albey Amakiir, 2021 ]#

import os, strutils
include tenpolib


const
  version = "0.1-alpha"
  outputHelpEnglish = dedent """
    tenpo pi toki pona
    Outputs the current date and/or time in toki pona
    Usage: tenpo [flags]

    Flags:
      -h, --help     this helptext
      -v, --version  version info
      -s             include day number
      -o             one-line output
    """
  outputHelpTokiPona = dedent """
    tenpo pi toki pona
    ona li pana e sitelen tenpo pi toki pona
    kepeken: tenpo [ante]

    ante ale:
      -h, --help     sitelen awen ni
      -v, --version  nanpa pi nasin mi
      -s             tenpo suno kin
      -o             pana lon linja wan
    """

proc outputVersionInfo(inclTitle: bool = true) =
  if inclTitle:
    echo "tenpo pi toki pona"
  echo "v: " & version


proc outputHelp() =
  echo outputHelpEnglish
  outputVersionInfo(false)


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
  if paramCount() < 1:
    outputTenpo(getTime().utc().tenpoDateSinceTime(), false)
    return

  var inclSuno = false
  var brief = false
  var currentLon = 0.0

  if paramStr(1).startsWith("--"):
    let arg = paramStr(1)[2 .. ^1]
    case arg
    of "help":
      outputHelp()
    of "version":
      outputVersionInfo()
    else:
      echo "Argument " & arg & " not recognised\n"
      outputHelp()
    return

  if paramStr(1).startsWith("-"):
    let args = paramStr(1)[1 .. ^1]
    for ch in args:
      case ch
      of 'h':
        outputHelp()
        return
      of 'v':
        outputVersionInfo()
        return
      of 's':
        inclSuno = true
      of 'o':
        brief = true
      else:
        echo "Argument " & ch & " not recognised\n"
        outputHelp()
        return

  if paramCount() > 1:
    try:
      currentLon = paramStr(2).parseFloat()
    except ValueError:
      echo "Longitude invalid"
      return

  let timeInUTC = getTime().utc() + durationModifierByLon(currentLon)

  if brief:
    outputTenpoBrief(timeInUTC.tenpoDateSinceTime(), "/", inclSuno)
  else:
    outputTenpo(timeInUTC.tenpoDateSinceTime(), inclSuno)


main()

