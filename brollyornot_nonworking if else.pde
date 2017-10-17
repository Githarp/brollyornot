  if ((lines[lines.length-1]) == "YES") {
    arduino.digitalWrite(pin, Arduino.HIGH);
    arduino.digitalWrite(turngreen, Arduino.LOW);
    advice=0;
  } else { // Toggles Green LED to be turned on if last line is a NO
    arduino.digitalWrite(pin, Arduino.LOW);
    arduino.digitalWrite(turngreen, Arduino.HIGH);
    advice=1;
  }
  return (advice);
