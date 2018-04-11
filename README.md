# RaspBerry PI

[![Raspberry pi](http://excdn.pw/img/raspberry-logo.png)]

A collection of commands I have found that has helped me and thought I’d share.

## Install Net Core 2.0

  - If you run PTMagic or PT Feeder you need Net Core 2.0 the easiest way is to install [Profit-PI]  OS which has the necessary tools, how to flash your SD card insctructions can be found [here][ptwikipi] otherwise, you may install it manually by following these commands.


	1. sudo apt-get install curl libunwind8 gettext > Install three prerequiste packages
	2. curl -sSL -o dotnet.tar.gz https://dotnetcli.blob.core.windows.net/dotnet/Runtime/2.0.4/dotnet-runtime-2.0.4-linux-arm.tar.gz > Download the latest .NET Core Runtime currently working with PTMagic
	3. sudo mkdir -p /opt/dotnet && sudo tar zxf dotnet-runtime-2.0.4-linux-arm.tar.gz -C /opt/dotnet > Create a destination folder and extract the downloaded package into it
	4. sudo ln -s /opt/dotnet/dotnet /usr/local/bin > Test the installation
	5. dotnet --help

Additional; if you want to monitor the bandwidth usage. Install vnstat by executing this command.

### install vnstat
```
sudo apt-get install vnstat
```

Just run “vnstat” without the quotes and it should output the traffic data. If you get and error saying insufficient data, just type: 
```sudo vnstat –u```

If you are using wi-fi you might see that the interface “eth0” has no data and we should remove the database so vnstat won’t monitor it. We do this by typing:
``` 
sudo rm /var/lib/vnstat/eth0
sudo rm /var/lib/vnstat/.eth0
sudo service vnstat restart
```

# Aliases

First let's talk about aliases, using an alias is cool and less time consuming at least for the commands you use frequently. The simple function of an alias is running a long by simply typing a small one.

Example this:

```
/opt/vc/bin/vcgencmd measure_temp```

into this;
```
pi@pihole:~ $ temp
temp=34.7'C
```

I have added the .bash_alias with some useful commands in case you overclock your RPI or you can do it manually by executing this command.

```
nano .bash_aliases

#paste these lines inside .bash_aliases

#system temperature
alias temp='/opt/vc/bin/vcgencmd measure_temp'

#maximum CPU frequence (e.g. when your CPU is under load)
alias cpu_max='sudo cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq'

#minimum CPU frequence (when your CPU is idle)
alias cpu_min='sudo cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq'

#current CPU frequence:
alias cpu_cur='sudo cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq'

#ctrl + x to save and run source command
source .bash_aliases

commands:
pi@pihole:~ $ cpu_max
700000
pi@pihole:~ $ cpu_cur
700000
pi@pihole:~ $ cpu_min
700000
pi@pihole:~ $ temp
temp=34.7'C
```

You may add your own aliases just follow the examples short_name=’long command here’ remember to run ``` source .bash_aliases``` or log out and log back in.

# Commands

[Profit-PI]: <https://github.com/CryptoGnome/Profit-Pi>
[ptwikipi]: <https://wiki.profittrailer.com/doku.php?id=raspberry_pi_guide#requirements>
