include ../../src/tenpolib

for i in countup(0, 8*8, 8):
  doAssert(daysInYear(0+i) == 354)
  doAssert(daysInYear(1+i) == 384)
  doAssert(daysInYear(2+i) == 354)
  doAssert(daysInYear(3+i) == 354)
  doAssert(daysInYear(4+i) == 384)
  doAssert(daysInYear(5+i) == 354)
  doAssert(daysInYear(6+i) == 384)
  doAssert(daysInYear(7+i) == 354)

  doAssert(daysInYear(0-i) == 354)
  doAssert(daysInYear(1-i) == 384)
  doAssert(daysInYear(2-i) == 354)
  doAssert(daysInYear(3-i) == 354)
  doAssert(daysInYear(4-i) == 384)
  doAssert(daysInYear(5-i) == 354)
  doAssert(daysInYear(6-i) == 384)
  doAssert(daysInYear(7-i) == 354)
