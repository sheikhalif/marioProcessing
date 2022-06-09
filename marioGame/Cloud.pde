public class Cloud extends backgroundItems{
  int x;
  int rng1 = 180+(int)(Math.random() * 41);
  int rng2 = 70 + (int)(Math.random() * 21);
  int rng3 = 150 + (int)(Math.random() * 21);
  int rng4 = 120 + (int)(Math.random() * 61);
  int rng5 = 140+(int)(Math.random() * 61);
  int rng6 = 140+(int)(Math.random() * 41);
  public Cloud(int x__){
    x = x__;
  }
  
  void display(){
    fill(255);
    circle(x, rng1, rng4);
    circle(x+rng2, rng6, rng5);
    circle(x+rng3, rng1, rng4);
    x-=1;
  }
  
  void move(){
    x-=(speed*0.1);
  }
}
