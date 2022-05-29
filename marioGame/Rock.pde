public class Rock extends backgroundItems{
  int x;
  int rng1 = 150+(int)(Math.random() * 101);
  int rng2 = 100 + (int)(Math.random() * 101);
  int rng3 = 100 + (int)(Math.random() * 101);
  int rng4 = 250 + (int)(Math.random() * 101);
  int rng5 = 150+(int)(Math.random() * 101);
  public Rock(int x__){
    x = x__;
  }
  
  void display(){
    fill(200);
    arc(x, 900, rng1, rng2, PIE, PIE+PIE+PIE);
    arc(x+rng3, 900, rng4, rng5, PIE, 3*PIE);
  }
  
  void move(){
    x-=speed*0.3;
  }
}
