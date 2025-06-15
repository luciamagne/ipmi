// Lucia Magne
// Comisión 1
//link a video explicativo:https://youtu.be/T5JhO9Rv1xk
PImage referencia;

float angulo = 0;
boolean girar = false;
boolean replicar = false;

void setup() {
  size(800, 400);
  referencia = loadImage("referencia.png");
}

void draw() {
  background(255);
  image(referencia, 0, 0, width/2, height);

  noStroke();
  if (replicar) {
    fill(0);
  } else {
    fill(255);
  }
  rect(width/2, 0, width/2, height);
  push();
  translate(width/2, 0);

  if (replicar) {
    float escala = 0.45;
    float offsetX = (width/4 - (width/2 * escala)) / 2;
    float offsetY = (height/2 - (height * escala)) / 2;

    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 2; j++) {
        push();
        translate(i * width/4 + offsetX, j * height/2 + offsetY);
        scale(escala);
        dibujarImagenCompleta();
        pop();
      }
    }
  } else {
    dibujarImagenCompleta();
  }

  pop();
}

void dibujarImagenCompleta() {
  dibujarFranjasFondo();
  dibujarRomboConFranjas();
}

void dibujarFranjasFondo() {
  int numFranjasNegras = 6;
  float grosorFranja = 43;
  float grosorEspacio = 39;

  float y = 0;

  for (int i = 0; i < numFranjasNegras; i++) {
    fill(0);
    noStroke();
    rect(0, y, width/2, grosorFranja);
    y += grosorFranja;

    if (i == 2) {
      continue;
    }

    if (i < numFranjasNegras - 1) {
      y += grosorEspacio;
    }
  }
}

void dibujarRomboConFranjas() {
  push();
  translate(width/4, height/2);

  float lado = width/2;

  fill(0, 120);
  noStroke();
  push();
  translate(10, 10);
  dibujarRombo(lado);
  pop();

  if (girar) {
    angulo += radians(1);
  }
  rotate(angulo);

  fill(255);
  noStroke();
  dibujarRombo(lado);

  dibujarFranjasRombo(lado);

  pop();
}

void dibujarRombo(float lado) {
  beginShape();
  vertex(0, -lado/2);
  vertex(lado/2, 0);
  vertex(0, lado/2);
  vertex(-lado/2, 0);
  endShape(CLOSE);
}

void dibujarFranjasRombo(float lado) {
  noStroke();
  fill(0);

  float anchoLinea = 40;
  float sep = lado / 5.5;

  for (int i = 0; i < 4; i++) {
    float xCentro = 0;

    if (i == 0) {
      xCentro = -2 * sep;
    } else if (i == 1) {
      xCentro = -0.8 * sep;
    } else if (i == 2) {
      xCentro = 0.8 * sep;
    } else if (i == 3) {
      xCentro = 2 * sep;
    }

    float ancho = anchoLinea / 2;

    float valor1 = abs(xCentro - ancho);
    float valor2 = abs(xCentro + ancho);

    float arribaIzq = - (lado/2 - valor1);
    float abajoIzq  =   (lado/2 - valor1);
    float arribaDer = - (lado/2 - valor2);
    float abajoDer  =   (lado/2 - valor2);

    quad(
      xCentro - ancho, arribaIzq,
      xCentro + ancho, arribaDer,
      xCentro + ancho, abajoDer,
      xCentro - ancho, abajoIzq
      );
  }
}

void mousePressed() {
  girar = !girar;
  replicar = !replicar;
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    angulo = 0;
    girar = false;
    replicar = false;
  }
}
