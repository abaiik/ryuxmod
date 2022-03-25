#!/system/bin/sh

## Common-default settings
# GED modules
echo 0 > /sys/module/ged/parameters/gx_game_mode
echo 0 > /sys/module/ged/parameters/gx_force_cpu_boost
echo 0 > /sys/module/ged/parameters/boost_amp
echo 0 > /sys/module/ged/parameters/boost_extra
echo 0 > /sys/module/ged/parameters/boost_gpu_enable
echo 0 > /sys/module/ged/parameters/enable_cpu_boost
echo 0 > /sys/module/ged/parameters/enable_gpu_boost
echo 0 > /sys/module/ged/parameters/enable_game_self_frc_detect
echo 100 > /sys/module/ged/parameters/gpu_idle
echo 0 > /sys/module/ged/parameters/cpu_boost_policy
echo 0 > /sys/module/ged/parameters/ged_force_mdp_enable
echo 0 > /sys/module/ged/parameters/ged_boost_enable
echo 0 > /sys/module/ged/parameters/ged_smart_boost
echo 0 > /sys/module/ged/parameters/gx_frc_mode
echo 0 > /sys/module/ged/parameters/gx_boost_on

# CPU Mode
echo 0 > /proc/cpufreq/cpufreq_power_mode
echo 0 > /proc/cpufreq/cpufreq_cci_mode

# Sched
echo 2 > /sys/devices/system/cpu/eas/enable

# Scheduler I/O
echo cfq > /sys/block/mmcblk0/queue/scheduler
echo 0 > /sys/devices/system/cpu/perf/enable

# GPU frequency
echo 0 > /proc/gpufreq/gpufreq_opp_freq
echo 0 > /sys/module/ged/parameters/gpu_cust_boost_freq

# GPU Power Policy
echo 0 > /proc/mali/always_on
echo coarse_demand > /sys/devices/platform/13040000.mali/power_policy

# PPM
echo 0 > /proc/ppm/enabled

# Governor
echo schedutil > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
echo schedutil > /sys/devices/system/cpu/cpufreq/policy6/scaling_governor

# CPU frequency
# big cluster
echo 1 -1 > /proc/ppm/policy/hard_userlimit_max_cpu_freq
echo 1 -1 > /proc/ppm/policy/hard_userlimit_min_cpu_freq
# little cluster
echo 0 -1 > /proc/ppm/policy/hard_userlimit_max_cpu_freq
echo 0 -1 > /proc/ppm/policy/hard_userlimit_min_cpu_freq

# Game Touch Sampling
echo 1 > /proc/touchpanel/game_switch_enable

# fix touch screen
echo 1 > /proc/touchpanel/oplus_tp_direction
echo 0 > /proc/touchpanel/oplus_tp_limit_enable

# Logcat
start logd

# TCP
echo westwood > /proc/sys/net/ipv4/tcp_congestion_control
echo 1 > /proc/sys/net/ipv4/tcp_low_latency

# VM
echo 1 > /proc/sys/vm/drop_caches

# CPUStune
# CPU Load
echo 0-7 > /dev/cpuset/foreground/cpus
echo 0-4 > /dev/cpuset/background/cpus
echo 0-7 > /dev/cpuset/system-background/cpus
echo 0-7 > /dev/cpuset/top-app/cpus
echo 0-7 > /dev/cpuset/restricted/cpus
# Realtime
echo 0 > /dev/stune/rt/schedtune.boost
echo 0 > /dev/stune/rt/schedtune.prefer_idle
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
echo 0 > /dev/stune/foreground/schedtune.prefer_idle
# Top-App
echo 1024 > /dev/stune/top-app/schedtune.util.max.effective
echo 0 > /dev/stune/top-app/schedtune.util.min.effective
echo 1024 > /dev/stune/top-app/schedtune.util.max
echo 0 > /dev/stune/top-app/schedtune.util.min
echo 0 > /dev/stune/top-app/schedtune.boost
echo 0 > /dev/stune/top-app/schedtune.prefer_idle
# Global
echo 1024 > /dev/stune/schedtune.util.max.effective
echo 0 > /dev/stune/schedtune.util.min.effective
echo 1024 > /dev/stune/schedtune.util.max
echo 0 > /dev/stune/schedtune.util.min
echo 0 > /dev/stune/schedtune.boost
echo 0 > /dev/stune/schedtune.prefer_idle

case $1 in
0)
	## Balanced profile(use all default settings)
	;;
