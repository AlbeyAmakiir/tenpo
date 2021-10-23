include ../../src/tenpolib

doAssert(TenpoDate(sike: 0, mun: 1, suno: 1) + DurationZero ==
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
      doAssert(prevDate != testDate)
      prevDate = prevDate + initDuration(days = 1)
      doAssert(testDate == TenpoDate(sike: h, mun: i, suno: j))
      doAssert(prevDate == TenpoDate(sike: h, mun: i, suno: j))
      dayCount += 1

doAssert(TenpoDate(sike: 0, mun: 2, suno: 1) + initDuration(days = -29) ==
    TenpoDate(sike: 0, mun: 1, suno: 1))
