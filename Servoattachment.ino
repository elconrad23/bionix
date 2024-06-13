#include <ESP32Servo.h>
#include <DHT.h>
#include <Arduino.h>
#include <WiFi.h>
#include <FirebaseESP32.h>

// Provide the token generation process info.
#include <addons/TokenHelper.h>

// Provide the RTDB payload printing info and other helper functions.
#include <addons/RTDBHelper.h>

/* 1. Define the WiFi credentials */
#define WIFI_SSID "Airqo"
#define WIFI_PASSWORD "A1rq0@2022"

// For the following credentials, see examples/Authentications/SignInAsUser/EmailPassword/EmailPassword.ino

/* 2. Define the API Key */
#define API_KEY "AIzaSyDdeyywd9kSpA1CIgLBaDZvBdxvKTn7FIw"

/* 3. Define the RTDB URL */
#define DATABASE_URL "https://esp32-fb-367d7-default-rtdb.firebaseio.com/" 

/* 4. Define the user Email and password that alreadey registerd or added in your project */
#define USER_EMAIL "esp32.finalyear@gmail.com"
#define USER_PASSWORD "emb2024"

// Define Firebase Data object
FirebaseData fbdo;

FirebaseAuth auth;
FirebaseConfig config;

unsigned long sendDataPrevMillis = 0;

unsigned long count = 0;
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

// Variables to store previous millis values for non-blocking delay
unsigned long previousMillis = 0;
const long interval = 2000;
//potentiometer declarations
const int potPin1 = 13;
const int potPin2 = 34;
const int potPin3 = 35;
// Function prototypes
void performAction(int position1, int position2, int position3);
void setServoPositions(int pos1, int pos2, int pos3, int pos4, int pos5);
void sendData(float temp, float humidity);

void setup()
{

  Serial.begin(115200);

  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  Serial.printf("Firebase Client v%s\n\n", FIREBASE_CLIENT_VERSION);

  /* Assign the api key (required) */
  config.api_key = API_KEY;

  /* Assign the user sign in credentials */
  auth.user.email = USER_EMAIL;
  auth.user.password = USER_PASSWORD;

  /* Assign the RTDB URL (required) */
  config.database_url = DATABASE_URL;

  /* Assign the callback function for the long running token generation task */
  config.token_status_callback = tokenStatusCallback; // see addons/TokenHelper.h

  // Comment or pass false value when WiFi reconnection will control by your code or third party library e.g. WiFiManager
  Firebase.reconnectNetwork(true);

   fbdo.setBSSLBufferSize(4096, 1024 );


  Firebase.begin(&config, &auth);

  Firebase.setDoubleDigits(5);
  // Attaching the servos to the pins 
  pinky.attach(pinkyPin);
  servo2.attach(servo2Pin);
  servo3.attach(servo3Pin);
  servo4.attach(servo4Pin);
  servo5.attach(servo5Pin);

}

void loop()
{
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
       // send the readings to the firebase
       sendData(temp, humidity);
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
//send data to the firebase
void sendData(float temp, float humidity){
  // Firebase.ready() should be called repeatedly to handle authentication tasks.
if (Firebase.ready())
  {
    // Set data to Firebase
    if (Firebase.setInt(fbdo, "/test/temp", temp) && Firebase.setInt(fbdo, "/test/humidity", humidity))
    {
      Serial.println("Set data successfully");
    }
    else
    {
      Serial.print("Failed setting data: ");
      Serial.println(fbdo.errorReason());
    }
  }
}

//perform action
void performAction(int position, int position1, int position2) {
  if (position2 >= 20) {
    setServoPositions(position2, position2, position2, 0, position2);
  } else if (position1 >= 20) {
    setServoPositions(position1, position1, 0, 0, position1);
  } else {
    setServoPositions(position, position, position, position, position);
  }
}
//write the angle to the motors
void setServoPositions(int pos1, int pos2, int pos3, int pos4, int pos5) {
  pinky.write(pos1);
  servo2.write(pos2);
  servo3.write(pos3);
  servo4.write(pos4);
  servo5.write(pos5);
  Serial.printf("Servo Positions - pinky: %d, servo2: %d, servo3: %d, servo4: %d, servo5: %d\n", pos1, pos2, pos3, pos4, pos5);
  delay(20);
}

