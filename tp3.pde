// LINK DEL VIDEO:  https://youtu.be/R6C-5394jkQ

PImage img;          
float anguloRotacion;    
float factorEscala;      

float paramInicioX;      
float paramX;            
float paramY;            
float paramEscala;       
float retornoDiametro;   

int estadoColor = 0; 
color colorBlanco   = color(255);       
color colorCian     = color(0, 255, 255); 
color colorFucsia   = color(255, 0, 150); 
color colorAmarillo = color(255, 255, 0); 
color colorActual   = colorBlanco; 

void setup() {
  size(800, 400);        
  smooth();              
  
  anguloRotacion = 0.0;
  factorEscala = 1.0;
  
  img = loadImage("15.jpg"); 
}

void draw() {
  background(15);        
  
  image(img, 0, 0, 400, 400); 
  
  stroke(255);           
  line(400, 0, 400, height); 
  
  if (mouseX > 400) { 
    factorEscala = map(mouseX, 400, width, 0.5, 1.8); 
    anguloRotacion = anguloRotacion + 0.01; 
  } else { 
    factorEscala = 1.0;
  }
  
  paramInicioX = 400.0;
  dibujarPatronRepetitivo(); 
}

void dibujarPatronRepetitivo() {
  pushMatrix(); 
  translate(paramInicioX, 0); 
  
  int filas = 14;     
  int columnas = 14;  
  float espaciadoX = 400.0 / columnas;
  float espaciadoY = 400.0 / filas;
  
  for (int i = 0; i < columnas; i++) { 
    for (int j = 0; j < filas; j++) {  
      
      float posX = (i * espaciadoX) + (espaciadoX / 2);
      float posY = (j * espaciadoY) + (espaciadoY / 2);
      
      paramX = posX;
      paramY = posY;
      paramEscala = factorEscala;
      
      calcularDiametroDinamico(); 
      
      pushMatrix(); 
      translate(posX, posY); 
      
      rotate(anguloRotacion * (i + j) * 0.05); 
      
      noStroke(); 
      fill(colorActual);  
      
      ellipse(0, 0, retornoDiametro, retornoDiametro); 
      
      popMatrix(); 
    }
  }
  
  popMatrix(); 
}

void calcularDiametroDinamico() {
  float distanciaAlCentro = dist(paramX, paramY, 200, 200); 
  
  float diametroBase = (24.0 - (distanciaAlCentro * 0.06)) * paramEscala;
  
  float variacionRandom = random(-0.2, 0.2); 
  
  float resultadoFinal = diametroBase + variacionRandom;
  
  if (resultadoFinal < 2.0) { 
    retornoDiametro = 2.0;
  } else {
    retornoDiametro = resultadoFinal;
  }
}

void mouseClicked() {
  if (mouseX > 400) {
    
    if (mouseButton == RIGHT) {
      anguloRotacion = 0.0;
      factorEscala = 1.0;
      estadoColor = 0;
      colorActual = colorBlanco;
    } 
    
    else {
      estadoColor = estadoColor + 1; 
      
      if (estadoColor == 1) {
        colorActual = colorCian;
      } else if (estadoColor == 2) {
        colorActual = colorFucsia;
      } else if (estadoColor == 3) {
        colorActual = colorAmarillo;
      } else {
        colorActual = colorBlanco;
        estadoColor = 0; 
      }
    }
    
  }
}
