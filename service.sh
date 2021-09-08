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

# 5GB Zram

swapoff /dev/block/zram0

echo 1 > /sys/block/zram0/reset

echo 5394967296 > /sys/block/zram0/disksize

echo 50 > /proc/sys/vm/direct_swappiness

busybox mkswap /dev/block/zram0

busybox swapon /dev/block/zram0

sleep 40

echo 1 > /proc/cpufreq/cpufreq_cci_mode

chmod 0444 /proc/cpufreq/cpufreq_cci_mode

chmod 0444 /proc/cpufreq/cpufreq_power_mode
