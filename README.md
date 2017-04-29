# Pet Robot

A tiny Arduino-compatible robot platform. Inspired by the Pop Pet Robot.

![Picture of the bot](img/robot.jpg)

## PopPet Robot
The PopPet robot was a kickstarter in 2014. It was successful, and the designs were open sourced. And then it sort of died. The website is down, the Facebook page gone, and the twitter account has gone pretty much silent.

* [Original design](https://www.thingiverse.com/thing:706375)
* [Kickstarter](https://www.kickstarter.com/projects/jaidynedwards/poppet-diy-arduino-compatible-open-hardware-robot)
* [Website](http://www.poppettherobot.com/) ([Backup on archive.org](https://web.archive.org/web/20160222195250/http://www.poppettherobot.com/))
* [Twitter](https://twitter.com/PopPetTheRobot)

## Materials
* the body and wheels are lasercut out of 3mm MDF
* motors are these quasi-standard cheap beginner robotics motors, available e.g. at [HobbyKing](https://hobbyking.com/de_de/geared-motor-w-90-deg-shaft-2pcs-bag.html)
* there's an omni-wheel caster in the back, which is probably the same as [this one](https://hobbyking.com/de_de/49x20x32mm-steel-ball-omni-wheel.html)
  * I'd like to replace it with a smaller one to also make the front wheels a bit smaller. [This one](https://hobbyking.com/de_de/50x23x25mm-steel-ball-omni-wheel.html) might be an option.
* Arduino
* Motor Shield: https://www.adafruit.com/product/81
  * The Adafruit v1 Motor Shield is not produced by Adafruit anymore, but there are clones of it available from China. They are much cheaper than any other motor shield available, but work well enough for our purpose.
  * [Documentation](https://learn.adafruit.com/adafruit-motor-shield/overview)
  * [Schematic](https://raw.githubusercontent.com/adafruit/Adafruit-Motor-Shield-for-Arduino/master/mshieldv12schem.png)
  * [More information on the shield](http://playground.arduino.cc/Main/AdafruitMotorShield)
## Firmware
### Libraries
* [Adafruit Motor Shield](https://github.com/adafruit/Adafruit-Motor-Shield-library)
  * [Relevent documentation part for controlling DC motors](https://learn.adafruit.com/adafruit-motor-shield/af-dcmotor-class)
* [NewPing](https://bitbucket.org/teckel12/arduino-new-ping/downloads/)

## Notes
* Font for the wheels: [Phat Phreddy](http://www.dafont.com/de/phatt-phreddy.font?text=WOOD+YEAR)
