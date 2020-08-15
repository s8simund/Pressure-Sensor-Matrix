
int rc00 = A0; //input for row=0 and coulmn=0
int rc01 = A1; //input for row=0 and coulmn=1
int rc10 = A2; //input for row=1 and coulmn=0
int rc11 = A3; //input for row=1 and coulmn=1

int sensorValues[] = {0,0,0,0}; //initialising sensor values

void setup() {
  pinMode(rc00, INPUT);  
  pinMode(rc01, INPUT);
  pinMode(rc10, INPUT);  
  pinMode(rc11, INPUT); 
 
  Serial.begin(9600);
}

void loop() {

  sensorValues[0] = analogRead(rc00);
  sensorValues[1] = analogRead(rc01);
  sensorValues[2] = analogRead(rc10);
  sensorValues[3] = analogRead(rc11);
  delay(10);
  Serial.print(sensorValues[0]);
  Serial.print(',');
  Serial.print(sensorValues[1]);
  Serial.print(',');
  Serial.print(sensorValues[2]);
  Serial.print(',');
  Serial.print(sensorValues[3]);
  Serial.println();
}
