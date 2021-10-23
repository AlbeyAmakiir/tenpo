include ../../src/tenpolib

doAssert(TenpoDate(sike: 0, mun: 1, suno: 1) == TenpoDate(sike: 0, mun: 1, suno: 1))
doAssert(TenpoDate(sike: 0, mun: 1, suno: 1) != TenpoDate(sike: 1, mun: 1, suno: 1))
doAssert(TenpoDate(sike: 0, mun: 1, suno: 1) != TenpoDate(sike: 0, mun: 2, suno: 1))
doAssert(TenpoDate(sike: 0, mun: 1, suno: 1) != TenpoDate(sike: 0, mun: 1, suno: 2))
doAssert(TenpoDate(sike: -1, mun: 1, suno: 1) != TenpoDate(sike: 1, mun: 1, suno: 1))
doAssert(TenpoDate(sike: 8765, mun: 11, suno: 24) == TenpoDate(sike: 8765, mun: 11, suno: 24))
