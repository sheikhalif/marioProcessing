public class Character{
  PImage skin;
  int speed;
  int jumpForce;
  
  public Character(){
    speed = 20;
    jumpForce = 20;
  }
  
  void display(){
    background(255);
    fill(0);
    rect(100, 600, 100, 300);
  }
}
  
  
