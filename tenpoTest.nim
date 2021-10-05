include tenpolib

echo "\n------------------------"
echo "| Testing Tenpolib.nim |"
echo "------------------------"

const
  passText = "Passed."
  failText = " --FAILED--"

var passed = true

onFailedAssert(msg):
  passed = false
  echo msg


proc testDurationModifierByLon() =
  passed = true
  assert(durationModifierByLon(0.0).inSeconds == 0)
  assert(durationModifierByLon(10.0).inSeconds == secondsPerDay div 36)
  assert(durationModifierByLon(-10.0).inSeconds == secondsPerDay div -36)
  assert(durationModifierByLon(centerLongitude).inSeconds ==
      toInt(secondsPerDay / 360 * centerLongitude))
  assert(durationModifierByLon(datelineLongitude - 1).inSeconds ==
      toInt(secondsPerDay / 360 * (datelineLongitude - 1)))
  assert(durationModifierByLon(datelineLongitude + 1).inSeconds ==
      toInt(secondsPerDay / 360 * (datelineLongitude - 359)))
  echo "Test durationModifierByLon: ", if passed: passText else: failText

proc testYearHasNamako() =
  passed = true
  for i in countup(0, 8*8, 8):
    assert(yearHasNamako(0+i) == false)
    assert(yearHasNamako(1+i) == true)
    assert(yearHasNamako(2+i) == false)
    assert(yearHasNamako(3+i) == false)
    assert(yearHasNamako(4+i) == true)
    assert(yearHasNamako(5+i) == false)
    assert(yearHasNamako(6+i) == true)
    assert(yearHasNamako(7+i) == false)

    assert(yearHasNamako(0-i) == false)
    assert(yearHasNamako(1-i) == true)
    assert(yearHasNamako(2-i) == false)
    assert(yearHasNamako(3-i) == false)
    assert(yearHasNamako(4-i) == true)
    assert(yearHasNamako(5-i) == false)
    assert(yearHasNamako(6-i) == true)
    assert(yearHasNamako(7-i) == false)
  
  echo "Test yearHasNamako: ", if passed: passText else: failText

proc testMonthName() =
  passed = true
  assert(monthName(1) == "Wan")
  assert(monthName(2) == "Kon")
  assert(monthName(3) == "Seli")
  assert(monthName(4) == "Ma")
  assert(monthName(5) == "Telo")
  assert(monthName(6) == "Mama")
  assert(monthName(7) == "Kasi")
  assert(monthName(8) == "Pipi")
  assert(monthName(9) == "Kala")
  assert(monthName(10) == "Akesi")
  assert(monthName(11) == "Waso")
  assert(monthName(12) == "Soweli")
  assert(monthName(13) == "Namako")
  echo "Test monthName: ", if passed: passText else: failText

proc testDaysInYear() =
  passed = true
  for i in countup(0, 8*8, 8):
    assert(daysInYear(0+i) == 354)
    assert(daysInYear(1+i) == 384)
    assert(daysInYear(2+i) == 354)
    assert(daysInYear(3+i) == 354)
    assert(daysInYear(4+i) == 384)
    assert(daysInYear(5+i) == 354)
    assert(daysInYear(6+i) == 384)
    assert(daysInYear(7+i) == 354)

    assert(daysInYear(0-i) == 354)
    assert(daysInYear(1-i) == 384)
    assert(daysInYear(2-i) == 354)
    assert(daysInYear(3-i) == 354)
    assert(daysInYear(4-i) == 384)
    assert(daysInYear(5-i) == 354)
    assert(daysInYear(6-i) == 384)
    assert(daysInYear(7-i) == 354)

  echo "Test daysInYear: ", if passed: passText else: failText

proc testDaysInMonth() =
  passed = true
  for i in countup(1, 11, 2):
    assert(daysInMonth(i) == 29)
  for i in countup(2, 12, 2):
    assert(daysInMonth(i) == 30)
  assert(daysInMonth(13) == 30)
  echo "Test daysInMonth: ", if passed: passText else: failText

proc testIsLastSunoOfMun() =
  passed = true

  for i in MunRange.low .. MunRange.high:
    for j in SunoRange.low .. SunoRange.high:
      if i == 13 or i mod 2 == 0:
        assert(isLastSunoOfMun(i, j) == (j == 30))
      else:
        assert(isLastSunoOfMun(i, j) == (j == 29))

  echo "Test isLastSunoOfMun: ", if passed: passText else: failText

proc testDaysInYearSoFar() =
  passed = true
  
  for h in -2 .. 2:
    var days = 0
    for i in MunRange.low .. MunRange.high:
      if i == 13 and not yearHasNamako(h):
        continue
      for j in SunoRange.low .. SunoRange.high:
        if j > daysInMonth(i):
          continue
        days += 1
        assert(daysInYearSoFar(TenpoDate(sike: h, mun: i, suno: j)) == days)

  echo "Test daysInYearSoFar: ", if passed: passText else: failText

proc testDaysUntilNextSike() =
  passed = true

  for h in -2 .. 2:
    var days = 0
    for i in MunRange.low .. MunRange.high:
      if i == 13 and not yearHasNamako(h):
        continue
      for j in SunoRange.low .. SunoRange.high:
        if j > daysInMonth(i):
          continue
        days += 1
        assert(daysUntilNextSike(TenpoDate(sike: h, mun: i, suno: j)) ==
            daysInYear(h) - days)

  echo "Test daysUntilNextSike: ", if passed: passText else: failText

