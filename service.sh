# This script will be executed in late_start service mode
# More info in the main Magisk thread
stop logd
stop thermald

# GED modules
echo 1 >/sys/module/ged/parameters/gx_game_mode
echo 1 >/sys/module/ged/parameters/gx_force_cpu_boost
echo 1 > /sys/module/ged/parameters/boost_amp
echo 1 > /sys/module/ged/parameters/boost_extra
echo 1 > /sys/module/ged/parameters/boost_gpu_enable
echo 1 > /sys/module/ged/parameters/enable_cpu_boost
echo 1 > /sys/module/ged/parameters/enable_gpu_boost
echo 1 > /sys/module/ged/parameters/enable_game_self_frc_detect
echo 0 > /sys/module/ged/parameters/gpu_idle
echo GED Modules enabled
echo
	
# Set GPU Power Policy
echo 1 > /proc/mali/always_on

# change CPU mode
echo 3 > /proc/cpufreq/cpufreq_power_mode
echo 1 > /proc/cpufreq/cpufreq_cci_mode
	
# set sched to HMP
echo 0 > /sys/devices/system/cpu/eas/enable

# enable PPM
echo 1 > /proc/ppm/enabled
echo 0 1 > /proc/ppm/policy_status
echo 1 1 > /proc/ppm/policy_status
echo 2 1 > /proc/ppm/policy_status
echo 3 1 > /proc/ppm/policy_status
echo 4 1 > /proc/ppm/policy_status
echo 5 1 > /proc/ppm/policy_status
echo 6 1 > /proc/ppm/policy_status
echo 7 1 > /proc/ppm/policy_status
echo 8 1 > /proc/ppm/policy_status
echo 9 1 > /proc/ppm/policy_status

# increase performance
echo 1 > /sys/devices/system/cpu/perf/enable
	
# Game Touch Sampling
echo 0 > /sys/kernel/oppo_display/LCM_CABC
echo 1 > /proc/touchpanel/oppo_tp_direction
	
# Disable CABC 
echo 0 > /sys/kernel/oppo_display/cabc
	
# POWERHAL SPORT MODE
echo Add some games to sport mode
echo -e "com.mobile.legends\ncom.tencent.ig\ncom.miHoYo.GenshinImpact\ncom.tencent.tmgp.pubgmhd\ncom.dts.freefireth\ncom.dts.freefiremax\njp.konami.pesam\ncom.pubg.newstate\ncom.garena.game.codm\ncom.pubg.imobile\ncom.ea.gp.apexlegendsmobilefps\ncom.riotgames.league.wildrift\ncom.instagram.android\ncom.vng.pubgmobile\ncom.pubg.krmobile\ncom.rekoo.pubgm\ncom.roblox.client\ncom.google.android.youtube\ncom.GlobalSoFunny.Sausage\n" > /data/vendor/powerhal/smart

# CPU Load settings
echo 0-7 > /dev/cpuset/foreground/cpus
echo 0-3 > /dev/cpuset/background/cpus
echo 0-7 > /dev/cpuset/system-background/cpus
echo 0-7 > /dev/cpuset/top-app/cpus
echo 0 > /dev/cpuset/restricted/cpus

sleep 40
echo 35 > /dev/stune/foreground/schedtune.boost
chmod 0444 /dev/stune/foreground/schedtune.boost
echo 35 > /dev/stune/schedtune.boost
chmod 0444 /dev/stune/schedtune.boost 
chmod 0444 /proc/cpufreq/cpufreq_cci_mode
chmod 0444 /proc/cpufreq/cpufreq_power_mode

# This script made by @abaiik & @zidaneharith
# Last updated : 18:23p.m. 30/12/2021
