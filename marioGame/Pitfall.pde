public class Pitfall extends Traps{
  int x;
  public Pitfall(int x__){
    x = x__;
  }
  
  void display(){
    fill(255);
    rect(x, 900, 300, 1080);
    fill(0);
    stroke(0);
    strokeWeight(8);
    line(x, 900, x, 1080);
    line(x+300, 900, x+300, 1080);
  }
  
  void move(){
    x-=speed;
  }
}
