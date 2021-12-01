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
	
echo Change CPU Mode to Sports Mode

# change CPU mode
echo 3 > /proc/cpufreq/cpufreq_power_mode
echo 1 > /proc/cpufreq/cpufreq_cci_mode
echo Done
echo
	
echo Change kernel mode to HMP Mode
	
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

#Game Touch Sampling
echo Enabling Game Touch Sampling Boost
	
#Game Touch Sampling
echo 1 > /proc/touchpanel/game_switch_enable
echo Done
echo

#CPUStune
echo CPU Tuning time
	
# CPU Load settings
echo 0-7 > /dev/cpuset/foreground/cpus
echo 0-3 > /dev/cpuset/background/cpus
echo 0-7 > /dev/cpuset/system-background/cpus
echo 0-7 > /dev/cpuset/top-app/cpus
echo 0 > /dev/cpuset/restricted/cpus
echo Done

sleep 40
echo 35 > /dev/stune/foreground/schedtune.boost
chmod 0444 /dev/stune/foreground/schedtune.boost
echo 35 > /dev/stune/schedtune.boost
chmod 0444 /dev/stune/schedtune.boost 
chmod 0444 /proc/cpufreq/cpufreq_cci_mode
chmod 0444 /proc/cpufreq/cpufreq_power_mode

echo This script made by @abaiik & @zidaneharith
echo Last updated : 12:31p.m. 16/10/2021
