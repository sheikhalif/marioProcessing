public class Character{
  PImage skin;
  int speed;
  int jumpForce=20;
  int yval = 600;
  int yvalChange = 10;
  
  public Character(){
    speed = 20;
  }
  
  void display(){
    background(255);
    fill(0);
    rect(100, yval, 100, 300);
  }
  
  void jump(){
    while (yvalChange < 40){
      yval-=yvalChange;
      yvalChange*=1.2;
    }
    yvalChange = 10;
  }
  
  void gravity(){
    if (yval < 600)yval+=5;
  }
    
    
}
  
  
