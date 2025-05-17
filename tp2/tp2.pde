//Lucia Pilar Magne
//Comisión 1

PImage Escena1;
PImage Escena2;
PImage Escena3;
float posY = 480;
float posYtexto2 = 480;
int posX;
PFont miFuente;
float opacidad1;
int contadorInicio =0;
float opacidad2;
String estado = "pantalla1";
float tamTexto = 10;
float opacidadTexto3 = 0;


void setup() {
  size(640, 480);
  Escena1 = loadImage("Escena1.jpg");
  Escena2 = loadImage("Escena2.jpeg");
  Escena3 = loadImage("Escena3.jpg");
  posY = 400;
  posYtexto2 = 480;
  posX = 320;
  miFuente = loadFont("Helvetica-Bold-100.vlw");
  textFont(miFuente);
}

void draw() {
if (estado == "pantalla1") {
  if (frameCount - contadorInicio <= 60 * 9) {
    image(Escena1, 0, 0, 640, 480);

      // Título
      opacidad1 = map(posY, 200, 150, 255, 0);
      fill(237, 186, 45, opacidad1);
      textSize(100);
      textAlign (CENTER, CENTER);
      text("Mi villano\nfavorito 2", width/2, posY);

      if (posY > 100) {
        posY -= 2; // Mover el título para arriba
}

      // Mostrar el segundo texto 
      if (posY <= 100) {
        float textoY = posYtexto2;
        
        if (posYtexto2 > 50) {
        opacidad2 = 255; 
        } else {
          opacidad2= map(posYtexto2, 50 , -150, 255, 255);
        }
        
        fill(255,102,0, opacidad2);
        textSize(24);
        textAlign (CENTER, CENTER);
        text("Gru abandona su vida de villano para ser papá,\npero una organización secreta le pide ayuda\npara atrapar a un nuevo enemigo.\nJunto con Lucy, intenta salvar el mundo\ny terminan enamorándose y formando una familia.", width/2, textoY);
          posYtexto2 -= 1.5; // Acá está el control de la velocidad
}

} else {
estado = "pantalla2";
posY = 100;
}
}

else if (estado == "pantalla2") {
  if (frameCount <= 60 * 15) {
  image(Escena2, 0, 0, 640, 480);
  noStroke();
  fill(255,180);  
  rect(80, 150, 480, 180); 
  fill(0); 
  textAlign(CENTER, CENTER);
  textSize(tamTexto);
  text("Directores:\nChris Renaud, Pierre Coffin.\nGuionistas:\nCinco Paul, Ken Daurio.", width / 2, height / 2);

if (tamTexto < 32) {
tamTexto += 0.4;
}
} else {
  estado = "pantalla3";
    }
  }
else if (estado == "pantalla3") {
  image(Escena3, 0, 0, 640, 480);

  if (opacidadTexto3 < 255) {
    opacidadTexto3 += 2;
  }
  
  noStroke();
  fill(237, 186, 45, opacidadTexto3);  
  rect(50, 130, 540,220);  
  fill(0, opacidadTexto3);
  textSize(28);
  textAlign(CENTER, CENTER);
  text("Personajes principales:\n• Gru\n• Lucy\n• Margo, Edith y Agnes (las hijas)\n• Minions\n• Villano: Eduardo / “El Macho”", width/2, height/2);
  
    fill(237, 186, 45, opacidadTexto3);
rect(250, 400, 140, 40);
fill(0, opacidadTexto3);
textSize(18);
textAlign(CENTER, CENTER);
text("Reiniciar", 320, 420);
}

}
void mousePressed() {
 //if (estado == "pantalla3") {
if (mouseX > 250 && mouseX < 390 && mouseY > 400 && mouseY < 440){
   if (estado == "pantalla3") {
     contadorInicio= frameCount;
 estado = "pantalla1";
 posY = 400;
 posYtexto2 = 480;
 opacidad1 = 255;
opacidad2 = 255;
 tamTexto = 10;
 opacidadTexto3 = 0;
}
}
  }
  
