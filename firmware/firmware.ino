#include "MotorDriver.h"

MotorDriver motor;

#include <NewPing.h>

#define TRIGGER_PIN  3  // Arduino pin tied to trigger pin on the ultrasonic sensor.
#define ECHO_PIN     2  // Arduino pin tied to echo pin on the ultrasonic sensor.

NewPing sonar(TRIGGER_PIN, ECHO_PIN, 100); // NewPing setup of pins and maximum distance.

#define STOP_DISTANCE 15


#define SPEED_MIN    60
#define SPEED_STEPS  10
#define SPEED_FINAL 100
int speed = 0;
int distance, d1;

void setup()
{
    motor.begin();
}

void loop()
{
  distance = sonar.ping_cm();

/*
  if (distance > 0 && distance<=STOP_DISTANCE) {
    delay(30);
    distance += sonar.ping_cm();
    distance /= 2;
  }
*/

  if (distance > 0 && distance <= STOP_DISTANCE) {
    speed = 0;
    motor.brake(0);
    motor.brake(1);
    motor.speed(0, 100);
    motor.speed(1, 100);
    delay(200);
    motor.brake(0);
    motor.brake(1);
    delay(200);
    motor.speed(0, -100);
    motor.speed(1, 100);
    delay(700);
    motor.brake(0);            // set motor0 to speed 100
    motor.brake(1);
  } else {
    if (speed < SPEED_MIN) {
      speed = SPEED_MIN;
    } else if (speed < SPEED_FINAL) {
      speed += SPEED_STEPS;
    }
    motor.speed(0, -speed);            // set motor0 to speed 100
    motor.speed(1, -speed);
  }

  delay(200);
}
// END FILE
