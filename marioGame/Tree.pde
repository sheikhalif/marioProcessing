public class Tree extends backgroundItems{
  int x;
  public Tree(int x__){
    x = x__;
  }
  
  void display(){
    noStroke();
    fill(193, 171, 98);
    rect(x+100, 500, 50, 400);
    fill(199, 237, 206);
    triangle(x, 600, x+250, 600, x+125, 400);
    triangle(x, 470, x+250, 470, x+125, 270);
    triangle(x, 340, x+250, 340, x+125, 140);  
  }
  
  void move(){
    x-=speed;
  }
}
    
    