1)
	## Power saving profile
	# CPU Mode
	echo 1 > /proc/cpufreq/cpufreq_power_mode

	# Sched
	echo 1 > /sys/devices/system/cpu/eas/enable

  	# GPU frequency
	echo 270000 > /proc/gpufreq/gpufreq_opp_freq
	echo 270000 > /sys/module/ged/parameters/gpu_cust_boost_freq

	# PPM
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

	# CPU frequency
	# big cluster
	echo 1 1002000 > /proc/ppm/policy/hard_userlimit_max_cpu_freq
	echo 1 774000 > /proc/ppm/policy/hard_userlimit_min_cpu_freq
	# little cluster
	echo 0 1075000 > /proc/ppm/policy/hard_userlimit_max_cpu_freq
	echo 0 500000 > /proc/ppm/policy/hard_userlimit_min_cpu_freq

	# Game Touch Sampling
	echo 0 > /proc/touchpanel/game_switch_enable

	# Disabe CABC
	echo 0 > /sys/kernel/oppo_display/LCM_CABC

	# Logcat
	stop logd

	# CPUStune
	# CPU Load
	echo 0-5 > /dev/cpuset/background/cpus
	echo 0 > /dev/cpuset/restricted/cpus
	;;
2)
	## Performance profile
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
	echo 1 > /sys/module/ged/parameters/ged_boost_enable
	echo 100 > /sys/module/ged/parameters/ged_smart_boost
	echo 1 > /sys/module/ged/parameters/gx_frc_mode
	echo 1 > /sys/module/ged/parameters/gx_boost_on

	# CPU mode
	echo 3 > /proc/cpufreq/cpufreq_power_mode
	echo 1 > /proc/cpufreq/cpufreq_cci_mode

	# Sched
	echo 0 > /sys/devices/system/cpu/eas/enable

	# Scheduler I/O
	echo deadline > /sys/block/mmcblk0/queue/scheduler
	# increase performance
	echo 1 > /sys/devices/system/cpu/perf/enable

	# GPU frequency
	echo 806000 > /proc/gpufreq/gpufreq_opp_freq
	#echo 0 > /sys/module/ged/parameters/gpu_cust_boost_freq

	# GPU Power Policy
	echo 1 > /proc/mali/always_on
	echo always_on > /sys/devices/platform/13040000.mali/power_policy

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

	# Governor
	echo performance > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
	echo performance > /sys/devices/system/cpu/cpufreq/policy6/scaling_governor

	# CPU frequency
	# big cluster
	echo 1 2050000 > /proc/ppm/policy/hard_userlimit_max_cpu_freq
	echo 1 2050000 > /proc/ppm/policy/hard_userlimit_min_cpu_freq
	# little cluster
	echo 0 2000000 > /proc/ppm/policy/hard_userlimit_max_cpu_freq
	echo 0 2000000 > /proc/ppm/policy/hard_userlimit_min_cpu_freq

	# Disable CABC 
	echo 0 > /sys/kernel/oppo_display/LCM_CABC
	
	# Debugging
	echo 0 > /sys/kernel/ccci/debug

	# POWERHAL SPORT MODE
	echo -e "com.mobile.legends\ncom.tencent.ig\ncom.miHoYo.GenshinImpact\ncom.tencent.tmgp.pubgmhd\ncom.dts.freefireth\ncom.dts.freefiremax\njp.konami.pesam\ncom.pubg.newstate\ncom.garena.game.codm\ncom.pubg.imobile\ncom.ea.gp.apexlegendsmobilefps\ncom.riotgames.league.wildrift\ncom.instagram.android\ncom.vng.pubgmobile\ncom.pubg.krmobile\ncom.rekoo.pubgm\ncom.roblox.client\ncom.google.android.youtube\ncom.GlobalSoFunny.Sausage\nskynet.cputhrottlingtest\ncom.neptune.domino\nid.dana\ncom.shopee.id\n" > /data/vendor/powerhal/smart

	# Logcat
	stop logd

	# TCP
	echo cubic > /proc/sys/net/ipv4/tcp_congestion_control

	# VM
	echo 3 > /proc/sys/vm/drop_caches

	# CPUStune
	# CPU Load settings
	echo 0-2 > /dev/cpuset/background/cpus
	echo 0-5 > /dev/cpuset/system-background/cpus
	echo 0 > /dev/cpuset/restricted/cpus
	# Realtime
	echo 1 > /dev/stune/rt/schedtune.prefer_idle
	# Background
	echo 0 > /dev/stune/background/schedtune.prefer_idle
	# Top-App
	echo 1 > /dev/stune/top-app/schedtune.prefer_idle
	# Global
	echo 1 > /dev/stune/schedtune.prefer_idle
	;;
esac
