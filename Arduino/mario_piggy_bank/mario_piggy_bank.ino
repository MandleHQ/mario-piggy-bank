#define TRIG 2
#define ECHO 3

void setup(){
  Serial.begin(9600);
  pinMode(TRIG, OUTPUT);
  pinMode(ECHO, INPUT);  
}

void loop(){
  digitalWrite(TRIG, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG, HIGH);
  delayMicroseconds(5);
  digitalWrite(TRIG, LOW);
  
  long duration = pulseIn(ECHO, HIGH);
  
  if(duration < 400){
    Serial.println(1);    
  }

  delay(10);
}
