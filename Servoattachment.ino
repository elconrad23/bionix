#include <BLEDevice.h>
#include <BLEUtils.h>
#include <BLEServer.h>
#include <BLE2902.h>
#include <ESP32Servo.h>
#include <DHT.h>

// UUIDs for BLE service and characteristic
#define SERVICE_UUID        "79a63043-fdc4-493a-b8c0-840635e5a332"
#define CHARACTERISTIC_UUID_TX "79a63043-fdc4-493a-b8c0-840635e5a332"

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
// BLE characteristic
BLECharacteristic *pCharacteristic;
bool deviceConnected=false;

// Variables to store previous millis values for non-blocking delay
unsigned long previousMillis = 0;
const long interval = 2000;
class MyServerCallbacks: public BLEServerCallbacks {
  void onConnect (BLEServer* pServer){
     deviceConnected = true;
  };

  void onDisconnect (BLEServer* pServer){
     deviceConnected = false;
  }
};

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

  // BLE setup
  BLEDevice::init("ESP32_Final");
  //create the BLE Server
  BLEServer *pServer = BLEDevice::createServer();
  pServer->setCallbacks(new MyServerCallbacks());

  //Create the BLE Service
  BLEService *pService = pServer->createService(SERVICE_UUID);
  pCharacteristic = pService->createCharacteristic(CHARACTERISTIC_UUID_TX, BLECharacteristic::PROPERTY_NOTIFY);
  //BLE2902 needed to notify
  pCharacteristic->addDescriptor(new BLE2902());
  //Start the service
  pService->start();
  //start advertising
  pServer->getAdvertising()->start();
  Serial.println("Waiting for a client to connection to notify....");
}

void loop() {
  if(deviceConnected){
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
       // Prepare readings to send via BLE
     char valueStr[50];
     snprintf(valueStr, sizeof(valueStr), "%.2f,%.2f %", temp, humidity);
     pCharacteristic->setValue(valueStr);
     pCharacteristic->notify();
     Serial.println("Sent value: " + String(valueStr));
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
