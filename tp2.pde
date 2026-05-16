// "El duque y yo" de Julia Quinn (novela)

int estado = 0; 
int frameInicioPantalla = 0; 
int duracionPantallaFrames = 300; // 5 segundos

float posXTexto = 50;
float posYTexto = 370;

PImage imgMenu, imgLondres, imgDaphne, imgSimon, imgAnthony; 
PFont fuenteBridgerton; 

void setup() {
  size(640, 480); 
  
  //imagenes
  imgMenu = loadImage("portada.png"); 
  imgLondres = loadImage("londres.png");
  imgDaphne = loadImage("daphne.png");
  imgSimon = loadImage("simon.png");
  imgAnthony = loadImage("anthony.png");
  
  fuenteBridgerton = loadFont("TimesNewRomanPS-ItalicMT-30.vlw"); 
  textFont(fuenteBridgerton, 16); 
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
    dibujarBoton(220, 380, 200, 50);
  } 
  else if (estado == 1) { 
    image(imgLondres, 0, 0, width, height); 
    dibujarCajaFondo(245, 238, 220); 
    
    if (posXTexto < 50) {
      posXTexto = posXTexto + 5;
    }
    fill(0); 
    textAlign(LEFT); 
    text("Londres, 1813. La temporada de bailes ha comenzado en la alta sociedad.", posXTexto, posYTexto);
  } 
  else if (estado == 2) {
    image(imgDaphne, 0, 0, width, height);
    dibujarCajaFondo(163, 196, 219); 
    
    if (posXTexto > 50) {
      posXTexto = posXTexto - 5;
    }
    fill(255); 
    textAlign(LEFT);
    text("Daphne Bridgerton: Busca un matrimonio por amor en un mercado competitivo.", posXTexto, posYTexto);
  } 
  else if (estado == 3) {
    image(imgSimon, 0, 0, width, height);
    dibujarCajaFondo(110, 13, 13); 
    
    if (posYTexto < 370) {
      posYTexto = posYTexto + 3;
    }
    fill(255);
    textAlign(LEFT);
    text("Simon Basset: El rebelde Duque de Hastings, quien huye del compromiso.", posXTexto, posYTexto);
  } 
  else if (estado == 4) {
    image(imgAnthony, 0, 0, width, height);
    dibujarCajaFondo(34, 76, 56); 
    
    // Animación: Entra desde ABAJO (Y = 370)
    if (posYTexto > 370) {
      posYTexto = posYTexto - 3;
    }
    fill(255);
    textAlign(LEFT);
    text("Anthony Bridgerton: El protector hermano mayor que vigila cada pretendiente.", posXTexto, posYTexto);
  } 
  else { 

    background(25); 
    fill(255); 
    textAlign(CENTER); 
    text("¿Lograrán engañar a la alta sociedad?", 320, 200); 
    
    dibujarBoton(220, 320, 200, 50);
  }
}

void dibujarCajaFondo(float fR, float fG, float fB) {
  noStroke(); 
  fill(fR, fG, fB, 200); 
  rect(30, 350, 580, 50); 
}

void reiniciarPosicionTexto() {
  if (estado == 1) {
    posXTexto = -550; // Inicia fuera a la izquierda
    posYTexto = 370;
  } 
  else if (estado == 2) {
    posXTexto = 700;  // Inicia fuera a la derecha
    posYTexto = 370;
  } 
  else if (estado == 3) {
    posXTexto = 50;
    posYTexto = 240;  // Inicia arriba de la caja
  } 
  else if (estado == 4) {
    posXTexto = 50;
    posYTexto = 490;  // Inicia abajo del canvas
  }
}

// Función modificada sin el parámetro String
void dibujarBoton(float x, float y, float w, float h) {
  stroke(255); 
  
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) { 
    fill(90, 90, 90, 230); 
  } else {
    fill(40, 40, 40, 220); 
  }
  
  rect(x, y, w, h); 
  
  fill(255); 
  textAlign(CENTER); 
  
  
  if (estado == 0) {
    text("ENTRAR AL BAILE", x + w/2, y + h/2 + 5);
  } 
  else if (estado == 5) {
    text("REINICIAR", x + w/2, y + h/2 + 5);
  }
}

void mousePressed() { 
  if (mousePressed == true) { 
    
    // Clic en boton "ENTRAR AL BAILE" (Pantalla 0)
    if (estado == 0 && mouseX > 220 && mouseX < 420 && mouseY > 380 && mouseY < 430) { 
      estado = 1;
      frameInicioPantalla = frameCount; 
      reiniciarPosicionTexto(); 
    }
    
    // Clic en boton "REINICIAR" (Pantalla 5)
    if (estado == 5 && mouseX > 220 && mouseX < 420 && mouseY > 320 && mouseY < 370) {
      estado = 0; 
    }
    
  }
}
