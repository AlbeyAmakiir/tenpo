include ../../src/tenpolib

for i in MunRange.low .. MunRange.high:
  for j in SunoRange.low .. SunoRange.high:
    if i == 13 or i mod 2 == 0:
      doAssert(isLastSunoOfMun(i, j) == (j == 30))
    else:
      doAssert(isLastSunoOfMun(i, j) == (j == 29))
