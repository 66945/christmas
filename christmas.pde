PImage tree;
Light star;

ArrayList<Ornament> ornaments;

ArrayList<Strand> strands;
PVector tempPos;

void setup() {
  size(600, 600);
  //frameRate(15);
  
  tree = loadImage("tree.png");
  
  star = new Light(color(#f7f307), new PVector(302, 115), 30);
  star.setLight(true);
  
  ornaments = new ArrayList<Ornament>();
  strands = new ArrayList<Strand>();
}

void draw() {
  background(#045c11);
  
  image(tree, -20, 5);
  
  star.update();
  star.render();
  
  for(Ornament o : ornaments) {
    o.render();
  }
  
  for(Strand s : strands) {
    s.update();
    s.render();
  }
  
  if(tempPos != null) {
    strokeWeight(5);
    stroke(150);
    
    line(tempPos.x, tempPos.y, mouseX, mouseY);
  }
}

void mouseClicked() {
  if(mouseButton == LEFT) {
    if(tempPos == null) {
      tempPos = new PVector(mouseX, mouseY);
    } else {
      Strand newStrand = new Strand(tempPos, new PVector(mouseX, mouseY));
      strands.add(newStrand);
      
      tempPos = null;
    }
  } else if(mouseButton == RIGHT) {
    ornaments.add(new Ornament(new PVector(mouseX, mouseY)));
  }
}

void keyPressed() {
  if(key == 'r') {
    ornaments.clear();
    strands.clear();
  }
}
