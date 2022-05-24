import java.util.*;

Character mario = new Character();
Platform grassPlatform = new Platform();
int speed = mario.speed;
ArrayList<Spike> spikes = new ArrayList<Spike>();


void setup(){
  size(1920, 1080);
  Spike spike1 = new Spike(600);
  spikes.add(spike1);
}

void keyPressed(){
  println(keyCode);
  if (keyCode == 68){
    for (int i = 0; i < spikes.size(); i++){
      Spike currentSpike = spikes.get(i);
      if (currentSpike.x < -90){
        spikes.remove(currentSpike);
      }
      else{
        currentSpike.move();
      } 
    }
  }
  if (keyCode == 32){
    mario.jump();
  }
  
}

void draw(){
  background(255);
  mario.display();
  mario.gravity();
  grassPlatform.display();
  for(int i = 0; i < spikes.size(); i++){
    spikes.get(i).display();
  }
}
  
