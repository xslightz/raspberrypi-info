# RaspBerry PI

[![Raspberry pi](http://excdn.pw/img/raspberry-logo.png)]

A collection of commands I have found that has helped me and thought I’d share.

## Install Net Core 2.0

  - If you run PTMagic or PT Feeder you need Net Core 2.0 the easiest way is to install [Profit-PI]  OS which has the necessary tools, how to flash your SD card insctructions can be found [here][ptwikipi] otherwise, you may install it manually by following these commands.


	1. sudo apt-get install curl libunwind8 gettext > Install three prerequiste packages
	2. curl -sSL -o dotnet.tar.gz https://dotnetcli.blob.core.windows.net/dotnet/Runtime/2.0.4/dotnet-runtime-2.0.4-linux-arm.tar.gz > Download the latest .NET Core Runtime currently working with PTMagic
	3. sudo mkdir -p /opt/dotnet && sudo tar zxf dotnet.tar.gz -C /opt/dotnet > Create a destination folder and extract the downloaded package into it
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
/opt/vc/bin/vcgencmd measure_temp
```

into this;

```
pi@pihole:~ $ temp
temp=34.7'C
```


I have added the file [bash_aliases](.bash_aliases)  with some useful commands in case you overclock your RPI or you can do it manually by executing this command.

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
### Network
* ```vntstat``` Used to monitor bandwidth usage, see how to install [install vnstat](#install-vnstat)
* ```ifconfig``` To check the status of the wireless connection you are using  (to see if wlan0 has acquired an IP address).
* ```iwconfig``` To check which network the wireless adapter is using.
* ```iwlist wlan0 scan``` Prints a list of the currently available wireless networks.
* ```iwlist wlan0 scan | grep ESSID``` Use grep along with the name of a field to list only the fields you need (for example to just list the ESSIDs).
* ```nmap``` Scans your network and lists connected devices, port number, protocol, state (open or closed) operating system, MAC addresses, and other information.
* ```ping``` Tests connectivity between two devices connected on a network. For example, ping 10.0.0.32 will send a packet to the device at IP 10.0.0.32 and wait for a response. It also works with website addresses.
* ```wget http://www.website.com/example.txt``` Downloads the file example.txt from the web and saves it to the current directory.

###  SYSTEM INFORMATION COMMANDS

* ```cat /proc/meminfo``` Shows details about your memory.
* ```cat /proc/partitions``` Shows the size and number of partitions on your SD card or hard drive.
* ```cat /proc/version``` Shows you which version of the Raspberry Pi you are using.
* ```df -h``` Shows information about the available disk space.
* ```df /``` Shows how much free disk space is available.
* ```dpkg – –get–selections | grep XXX``` Shows all of the installed packages that are related to XXX.
* ```dpkg – –get–selections``` Shows all of your installed packages.
* ```free``` Shows how much free memory is available. running ```free -m``` will format the size to mb.
* ```hostname -I``` Shows the IP address of your Raspberry Pi.
* ```lsusb``` Lists USB hardware connected to your Raspberry Pi.
* UP key: Pressing the UP key will print the last command entered into the command prompt. This is a quick way to repeat previous commands or make corrections to commands.
* ```vcgencmd measure_temp``` Shows the temperature of the CPU.
* ```vcgencmd get_mem arm && vcgencmd get_mem gpu``` Shows the memory split between the CPU and GPU.

[Profit-PI]: <https://github.com/CryptoGnome/Profit-Pi>
[ptwikipi]: <https://wiki.profittrailer.com/doku.php?id=raspberry_pi_guide#requirements>
