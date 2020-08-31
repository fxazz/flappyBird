class Pipe {
  float x;
  float top;
  float bottom;
  float w = 40;

  Pipe() {
    x = width + w;
    top = random(100, height/2);
    bottom = top + bird.r * 4;
  }

  boolean hits(Bird b) {
    if ((b.pos.x >= x) && (b.pos.x <= (x + w))) {
      if ((b.pos.y <= (top + bird.r/2) || (b.pos.y > (top + bird.r * 4 - bird.r/2)))) {
        return true;
      }
    }
    return false;
  }

  void update() {
    x -= 3*speed;
  }

  void show(boolean hit) {
    noStroke();
    stroke(255);
    
    if (hit) {      
      fill(255, 0, 0);
    } else {
      fill(255);
    }
    
    rect(x, 0, w, top); 
    rect(x, bottom, w, height);
  }
}
