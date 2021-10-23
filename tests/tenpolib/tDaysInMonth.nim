include ../../src/tenpolib

for i in countup(1, 11, 2):
  doAssert(daysInMonth(i) == 29)
for i in countup(2, 12, 2):
  doAssert(daysInMonth(i) == 30)
doAssert(daysInMonth(13) == 30)
