
import processing.serial.*;

Serial myPort; 
int maxNoOfSensors = 4;     
float[] sensorValue = new float[maxNoOfSensors];  // Storing Sensor Values
float[] previousValue = new float[maxNoOfSensors];  // array of previous values
int rectSize = 800;

void setup () { 
  size(1000, 1000);  // setting window size
  println(Serial.list()); 
  
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  myPort.clear();
  myPort.bufferUntil('\n'); 
  background(255);    // setting initial background
  smooth(); 
  rectMode(CORNER);
}


void draw () {
  fill(sensorValue[2]);
  rect(width/2-rectSize, height/2-rectSize, rectSize,rectSize);  //row=1, column=0
  fill(sensorValue[1]);
  rect(width/2, height/2-rectSize, rectSize,rectSize);  //row=0, column=1
  fill(sensorValue[0]);
  rect(width/2-rectSize, height/2, rectSize,rectSize);  //row=0, column=0
  fill(sensorValue[3]);
  rect(width/2, height/2, rectSize,rectSize);  //row=1, column=1
}


void serialEvent (Serial myPort) {
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    inString = trim(inString);
    int incomingValues[] = int(split(inString, ",")); 

    if (incomingValues.length <= maxNoOfSensors && incomingValues.length > 0) {
      for (int i = 0; i < incomingValues.length; i++) {
        // mapping the incoming values (0 to  1023) to an appropriate gray-scale range (0-255):
        sensorValue[i] = map(incomingValues[i], 0, 1023, 0, 255);  
      }
    }
  }
}
