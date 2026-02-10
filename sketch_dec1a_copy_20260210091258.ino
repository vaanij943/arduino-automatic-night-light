// Automatic Night Light
// Sensor on A0, LED on D9

const int lightPin = A0;
const int ledPin   = 9;

int lightValue = 0;
// Threshold controls how dark it must be before LED turns on.
// Start with 500 and adjust if needed.
int thresholdValue = 350;

void setup() {
  pinMode(ledPin, OUTPUT);
  digitalWrite(ledPin, LOW);

  Serial.begin(9600);   // useful for checking sensor values
}

void loop() {
  // Read the light sensor
  lightValue = analogRead(lightPin);   // range 0 to 1023

  // Print value for debugging
  // Serial.print("Light value: ");
  Serial.println(lightValue);

  // Decide light on or off
  if (lightValue == 0) {
    // LDR is removed, turn LED off
    digitalWrite(ledPin, LOW);
  } else if (lightValue < thresholdValue) {
    // It is dark, turn LED on
    digitalWrite(ledPin, HIGH);
  } else {
    // It is bright, turn LED off
    digitalWrite(ledPin, LOW);
  }

  delay(1000);  // small delay to slow down prints
}