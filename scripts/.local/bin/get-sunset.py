#!/usr/bin/env python3

import datetime
from dateutil import tz
from suntime import Sun, SunTimeException

# Frauenfeld coordinates
lat = 47.56
lon = 8.89
sun = Sun(lat, lon)

try:
    # Get today's sunrise and sunset in UTC
    today_sr = sun.get_sunrise_time(time_zone=tz.gettz("Europe/Zurich"))
    today_ss = sun.get_sunset_time(time_zone=tz.gettz("Europe/Zurich"))
    print(today_ss.strftime('%H:%M'))

except SunTimeException as e:
    print("Error: {0}.".format(e))
