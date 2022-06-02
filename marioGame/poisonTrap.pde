public class poisonTrap extends Traps{
  int x;
  boolean hit = false;
  
  public poisonTrap(int x__){
    x = x__;
  }
  
  void display(){
    noStroke();
    fill(0);
    rect(x, 900, 300, 180);
    fill(122, 37, 193);
    rect(x+10, 910, 10, 10);
    rect(x+25, 1000, 10, 10);
    rect(x+40, 940, 10, 10);
    rect(x+70, 1020, 10, 10);
    rect(x+90, 920, 10, 10);
    rect(x+115, 970, 10, 10);
    rect(x+130, 1000, 10, 10);
    rect(x+150, 930, 10, 10);
    rect(x+165, 990, 10, 10);
    rect(x+190, 950, 10, 10);
    rect(x+205, 1020, 10, 10);
    rect(x+220, 980, 10, 10);
    rect(x+235, 970, 10, 10);
    rect(x+250, 930, 10, 10);
    rect(x+275, 1040, 10, 10);
    rect(x+280, 940, 10, 10);
    rect(x+10, 1000, 10, 10);
    rect(x+30, 1040, 10, 10);
    rect(x+50, 1060, 10, 10);
    rect(x+80, 1070, 10, 10);
    rect(x+110, 1030, 10, 10);
    rect(x+120, 980, 10, 10);
    rect(x+140, 1000, 10, 10);
    rect(x+150, 1070, 10, 10);
    rect(x+160, 1010, 10, 10);
    rect(x+180, 1050, 10, 10);
    rect(x+210, 1030, 10, 10);
    rect(x+240, 1000, 10, 10);
    rect(x+270, 1060, 10, 10);
    rect(x+290, 1040, 10, 10);
    check();
    
  }
  
  void move(){
    x-=speed;
  }
  
  void check(){
    if (!(hit) && mario.yval+300 >= 900 && x < 200 && x > -100){
      mario.damage();
      mario.paranoiaCountdown = 600;
      mario.paranoia();
      hit = true;
    }
  }
}
    