proc testCreateValidTenpo() =
  passed = true
  discard createValidTenpo(0, 12, 1)
  discard createValidTenpo(1, 13, 1)
  doAssertRaises(TenpoFormatError):
    discard createValidTenpo(0, 13, 1)
  discard createValidTenpo(0, 1, 29)
  discard createValidTenpo(0, 2, 30)
  doAssertRaises(TenpoFormatError):
    discard createValidTenpo(0, 1, 30)
  echo "Test createValidTenpo: ", if passed: passText else: failText

proc testTenpoEqualTo() =
  passed = true
  assert(TenpoDate(sike: 0, mun: 1, suno: 1) == TenpoDate(sike: 0, mun: 1, suno: 1))
  assert(TenpoDate(sike: 0, mun: 1, suno: 1) != TenpoDate(sike: 1, mun: 1, suno: 1))
  assert(TenpoDate(sike: 0, mun: 1, suno: 1) != TenpoDate(sike: 0, mun: 2, suno: 1))
  assert(TenpoDate(sike: 0, mun: 1, suno: 1) != TenpoDate(sike: 0, mun: 1, suno: 2))
  assert(TenpoDate(sike: -1, mun: 1, suno: 1) != TenpoDate(sike: 1, mun: 1, suno: 1))
  assert(TenpoDate(sike: 8765, mun: 11, suno: 24) == TenpoDate(sike: 8765, mun: 11, suno: 24))
  echo "Test TenpoDate == TenpoDate: ", if passed: passText else: failText

proc testTenpoPlusDays() =
  passed = true

  assert(TenpoDate(sike: 0, mun: 1, suno: 1) + DurationZero ==
      TenpoDate(sike: 0, mun: 1, suno: 1))

  var dayCount = 0
  var prevDate = TenpoDate(sike: -3, mun: 12, suno: 30)
  for h in -2 .. 2:
    for i in MunRange.low .. MunRange.high:
      if i == 13 and not yearHasNamako(h):
        continue
      for j in SunoRange.low .. SunoRange.high:
        if j > daysInMonth(i):
          continue
        let testDate = TenpoDate(sike: -2, mun: 1, suno: 1) + initDuration(days = dayCount)
        assert(prevDate != testDate)
        prevDate = prevDate + initDuration(days = 1)
        assert(testDate == TenpoDate(sike: h, mun: i, suno: j))
        assert(prevDate == TenpoDate(sike: h, mun: i, suno: j))
        dayCount += 1

  assert(TenpoDate(sike: 0, mun: 2, suno: 1) + initDuration(days = -29) ==
      TenpoDate(sike: 0, mun: 1, suno: 1))

  echo "Test TenpoDate + days: ", if passed: passText else: failText

proc testTenpoMinusDays() =
  passed = true

  assert(TenpoDate(sike: 0, mun: 1, suno: 1) - DurationZero ==
      TenpoDate(sike: 0, mun: 1, suno: 1))

  var dayCount = 0
  var prevDate = TenpoDate(sike: 3, mun: 1, suno: 1)
  for h in 2 .. -2:
    for i in MunRange.high .. MunRange.low:
      if i == 13 and not yearHasNamako(h):
        continue
      for j in SunoRange.high .. SunoRange.low:
        if j > daysInMonth(i):
          continue
        let testDate = TenpoDate(sike: -2, mun: 1, suno: 1) - initDuration(days = dayCount)
        assert(prevDate != testDate)
        prevDate = prevDate - initDuration(days = 1)
        assert(testDate == TenpoDate(sike: h, mun: i, suno: j))
        assert(prevDate == TenpoDate(sike: h, mun: i, suno: j))
        dayCount += 1

  assert(TenpoDate(sike: 0, mun: 1, suno: 1) - initDuration(days = -29) ==
      TenpoDate(sike: 0, mun: 2, suno: 1))

  echo "Test TenpoDate - days: ", if passed: passText else: failText

proc testTenpoDateSinceTime() =
  passed = true

  var dayCount = 0
  for h in 0 .. 4:
    for i in MunRange.low .. MunRange.high:
      if i == 13 and not yearHasNamako(h):
        continue
      for j in SunoRange.low .. SunoRange.high:
        if j > daysInMonth(i):
          continue
        let testDate = tenpoDateSinceTime(timeBegin + dayCount.days)
        assert(testDate == TenpoDate(sike: h, mun: i, suno: j))
        dayCount += 1

  echo "Test tenpoDateSinceTime: ", if passed: passText else: failText

proc testTemplate() =
  passed = true
  assert(false)
  echo "Test template: ", if passed: passText else: failText


testDurationModifierByLon()

testYearHasNamako()
testMonthName()
testDaysInYear()
testDaysInMonth()
testIsLastSunoOfMun()
testDaysInYearSoFar()
testDaysUntilNextSike()
testCreateValidTenpo()

testTenpoEqualTo()
testTenpoPlusDays()
testTenpoMinusDays()

testTenpoDateSinceTime()
echo ""



