// "El duque y yo" de Julia Quinn (novela)


int estado = 0; 
int frameInicioPantalla = 0; 
int duracionPantallaFrames = 300; 


float posXTexto = 50;
float posYTexto = 370;

PImage imgMenu, imgLondres, imgDaphne, imgSimon, imgAnthony; 
PFont fuenteBridgerton; 
String[] textoHistoria = new String[4]; 

void setup() {
  size(640, 480); 
  smooth(); 
  
  
  imgMenu = loadImage("portada.png"); 
  imgLondres = loadImage("londres.png");
  imgDaphne = loadImage("daphne.png");
  imgSimon = loadImage("simon.png");
  imgAnthony = loadImage("anthony.png");
  
  fuenteBridgerton = loadFont("TimesNewRomanPS-ItalicMT-30.vlw"); 
  textFont(fuenteBridgerton, 16); 
  
  // Textos de las pantallas
  textoHistoria[0] = "Londres, 1813. La temporada de bailes ha comenzado en la alta sociedad."; 
  textoHistoria[1] = "Daphne Bridgerton: Busca un matrimonio por amor en un mercado competitivo.";
  textoHistoria[2] = "Simon Basset: El rebelde Duque de Hastings, quien huye del compromiso.";
  textoHistoria[3] = "Anthony Bridgerton: El protector hermano mayor que vigila cada pretendiente.";
}

void draw() {
  background(0); 
  

  if (estado >= 1 && estado <= 4) { 
    if (frameCount - frameInicioPantalla > duracionPantallaFrames) { 
      estado = estado + 1;
      frameInicioPantalla = frameCount; 
      
  
      reiniciarPosicionTexto();
    }
  }


  if (estado == 0) {
    image(imgMenu, 0, 0, width, height); 
    dibujarBoton("ENTRAR AL BAILE", 220, 380, 200, 50);
  } 
  else if (estado == 1) { 
    image(imgLondres, 0, 0, width, height); 
    dibujarCajaYTexto(textoHistoria[0], 245, 238, 220, 0, 0, 0); 
  } 
  else if (estado == 2) {
    image(imgDaphne, 0, 0, width, height);
    dibujarCajaYTexto(textoHistoria[1], 163, 196, 219, 255, 255, 255); 
  } 
  else if (estado == 3) {
    image(imgSimon, 0, 0, width, height);
    dibujarCajaYTexto(textoHistoria[2], 110, 13, 13, 255, 255, 255); 
  } 
  else if (estado == 4) {
    image(imgAnthony, 0, 0, width, height);
    dibujarCajaYTexto(textoHistoria[3], 34, 76, 56, 255, 255, 255); 
  } 
  else { 

    background(25); 
    fill(255); 
    textAlign(CENTER); 
    text("¿Lograrán engañar a la alta sociedad?", 320, 200); 
    
    dibujarBoton("REINICIAR", 220, 320, 200, 50);
  }
}


void dibujarCajaYTexto(String texto, float cR, float cG, float cB, float tR, float tG, float tB) {
  noStroke(); 
  
  fill(cR, cG, cB, 200); 
  rect(30, 350, 580, 100); 
  

  if (estado == 1) {
 
    if (posXTexto < 50) {
      posXTexto = posXTexto + 5;
    }
  } 
  else if (estado == 2) {
 
    if (posXTexto > 50) {
      posXTexto = posXTexto - 5;
    }
  } 
  else if (estado == 3) {
  
    if (posYTexto < 370) {
      posYTexto = posYTexto + 3;
    }
  } 
  else if (estado == 4) {
 
    if (posYTexto > 370) {
      posYTexto = posYTexto - 3;
    }
  }
  
  fill(tR, tG, tB); 
  textAlign(LEFT); 
  

  text(texto, posXTexto, posYTexto); 
}


void reiniciarPosicionTexto() {
  if (estado == 1) {
    posXTexto = -400; // Empieza afuera a la izquierda
    posYTexto = 370;
  } 
  else if (estado == 2) {
    posXTexto = 700;  // Empieza afuera a la derecha
    posYTexto = 370;
  } 
  else if (estado == 3) {
    posXTexto = 50;
    posYTexto = 250;  // Empieza más arriba de la caja
  } 
  else if (estado == 4) {
    posXTexto = 50;
    posYTexto = 480;  // Empieza abajo del todo, fuera de la pantalla
  }
}


void dibujarBoton(String etiqueta, float x, float y, float w, float h) {
  stroke(255); 
  
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) { 
    fill(90, 90, 90, 230); 
  } else {
    fill(40, 40, 40, 220); 
  }
  
  rect(x, y, w, h); 
  
  fill(255); 
  textAlign(CENTER); 
  text(etiqueta, x + w/2, y + h/2 + 5); 
}


void mousePressed() { 
  if (mousePressed == true) { 
    
    // Clic en botón "COMENZAR" (Pantalla 0)
    if (estado == 0 && mouseX > 220 && mouseX < 420 && mouseY > 380 && mouseY < 430) { 
      estado = 1;
      frameInicioPantalla = frameCount; 
      reiniciarPosicionTexto(); // Configura el arranque del primer texto
    }
    
    // Clic en botón "REINICIAR" (Pantalla 5)
    if (estado == 5 && mouseX > 220 && mouseX < 420 && mouseY > 320 && mouseY < 370) {
      estado = 0; 
    }
    
  }
}
