#
# Touchscreen sensor driver
#
# https://forum.xda-developers.com/essential-phone/themes/mata-tochfix-t3916652
#
# https://reiryuki.blogspot.com/2020/08/how-to-configure-your-android.html
#
# https://forum.xda-developers.com/t/possible-fix-for-touchscreen-issues-misses-updated-08-29.3172100/
#
# https://gist.github.com/ardX/1742895
#
# source from link above

# @droid

device.internal = 1
touch.deviceType = touchScreen
touch.orientationAware = 1
touch.filter.level=2

# Size
touch.size.calibration = diameter
touch.size.scale = 1.011925
touch.size.bias = -11.988075
touch.toolSize.isSummed = 0
touch.touchSize.calibration = pressure

# Pressure
touch.pressure.calibration = amplitude
touch.pressure.source = default
touch.pressure.scale = 0.00000125
MultitouchMinDistance= 0.5px
MultitouchSettleInterval= 0.1ms


# Orientation
touch.orientation.calibration = interpolated
touch.distance.calibration = none
touch.distance.scale = 0
touch.coverage.calibration= box
touch.gestureMode = spots
touch.gestureMode = pointer
SurfaceOrientation = 0
TapInterva l= 0.1ms
TapDragInterval = 0.1ms
QuietInterval = 0.1ms
MovementSpeedRatio = 0.8
TapSlop = 0.5px

# tool
touch.toolSize.calibration = area
touch.toolSize.areaScale = 22
touch.toolSize.areaBias = 0
touch.toolSize.linearScale = 6
touch.toolSize.linearBias = 0
touch.toolSize.isSummed = 0

# Sliding
windowsmgr.max_events_per_sec = 180
view.scroll_friction = 10
ro.min_pointer_dur = 4
ro.max.fling_velocity = 18000
ro.min.fling_velocity = 6000

#input dispatcher
KeyRepeatDelay = 0
KeyRepeatTimeout = 0