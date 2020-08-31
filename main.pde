Bird bird;
Pipe pipe;
ArrayList<Pipe> pipes = new ArrayList<Pipe>();

boolean dead = true;

float gravity = 0.2;
float pull_up = -4;
float speed = 1;

int highScore = 0;
int score = 0;
int rate = 80;

void setup () {
  size(600, 800);
}

void draw () {
  background(0);
  
  if (dead) {
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("FLAPPY BIRD\nClick to start\nHIGH SCORE: "+highScore, width/2, height/2);
  }
  
  else {
  
    if (frameCount % (int)(90) == 0) {
      pipes.add(new Pipe());
    }
  
    bird.update();
    bird.show();

    boolean safe = true;
    for (int i = pipes.size() - 1; i >= 0; i--) {
      Pipe p = pipes.get(i);
      p.update();

      if (p.hits(bird)) {
        p.show(true);
        safe = false;
      } else {
        p.show(false);
      }

      if (p.x < -p.w) {
        pipes.remove(i);
        score++;
        highScore = max(score, highScore);
        if(score%2==0) { speed+=0.1; rate -= 1; }
        if(speed > 3) { speed = 3; rate = 40; }
        println(score);
      }
    }
    if(!safe) {
      int i = pipes.size()-1;
      while(pipes.size() > 0) { pipes.remove(i); i--; }
      dead = true;
    }
  }
}

void mousePressed() {
  if (dead) {
    bird = new Bird();
    dead = false;
    score = 0;
    speed = 1;
  }
}
