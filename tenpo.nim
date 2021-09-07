#[ tenpo pi toki pona
Calendar and clock for toki pona
By Albey Amakiir ]#

import times#, math

type
  SikeCycleRange = range[0..7]
  MunRange = range[1..13]
  SunoRange = range[1..30]

  TenpoDate = object 
    sike: int
    mun: MunRange
    suno: SunoRange

  TenpoFormatError = object of ValueError

const
  sunoPerCycle = 2922
  namakoYears = [1, 4, 6, -2, -4, -7]
  monthNames = ["Wan", "Kon", "Seli", "Ma", "Telo", "Mama",
    "Kasi", "Pipi", "Kala", "Akesi", "Waso", "Soweli",
    "Namako"]
  tenpoOpen = TenpoDate(sike: 0, mun: 1, suno: 1)

let
  # When we have lon-lat, we can work out the actual time. It won't be let.
  sunset = 18.hours
  timeBegin = times.initDateTime(26, mMar, 2001, 0, 0, 0, utc()) + sunset

func yearHasNamako(year: int): bool = (year mod 8) in namakoYears
func monthName(month: MunRange): string = monthNames[month - 1]
func daysInYear(year: int): int = (if yearHasNamako(year): 384 else: 354)

func daysInMonth(month: MunRange): int =
  if month mod 2 == 0 or month == 13:
    return 30
  return 29
proc isLastSunoOfMun(mun: MunRange, suno: SunoRange): bool = suno == daysInMonth(mun)


# Inclusive of the current day
func daysInYearSoFar(tenpo: TenpoDate): int =
  result = tenpo.suno

  if tenpo.mun > 1:
    for i in 1 .. tenpo.mun - 1:
      result += daysInMonth(i)
    

proc daysUntilNextSike(tenpo: TenpoDate): int =
  daysInYear(tenpo.sike) - daysInYearSoFar(tenpo)


func `-`(tenpo: TenpoDate, duration: Duration): TenpoDate

func `+`(tenpo: TenpoDate, duration: Duration): TenpoDate =
  if duration == DurationZero:
    return tenpo
  if duration < DurationZero:
    return tenpo - (DurationZero - duration)

  var dayCount = duration.inDays
  var newTenpo = tenpo

  # Avoid impossible dates by setting to the start of this year
  dayCount += int64(daysInYearSoFar(newTenpo) - 1)
  newTenpo.mun = 1
  newTenpo.suno = 1

  # Full cycles are always the same number of days
  let cycles = int(dayCount div sunoPerCycle)
  if cycles >= 1:
    newTenpo.sike += 8 * cycles
    dayCount -= int64(sunoPerCycle * cycles)

  while dayCount >= daysInYear(newTenpo.sike):
    dayCount -= daysInYear(newTenpo.sike).int64
    newTenpo.sike += 1

  while dayCount >= daysInMonth(newTenpo.mun):
    dayCount -= daysInMonth(newTenpo.mun).int64
    newTenpo.mun += 1

  if dayCount > 0:
    newTenpo.suno += dayCount.int

  return newTenpo


func `-`(tenpo: TenpoDate, duration: Duration): TenpoDate =
  if duration == DurationZero:
    return tenpo
  if duration < DurationZero:
    return tenpo + (DurationZero - duration)

  var dayCount = duration.inDays
  var newTenpo = tenpo

  # Full cycles are always the same number of days
  let cycles = int(dayCount div sunoPerCycle)
  if cycles >= 1:
    newTenpo.sike -= 8 * cycles
    dayCount -= int64(sunoPerCycle * cycles)

  # Avoid impossible dates by setting to the start of this year
  dayCount -= int64(daysInYearSoFar(newTenpo) - 1)
  newTenpo.mun = 1
  newTenpo.suno = 1

  while dayCount > 0:
    dayCount -= daysInYear(newTenpo.sike - 1).int64
    newTenpo.sike -= 1

  if dayCount == 0:
    return newTenpo
  return newTenpo + initDuration(days = -dayCount)


func `==`(tenpoA: TenpoDate, tenpoB: TenpoDate): bool =
  return tenpoA.sike == tenpoB.sike and
      tenpoA.mun == tenpoB.mun and
      tenpoA.suno == tenpoB.suno


proc createValidTenpo(sike: int, mun: MunRange, suno: SunoRange): TenpoDate =
  if mun == 13 and not yearHasNamako(sike):
    raise newException(TenpoFormatError, "Year " & $sike & " can not have month 13.")

  if suno > daysInMonth(mun):
    raise newException(TenpoFormatError, "Month " & $mun & " can not have day 30.")

  return TenpoDate(sike: sike, mun: mun, suno: suno)


proc timeSinceStart(time: DateTime): Duration = time - timeBegin
proc tenpoDateSinceTime(time: DateTime): TenpoDate = tenpoOpen + timeSinceStart(time)


proc outputTenpo(tenpo: TenpoDate, flags: bool = false) =
  echo "tenpo sike  ", $tenpo.sike
  echo "tenpo mun   ", monthName(tenpo.mun)
  if flags:
    echo "tenpo suno  ", $tenpo.suno




