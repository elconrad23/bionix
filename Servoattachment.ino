#include <ESP32Servo.h>
#include "BluetoothSerial.h"
#include <DHT.h>

#define DHTPIN 12
#define DHTTYPE DHT22
DHT dht(DHTPIN, DHTTYPE);

BluetoothSerial serialBT;
Servo pinky;
Servo servo2;
Servo servo3;
Servo servo4;
Servo servo5;

const int pinkyPin = 26;
const int servo2Pin = 25;
const int servo3Pin = 33;
const int servo4Pin = 32;
const int servo5Pin = 27;
const int potentialmeter = 13;
const int ledPin = 2;

char cmd;

void setup() {
  Serial.begin(115200);
  serialBT.begin("Esp32");
  pinMode(ledPin, OUTPUT);
  dht.begin();
  delay(200); // Delay for sensor to stabilize

  pinky.attach(pinkyPin);
  servo2.attach(servo2Pin);
  servo3.attach(servo3Pin);
  servo4.attach(servo4Pin);
  servo5.attach(servo5Pin);
}

void loop() {
  //get the potentialmeter readings
  int servoPosition = map(analogRead(potentialmeter), 0, 4096, 0, 180);
  //write the angle to the motors
  pinky.write(servoPosition);
  servo2.write(servoPosition);
  servo3.write(servoPosition);
  servo4.write(servoPosition);
  servo5.write(servoPosition);
  Serial.println(servoPosition);
  delay(20);

//Get the temperature readings
  float temp = dht.readTemperature();
  //get the humudity reading
  float humidity = dht.readHumidity();

//check if the values are not null then send them to the app and display to the serial monitor
  if (!isnan(temp) && !isnan(humidity)) {
    Serial.print("Temperature: ");
    Serial.print(temp);
    Serial.print("C ");
    Serial.print("Humidity: ");
    Serial.print(humidity);
    Serial.println(" % ");
    serialBT.println(temp);
    serialBT.println(humidity);
  } else {
    Serial.println("Failed to read from DHT sensor!");
  }
  delay(2000); // Delay for sensor to provide accurate values

//check if there is any device connected
  if (serialBT.available()) {
    cmd = serialBT.read();
    Serial.print("Received (char): ");
    Serial.println(cmd);
    Serial.print("Received (int): ");
    Serial.println((int)cmd);

    if (cmd == '\n' || cmd == '\r') {
      return;
    }

    serialBT.print("Received: ");
    serialBT.println(cmd);

    if (cmd == '1') {
      digitalWrite(ledPin, HIGH);//turn on the led
      serialBT.println("LED turned ON");//print the message to the app
    } else if (cmd == '0') {
      digitalWrite(ledPin, LOW);//turn the led off
      serialBT.println("LED turned OFF");//send the message to the application
    } else {
      processCommand(cmd);//call the process command function to write angles to the motors
      serialBT.println("The received command is undefined");
      Serial.println("The received command is undefined");
    }
  }
}
//command to process what has been received from the application
void processCommand(char cmd) {
  int angle = -1;
  switch (cmd) {
    case 'a': angle = 0; break;
    case 'b': angle = 45; break;
    case 'c': angle = 90; break;
    case 'd': angle = 180; break;
    default: return;
  }
//write the to the motors via application

  if (angle != -1) {
    pinky.write(angle);
    servo2.write(angle);
    servo3.write(angle);
    servo4.write(angle);
    servo5.write(angle);
    serialBT.print("Servos set to position: ");
    serialBT.println(angle);
  }
}
