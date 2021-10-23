include ../../src/tenpolib

discard createValidTenpo(0, 12, 1)
discard createValidTenpo(1, 13, 1)
doAssertRaises(TenpoFormatError):
  discard createValidTenpo(0, 13, 1)
discard createValidTenpo(0, 1, 29)
discard createValidTenpo(0, 2, 30)
doAssertRaises(TenpoFormatError):
  discard createValidTenpo(0, 1, 30)
