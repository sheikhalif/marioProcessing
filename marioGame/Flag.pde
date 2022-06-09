public class Flag extends Environment{
  int x;
  boolean hit = false;
  
  public Flag(int x__){
    x = x__;
  }
  
  void display(){
    stroke(0);
    strokeWeight(30);
    line(x, 400, x, 900);
  }
  
  void move(){
    x-=speed;
  }
  
  void check(){
    if (x <= 200 && !(hit)){
      hit = true;
      levelCompleted = true;
    }
  }
}
