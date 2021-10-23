include ../../src/tenpolib

for h in -2 .. 2:
  var days = 0
  for i in MunRange.low .. MunRange.high:
    if i == 13 and not yearHasNamako(h):
      continue
    for j in SunoRange.low .. SunoRange.high:
      if j > daysInMonth(i):
        continue
      days += 1
      doAssert(daysUntilNextSike(TenpoDate(sike: h, mun: i, suno: j)) ==
          daysInYear(h) - days)
