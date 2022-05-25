public class spikedBall extends Environment{
  PImage skin;
  int x;
  boolean hit = false;
  
  public spikedBall(int x__){
    x = x__;
  }
  
  void display(){}
  
  void move(){}
  
  void check(){}
  
  boolean checkInFront(){
    for (int i = 0; i < obstacles.size(); i++){
      if (obstacles.get(i).x < x){
        return false;
      }
    }
    return true;
}
