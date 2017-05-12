[Home]({{ site.baseurl }}{% link index.md %}) | [Building]({{ site.baseurl }}{% link build.md %}) | [Programming]({{ site.baseurl }}{% link program.md %}) | [Extensions]({{ site.baseurl }}{% link extensions.md %})

# Programming your robot

## Get the Arduino IDE

You can download the Arduino IDE from [arduino.cc](https://www.arduino.cc/en/Main/Software). Grab the download for our operating system, and install the software.

## Install the libraries

The default software of your robot uses two libraries to talk to the ultrasound sensor and the motor shield. Download the ZIP files for these libraries from here:

* [Adafruit Motor Shield Library](https://github.com/tiefpunkt/Adafruit-Motor-Shield-library/releases/download/1.0.1/Adafruit-Motor-Shield-library-1.0.1.zip)
* [NewPing Library](https://bitbucket.org/teckel12/arduino-new-ping/downloads/NewPing_v1.8.zip)

Once you have downloaded the two files, start up the Arduino IDE. In the menu, go to "Sketch" -> "Include Library" -> "Add .ZIP Library..." and chose the first ZIP file you downloaded. Repeat for the second one. Now, you've installed the libraries, and can start coding.

## Get the robot software

You can download the robot's software here: [firmware.ino](https://github.com/tiefpunkt/petrobot/raw/master/firmware/firmware.ino). Download the file, and open it with the Arduino IDE. It may ask you to create a separate folder for the file, just confirm. Now, after plugging in your robot via the USB port, you should be able to press the second button on the left, and your robot should get its new software.
