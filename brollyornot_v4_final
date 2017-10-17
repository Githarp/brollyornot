import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

color off = color(4, 79, 111);
color on = color(84, 145, 158);

// Sets all pins to off
int[] values = { Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW,
 Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW,
 Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW };
 
//load the file and read the lines
//smaller text dump
//String url = "http://dl.dropboxusercontent.com/s/tyv7iuj0l9c422g/brollyyesno.txt";

//bigger text dump which includes tweets 
String url = "http://dl.dropboxusercontent.com/s/lzbscnd2d1cmz45/brollyyes.txt";
String[] lines;
int advice;

void setup() {
  size(470, 200);
  frameRate(0.1);
  // Prints out the available serial ports.
  println(Arduino.list());
  
  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  arduino = new Arduino(this, Arduino.list()[5], 57600);
  
  // Alternatively, use the name of the serial port corresponding to your
  // Arduino (in double-quotes), as in the following line.
  //arduino = new Arduino(this, "/dev/tty.usbmodem621", 57600);
  
  // Set the Arduino digital pins as outputs.
  for (int i = 0; i <= 13; i++)
    arduino.pinMode(i, Arduino.OUTPUT);
    
}

void draw() {
  background(off);
  stroke(on);
  
  for (int i = 0; i <= 13; i++) {
    if (values[i] == Arduino.HIGH)
      fill(on);
    else
      fill(off);
      
    rect(420 - i * 30, 30, 20, 20);
  }

lines = loadStrings(url);
  println("There are " + lines.length + " lines.");
//printArray(lines);
println(lines[lines.length-1]);
check ();
}

int check()
{
  // Sets Red Pin to Pin 2
  int pin = 2;
  
  // Sets Green Pin to Pin 3
  int turngreen = 3;
  String answer=lines[lines.length-1];
  
  // Toggle Green LED to be turned on if last line in twitter result is a YES
  String[] m2 = match(answer, "YES");
  if (m2 != null) {
    arduino.digitalWrite(pin, Arduino.LOW);
    arduino.digitalWrite(turngreen, Arduino.HIGH);
    //println("should be green");
    advice=1;
  } else { // Toggles Red LED to be turned on if last line is NOT a YES
    arduino.digitalWrite(pin, Arduino.HIGH);
    arduino.digitalWrite(turngreen, Arduino.LOW);
    advice=0;
    //println("should be green else");
  }
  return (advice);
}
