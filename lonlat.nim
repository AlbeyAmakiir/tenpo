#[ Longitude and latitude nim library
By Albey Amakiir ]#

type
  Latitude* = range[-90.0..90.0]
  Coords* = tuple
    lon: float
    lat: Latitude

func normaliseLongitude*(longitude: float): float =
  if longitude <= -180.0: longitude + 360.0
  elif longitude > 180.0: longitude - 360.0
  else: longitude

func normaliseCoords*(lonlat: Coords): Coords =
  (lonlat.lon.normaliseLongitude, lonlat.lat)


