# This script will be executed in late_start service mode
# More info in the main Magisk thread
stop logd
stop thermald
echo 3 > /proc/cpufreq/cpufreq_power_mode
echo 0 > /proc/cpufreq/cpufreq_imax_enable
echo 0 > /proc/cpufreq/cpufreq_imax_thermal_protect
echo 1 > /sys/module/ged/parameters/boost_gpu_enable
echo 1 > /sys/module/ged/parameters/gx_force_cpu_boost
echo 1 > /sys/module/ged/parameters/boost_extra
echo 1 >/sys/module/ged/parameters/gx_game_mode
echo 1 > /sys/module/ged/parameters/boost_amp
echo 1 > /sys/module/ged/parameters/enable_cpu_boost
echo 1 > /sys/module/ged/parameters/enable_gpu_boost
echo 1 > /sys/module/ged/parameters/enable_game_self_frc_detect
echo 0 > /sys/module/ged/parameters/gpu_idle

# Touch Sampling
echo Enabling Game Touch Sampling Boost
echo 1 > /proc/touchpanel/game_switch_enable

# CPU Load settings
echo 0-7 > /dev/cpuset/foreground/cpus
echo 0-3 > /dev/cpuset/background/cpus
echo 0-7 > /dev/cpuset/system-background/cpus
echo 0-7 > /dev/cpuset/top-app/cpus
echo 0 > /dev/cpuset/restricted/cpus
    
# 5GB Zram
swapoff /dev/block/zram0
echo 1 > /sys/block/zram0/reset
echo 5394967296 > /sys/block/zram0/disksize
echo 50 > /proc/sys/vm/direct_swappiness
busybox mkswap /dev/block/zram0
busybox swapon /dev/block/zram0

sleep 40
echo 35 > /dev/stune/foreground/schedtune.boost
chmod 0444 /dev/stune/foreground/schedtune.boost
echo 35 > /dev/stune/schedtune.boost
chmod 0444 /dev/stune/schedtune.boost 
echo 1 > /proc/cpufreq/cpufreq_cci_mode
chmod 0444 /proc/cpufreq/cpufreq_cci_mode
chmod 0444 /proc/cpufreq/cpufreq_power_mode
