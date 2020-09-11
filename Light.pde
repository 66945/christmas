public class Light {
  boolean blink;
  boolean lightOn;
  int countdown;
  
  color c;
  color cOff;
  
  int glowRes;
  float glowWidth;
  float glowIncr;
  float glowSAlpha;
  float glowAlphaIncr;
  
  PVector pos;
  float radius;
  
  public Light(color c_, PVector pos_, float radius_) {
    blink = true;
    lightOn = true;
    countdown = (int) random(20, 50);
    
    c = c_;
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    
    cOff = color(r - 100, g - 100, b - 100);
    
    glowRes = 10;
    glowWidth = 30;
    glowIncr = glowWidth / glowRes;
    glowSAlpha = 50;
    glowAlphaIncr = glowSAlpha / glowRes;
    
    pos = pos_;
    radius = radius_;
  }
  
  public void toggle() {
    lightOn = !lightOn;
  }
  
  public void setLight(boolean status) {
    lightOn = status;
    blink = false;
  }
  
  public void update() {
    //Blinking light
    if(blink && frameCount % 4 == 0) {
      countdown--;
      
      if(countdown == 0) {
        toggle();
        countdown = (int) random(20, 50);
      }
    }
    
    //glow flicker
    if(lightOn && frameCount % 4 == 0) {
      float newGlowWidth = glowWidth + (random(-5, 5));
      glowIncr = newGlowWidth / glowRes;
    }
  }
  
  public void render() {
    noStroke();
    
    //glow
    if(lightOn) {
      for(int i = 0; i < glowRes; i++) {
        fill(c, glowSAlpha - ((i + 1) * glowAlphaIncr));
        ellipse(pos.x, pos.y, radius + glowIncr*i, radius + glowIncr*i);
      }
    }
    
    //actual dot
    if(lightOn)
      fill(c);
    else
      fill(cOff);
    
    ellipse(pos.x, pos.y, radius, radius);
  }
}
