public class Strand {  
  PVector startPoint;
  PVector endPoint;
  
  ArrayList<Light> lights;
  
  public Strand(PVector p1, PVector p2) {    
    startPoint = p1;
    endPoint = p2;
    
    lights = new ArrayList<Light>();
    
    color[] okColors = {
      color(#f53b3b),
      color(#00ff00),
      color(#ffffff)
    };
    
    float dist = dist(startPoint.x, startPoint.y, endPoint.x, endPoint.y);
    
    int lightNum = (int) (dist / 50);
    
    float xIncr = (endPoint.x - startPoint.x) / lightNum;
    float yIncr = (endPoint.y - startPoint.y) / lightNum;
    
    for(int i = 0; i <= lightNum; i++) {//The less than or equals adds an extra light, but ensures both endpoints have lights
      PVector lPoint = new PVector(xIncr*i + startPoint.x, yIncr*i + startPoint.y);
      color randColor = okColors[(int) random(okColors.length)];
      
      Light l = new Light(randColor, lPoint, 20);
      
      lights.add(l);
    }
  }
  
  public void update() {
    for(Light l : lights) {
      l.update();
    }
  }
  
  public void render() {
    strokeWeight(5);
    stroke(0);
    
    line(startPoint.x, startPoint.y, endPoint.x, endPoint.y);
    
    for(Light l : lights) {
      l.render();
    }
  }
}
