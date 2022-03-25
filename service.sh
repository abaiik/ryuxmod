# This script will be executed in late_start service mode
# More info in the main Magisk thread
stop logd
stop thermald

# GED Modules
echo 1 >/sys/module/ged/parameters/gx_game_mode
echo 1 >/sys/module/ged/parameters/gx_force_cpu_boost
echo 1 > /sys/module/ged/parameters/boost_amp
echo 1 > /sys/module/ged/parameters/boost_extra
echo 1 > /sys/module/ged/parameters/boost_gpu_enable
echo 1 > /sys/module/ged/parameters/enable_cpu_boost
echo 1 > /sys/module/ged/parameters/enable_gpu_boost
echo 1 > /sys/module/ged/parameters/enable_game_self_frc_detect
echo 10 > /sys/module/ged/parameters/gpu_idle
echo 100 > /sys/module/ged/parameters/cpu_boost_policy
echo 0 > /sys/module/ged/parameters/ged_force_mdp_enable
echo 1 > /sys/module/ged/parameters/ged_boost_enable
echo 100 > /sys/module/ged/parameters/ged_smart_boost
echo 1 > /sys/module/ged/parameters/gx_frc_mode
echo 1 > /sys/module/ged/parameters/gx_boost_on
echo GED Modules enabled
echo
	
# Set GPU Power Policy
echo 1 > /proc/mali/always_on

# change CPU mode
echo 3 > /proc/cpufreq/cpufreq_power_mode
echo 1 > /proc/cpufreq/cpufreq_cci_mode
	
# set sched to HMP
echo 0 > /sys/devices/system/cpu/eas/enable

# increase performance
echo 1 > /sys/devices/system/cpu/perf/enable

# PPM
echo 1 > /proc/ppm/enabled
echo 0 0 > /proc/ppm/policy_status
echo 1 1 > /proc/ppm/policy_status
echo 2 0 > /proc/ppm/policy_status
echo 3 0 > /proc/ppm/policy_status
echo 4 0 > /proc/ppm/policy_status
echo 5 0 > /proc/ppm/policy_status
echo 6 1 > /proc/ppm/policy_status
echo 7 1 > /proc/ppm/policy_status
echo 8 0 > /proc/ppm/policy_status
echo 9 1 > /proc/ppm/policy_status

# Game Touch Sampling
echo Enabling Game Touch Sampling Boost
echo 1 > /proc/touchpanel/game_switch_enable

# Fix Touch Screen
echo Fix Touch Screen by enable Oplus TP Direction and disable limit
echo 1 > /proc/touchpanel/oplus_tp_direction
echo 0 > /proc/touchpanel/oplus_tp_limit_enable
	
# Disable CABC 
echo Disable CABC Mode for best experience
echo 0 > /sys/kernel/oppo_display/LCM_CABC
	
# Disable some debugging
echo 0 > /sys/kernel/ccci/debug
	
# POWERHAL SPORT MODE
echo Add some games to sport mode
echo -e "com.mobile.legends\ncom.tencent.ig\ncom.miHoYo.GenshinImpact\ncom.tencent.tmgp.pubgmhd\ncom.dts.freefireth\ncom.dts.freefiremax\njp.konami.pesam\ncom.pubg.newstate\ncom.garena.game.codm\ncom.pubg.imobile\ncom.ea.gp.apexlegendsmobilefps\ncom.riotgames.league.wildrift\ncom.instagram.android\ncom.vng.pubgmobile\ncom.pubg.krmobile\ncom.rekoo.pubgm\ncom.roblox.client\ncom.google.android.youtube\ncom.GlobalSoFunny.Sausage\nskynet.cputhrottlingtest\ncom.neptune.domino\nid.dana\ncom.shopee.id\n" > /data/vendor/powerhal/smart

# CPU Load settings
echo 0-7 > /dev/cpuset/foreground/cpus
echo 0-2 > /dev/cpuset/background/cpus
echo 0-5 > /dev/cpuset/system-background/cpus
echo 0-7 > /dev/cpuset/top-app/cpus
echo 0 > /dev/cpuset/restricted/cpus
	
# Realtime
echo 0 > /dev/stune/rt/schedtune.boost
echo 1 > /dev/stune/rt/schedtune.prefer_idle
	
# Background
echo 0 > /dev/stune/background/schedtune.util.max.effective
echo 0 > /dev/stune/background/schedtune.util.min.effective
echo 0 > /dev/stune/background/schedtune.util.max
echo 0 > /dev/stune/background/schedtune.util.min
echo 0 > /dev/stune/background/schedtune.boost
echo 0 > /dev/stune/background/schedtune.prefer_idle
	
# Foreground
echo 1024 > /dev/stune/foreground/schedtune.util.max.effective
echo 0 > /dev/stune/foreground/schedtune.util.min.effective
echo 1024 > /dev/stune/foreground/schedtune.util.max
echo 0 > /dev/stune/foreground/schedtune.util.min
echo 0 > /dev/stune/foreground/schedtune.boost
echo 1 > /dev/stune/foreground/schedtune.prefer_idle
	
# Top-App
echo 1024 > /dev/stune/top-app/schedtune.util.max.effective
echo 0 > /dev/stune/top-app/schedtune.util.min.effective
echo 1024 > /dev/stune/top-app/schedtune.util.max
echo 0 > /dev/stune/top-app/schedtune.util.min
echo 0 > /dev/stune/top-app/schedtune.boost
echo 1 > /dev/stune/top-app/schedtune.prefer_idle
	
# Global
echo 0 > /dev/stune/schedtune.util.min
echo 1024 > /dev/stune/schedtune.util.max
echo 1024 > /dev/stune/schedtune.util.max.effective
echo 0 > /dev/stune/schedtune.util.min.effective
echo 0 > /dev/stune/schedtune.boost
echo 1 > /dev/stune/schedtune.prefer_idle
echo Done
echo
	

# This script made by @abaiik & @zidaneharith
# Last updated : 18:23p.m. 30/12/2021
