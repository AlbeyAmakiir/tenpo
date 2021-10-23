include ../../src/tenpolib

var dayCount = 0
for h in 0 .. 4:
  for i in MunRange.low .. MunRange.high:
    if i == 13 and not yearHasNamako(h):
      continue
    for j in SunoRange.low .. SunoRange.high:
      if j > daysInMonth(i):
        continue
      let testDate = tenpoDateSinceTime(timeBegin + dayCount.days)
      doAssert(testDate == TenpoDate(sike: h, mun: i, suno: j))
      dayCount += 1
