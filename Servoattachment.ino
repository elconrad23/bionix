#include <ESP32Servo.h>
#include <DHT.h>

// Declare the pin that is connected to the DHT sensor
#define DHTPIN 12

// Type of the DHT sensor
#define DHTTYPE DHT22

// Creating the DHT object
DHT dht(DHTPIN, DHTTYPE);

// Declaring the servo objects
Servo pinky;
Servo servo2;
Servo servo3;
Servo servo4;
Servo servo5;

// Declaring constants
const int pinkyPin = 26;
const int servo2Pin = 25;
const int servo3Pin = 33;
const int servo4Pin = 32;
const int servo5Pin = 27;
//potentiometer declarations
const int potPin1 = 13;
const int potPin2 = 34;
const int potPin3 = 35;
const int ledPin = 2;

// Variables to store previous millis values for non-blocking delay
unsigned long previousMillis = 0;
const long interval = 2000;

// Function prototypes
void performAction(int position1, int position2, int position3);
void setServoPositions(int pos1, int pos2, int pos3, int pos4, int pos5);

void setup() {
  Serial.begin(115200);
  pinMode(ledPin, OUTPUT);
  dht.begin(); // Starting the DHT sensor
  delay(200); // Delay for DHT sensor to stabilize

  // Attaching the servos to the pins 
  pinky.attach(pinkyPin);
  servo2.attach(servo2Pin);
  servo3.attach(servo3Pin);
  servo4.attach(servo4Pin);
  servo5.attach(servo5Pin);
}

void loop() {
  // Non-blocking delay using millis
  unsigned long currentMillis = millis();
  if (currentMillis - previousMillis >= interval) {
    previousMillis = currentMillis;

    // Get the temperature and humidity readings
    float temp = dht.readTemperature();
    float humidity = dht.readHumidity();

    // Check if the values are valid then send them to the app and display on the serial monitor
    if (!isnan(temp) && !isnan(humidity)) {
      Serial.printf("Temperature: %.2f C Humidity: %.2f %%\n", temp, humidity);
    } else {
      Serial.println("Failed to read from DHT sensor!");
    }

    // Get the potentiometer readings
    int servoPosition = map(analogRead(potPin1), 0, 4096, 0, 180);
    int servoPosition1 = map(analogRead(potPin2), 0, 4096, 0, 180);
    int servoPosition2 = map(analogRead(potPin3), 0, 4096, 0, 180);

    // Perform actions based on the potentiometer readings
    performAction(servoPosition, servoPosition1, servoPosition2);
  }
}

void performAction(int position, int position1, int position2) {
  if (position2 >= 20) {
    setServoPositions(position2, position2, position2, 0, position2);
  } else if (position1 >= 20) {
    setServoPositions(position1, position1, 0, 0, position1);
  } else {
    setServoPositions(position, position, position, position, position);
  }
}

void setServoPositions(int pos1, int pos2, int pos3, int pos4, int pos5) {
  pinky.write(pos1);
  servo2.write(pos2);
  servo3.write(pos3);
  servo4.write(pos4);
  servo5.write(pos5);
  Serial.printf("Servo Positions - pinky: %d, servo2: %d, servo3: %d, servo4: %d, servo5: %d\n", pos1, pos2, pos3, pos4, pos5);
  delay(20);
}
