PImage tree;

void setup() {
  size(600, 600);
  frameRate(15);
  
  tree = loadImage("tree.png");
}

void draw() {
  background(#045c11);
  
  image(tree, 0, 0);
}
