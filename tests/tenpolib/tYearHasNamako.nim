include ../../src/tenpolib

for i in countup(0, 8*8, 8):
  doAssert(yearHasNamako(0+i) == false)
  doAssert(yearHasNamako(1+i) == true)
  doAssert(yearHasNamako(2+i) == false)
  doAssert(yearHasNamako(3+i) == false)
  doAssert(yearHasNamako(4+i) == true)
  doAssert(yearHasNamako(5+i) == false)
  doAssert(yearHasNamako(6+i) == true)
  doAssert(yearHasNamako(7+i) == false)

  doAssert(yearHasNamako(0-i) == false)
  doAssert(yearHasNamako(1-i) == true)
  doAssert(yearHasNamako(2-i) == false)
  doAssert(yearHasNamako(3-i) == false)
  doAssert(yearHasNamako(4-i) == true)
  doAssert(yearHasNamako(5-i) == false)
  doAssert(yearHasNamako(6-i) == true)
  doAssert(yearHasNamako(7-i) == false)
