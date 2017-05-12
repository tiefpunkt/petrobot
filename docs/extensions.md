[Home]({{ site.baseurl }}{% link index.md %}) | [Building]({{ site.baseurl }}{% link build.md %}) | [Programming]({{ site.baseurl }}{% link program.md %}) | [Extensions]({{ site.baseurl }}{% link extensions.md %})

# Modifications and extensions for your robot

## Motor speed correction
The motors in our robots are not always running at the same speed. That can be corrected in software. We've created [this example sketch](https://github.com/tiefpunkt/petrobot/raw/extensions/motor_speed_adjustment/motor_speed_adjustment,ino)l which you can download and flash onto your robot. In the sketch, you can find two variables, "SPEED_CORRECTION_L" and "SPEED_CORRECTION_R" to adjust the speeds of your two motors
