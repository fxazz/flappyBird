class Bird {
  PVector pos;
  PVector vel;
  float r = 35;
  
  Bird() {
    pos = new PVector(40, height/2);
    vel = new PVector();
  }
  
  void update() {
    if(pos.y < 0 || pos.y > height) {
      if(pos.y < 0) pos.y = 0;
      if(pos.y > height) pos.y = height;
      vel.y = 0;
    } else {
      vel.y += gravity;
      pos.y += vel.y;
      //println(pos.y, vel.y);
    }
  }
  
  void show() {
    fill(255, 255, 255);
    ellipse(pos.x, pos.y, r, r);
  }
}

void keyPressed() {
  if (keyCode == ' ' || keyCode == UP) {
    bird.vel.y = pull_up;
  }
}
