
void setup(){
  PImage venus;
  venus=loadImage("Venus-de-Milo-YouFine-Sculpture-1.jpg");
  size(800,400);
  background(#a07155); //color de fondo
  image(venus, 0, 0, 400, 400);
  
    noStroke();
  ellipse(600, 55, 45, 60);
  stroke(0);
  ellipse(590, 50, 10, 5);
  ellipse(610, 50, 10, 5);
  line(597, 60, 600, 50);
  line(603, 60, 600, 50);
  line(597, 60, 603, 60);
   noStroke();
  rect(590, 70, 20, 20);
  stroke(0);
  bezier(600, 70, 580, 70, 605, 60, 605, 70);
  noStroke();
  rect(573, 90, 65, 95);
  rect(560, 90, 15, 30);
  stroke(0);
  strokeWeight(0);
  ellipse(588, 115, 20, 15);
  ellipse(615, 115, 20, 15);
  strokeWeight(2);
  point(617, 115);
  point(586, 115);
  strokeWeight(0);
  noStroke();
  ellipse(600, 250, 100, 200);
  rect(573, 270, 60, 90);
  rect(555, 340, 60, 20);
  stroke(0);
  rect(591, 137, 10, 10);
  rect(591, 151, 10, 10);
  rect(591, 165, 10, 10);
  rect(607, 137, 10, 10);
  rect(607, 151, 10, 10);
  rect(607, 165, 10, 10);
  strokeWeight(3);
  point(604, 170);
  strokeWeight(0);
  line(580, 210, 560, 300);
  line(590, 210, 580, 300);
  line(600, 210, 600, 300);
  line(610, 210, 620, 300);
  line(620, 210, 640, 300);
  line(560, 210, 640, 210);
  
  
  
  
  
}
