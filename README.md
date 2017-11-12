# tp-link Circadian Alarm

A simple bash script alarm to mimic a "natural" sunrise light wake-up.

The script works with the [tp-link LB120](http://www.tp-link.com/us/products/details/cat-5609_LB120.html) smart wifi LED bulb.
It may work with the LB110/LB130 or with the entire range of tp-link wifi bulbs.
tp-link Circadian Alarm uses the [tplink-lightbulb](https://github.com/konsumer/tplink-lightbulb) nodejs controller and it is based on this [simple Bash alarm clock script](https://github.com/mkscrg/alarm-clock).

github repository <https://github.com/Gregory-K/tplight-circadian-alarm>

## How it works

User inputs the desired wake-up time.
The script calculates the remaining time and one hour before wake-up time it starts sending commands to the wifi bulb.
The bulb will start with 2700K color temperature and 5% brightness and will gradually ascend to 5000K/100% 10 minutes before wake-up time.

It is supposed to assist you in waking-up in a more "natural" way using external cues to adjust your circadian rhythms.
Of course, this particular method is not scientifically proved in any way.
*Although circadian rhythms are endogenous ("built-in", self-sustained), they are adjusted (entrained) to the local environment by external cues called zeitgebers (from German, "time giver"), which include light, temperature and redox cycles. ref: [Wikipedia](https://en.wikipedia.org/wiki/Circadian_rhythm)*

## Requirements

* a tp-link LB120 (tried and tested)
* Bash Shell ...
  * pre-installed on Linux and MacOS
  * can be installed on rooted Android and [Windows](https://msdn.microsoft.com/en-us/commandline/wsl/install-win10)
* [NodeJS](https://nodejs.org/en/)
* tplink-lightbulb nodejs controller

## Application

* Guess you have already installed [NodeJS](https://nodejs.org/en/).
* Install the tplink-lightbulb nodejs controller.
  * [tplink-lightbulb](https://github.com/konsumer/tplink-lightbulb) `npm i -g tplink-lightbulb`.
* Download the sunrise.alarm.sh and make it executable `chmod +x sunrise.alarm.sh`
* Find your bulb `tplight scan`.
* Edit sunrise.alarm.sh -> line:10 (enter your bulb's IP address). *Better to assign a permanent IP to your bulb. Check your router/DHCP-server*
* Execute sunrise.alarm.sh `./sunrise.alarm.sh` and input the desired wake-time in HH:MM format.
  * It is recommended to execute it on your home/office server (remotely via ssh) using a [screen](https://www.gnu.org/software/screen/manual/screen.html) or [tmux](https://github.com/tmux/tmux/wiki) session and detaching from it.
    * In any case the computer/device running the script must be left turned on.
  * You can create a symlink to /usr/local/bin `ln -s ./sunrise.alarm.sh /usr/local/bin/sunrise.alarm.sh` in order to execute sunrise.alarm.sh from anywhere as a command.
* Wait ...to wake up.
