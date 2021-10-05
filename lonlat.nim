#[ Longitude and latitude nim library
By Albey Amakiir ]#

import math

type
  Latitude* = range[-90.0..90.0]
  Coords* = tuple
    lon: float
    lat: Latitude

func normaliseLongitude*(longitude: float): float =
  case longitude.classify()
  of fcInf, fcNegInf, fcNan, fcNegZero, fcSubnormal:
    return 0.0
  else:
    discard

  let lon = longitude mod 360.0
  if lon <= -180.0: lon + 360.0
  elif lon > 180.0: lon - 360.0
  else: lon

func normaliseCoords*(lonlat: Coords): Coords =
  (lonlat.lon.normaliseLongitude, lonlat.lat)


