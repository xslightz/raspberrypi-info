#system temperature
alias temp='/opt/vc/bin/vcgencmd measure_temp'

#maximum CPU frequence (e.g. when your CPU is under load)
alias cpu_max='sudo cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq'

#minimum CPU frequence (when your CPU is idle)
alias cpu_min='sudo cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq'

#current CPU frequence:
alias cpu_cur='sudo cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq'

#memory Shows details about your memory.
alias meminfo='cat /proc/meminfo'

#Shows the size and number of partitions on your SD card or hard drive.
alias partitions='cat /proc/partitions'

#Shows you which version of the Raspberry Pi you are using.
alias version='cat /proc/version'

#Shows cpu info how many cores and model i.e arm6 etc.
alias cpuinfo='cat /proc/cpuinfo'
