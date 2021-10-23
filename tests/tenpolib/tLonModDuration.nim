include ../../src/tenpolib

doAssert(durationModifierByLon(0.0).inSeconds == 0)
doAssert(durationModifierByLon(10.0).inSeconds == secondsPerDay div 36)
doAssert(durationModifierByLon(-10.0).inSeconds == secondsPerDay div -36)
doAssert(durationModifierByLon(centerLongitude).inSeconds ==
    toInt(secondsPerDay / 360 * centerLongitude))
doAssert(durationModifierByLon(datelineLongitude - 1).inSeconds ==
    toInt(secondsPerDay / 360 * (datelineLongitude - 1)))
doAssert(durationModifierByLon(datelineLongitude + 1).inSeconds ==
    toInt(secondsPerDay / 360 * (datelineLongitude - 359)))
