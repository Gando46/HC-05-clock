#include <Wire.h>
#include <RTClib.h>

RTC_DS1307 rtc;

void setup() {
  Wire.begin();
  rtc.begin();
  Serial1.begin(9600); 

  // Set the starting date and time to 17:45 on Monday
  rtc.adjust(DateTime(2023, 8, 7, 17, 45, 0)); // Year, Month, Day, Hour, Minute, Second
}

void loop() {
  DateTime now = rtc.now();
  int hour = now.hour();
  int minute = now.minute();
  int second = now.second();

  // Send the time data through Bluetooth
  Serial1.print("Time: ");
  Serial1.print(hour);
  Serial1.print(":");
  if (minute < 10) {
    Serial1.print("0");
  }
  Serial1.print(minute);
  Serial1.print(":");
  if (second < 10) {
    Serial1.print("0");
  }
  Serial1.println(second);

  delay(1000);
}

