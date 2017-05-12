#include "AFMotor.h"

AF_DCMotor motor_l(1);
AF_DCMotor motor_r(2);

#include <NewPing.h>

#define TRIGGER_PIN  10  // Arduino pin tied to trigger pin on the ultrasonic sensor.
#define ECHO_PIN     9  // Arduino pin tied to echo pin on the ultrasonic sensor.

NewPing sonar(TRIGGER_PIN, ECHO_PIN, 100); // NewPing setup of pins and maximum distance.

#define STOP_DISTANCE 15


#define SPEED_MIN    40
#define SPEED_STEPS  20
#define SPEED_FINAL 160

#define SPEED_TURNING 100

#define SPEED_CORRECTION_L 1.0
#define SPEED_CORRECTION_R 1.0

int speed = 0;
int distance, d1;

void setup()
{
  Serial.begin(9600);
}


void setSpeed(int s) {
  int speed_l = (int)(s*SPEED_CORRECTION_L);
  int speed_r = (int)(s*SPEED_CORRECTION_R);
  motor_l.setSpeed(speed_l);
  motor_r.setSpeed(speed_r);
  Serial.print("Speed L: ");
  Serial.println(speed_l);
  Serial.print("Speed R: ");
  Serial.println(speed_r);
}


void loop()
{
  distance = sonar.ping_cm();
  Serial.print("Distance: ");
  Serial.println(distance);
/*
  if (distance > 0 && distance<=STOP_DISTANCE) {
    delay(30);
    distance += sonar.ping_cm();
    distance /= 2;
  }
*/

  if (distance > 0 && distance <= STOP_DISTANCE) {
    setSpeed(SPEED_TURNING);
    motor_l.run(RELEASE);
    motor_r.run(RELEASE);
    speed = 0;
    motor_l.run(BACKWARD);
    motor_r.run(BACKWARD);
    delay(200);
    motor_l.run(RELEASE);
    motor_r.run(RELEASE);
    delay(200);
    motor_l.run(FORWARD);
    motor_r.run(BACKWARD);
    delay(700);
    motor_l.run(RELEASE);
    motor_r.run(RELEASE);
  } else {
    motor_l.run(FORWARD);
    motor_r.run(FORWARD);
    if (speed < SPEED_MIN) {
      speed = SPEED_MIN;
    } else if (speed < SPEED_FINAL) {
      speed += SPEED_STEPS;
    }
    setSpeed(speed);
  }

  delay(200);
}
// END FILE
