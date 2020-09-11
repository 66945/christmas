public class Ornament {
  int radius;
  
  PImage image;
  PVector pos;
  
  public Ornament(PVector pos_) {
    radius = 15;
    
    String fileName = "ornament" + ((int) random(3) + 1) + ".png";
    image = loadImage(fileName);
    image.resize(2*radius, 2*radius);
    
    pos = pos_;
  }
  
  public void render() {
    image(image, pos.x - radius, pos.y - radius);
  }
}
