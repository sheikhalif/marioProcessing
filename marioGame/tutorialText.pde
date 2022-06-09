public class tutorialText extends Environment{
  int x = 0;
  String message = "";
  
  public tutorialText (int x__, String s){
    x = x__;
    message = s;
  }
  
  void display(){
    fill(0);
    textFont(marioFont);
    textSize(70);
    text(message, x, 200);
  }
  
  void move(){
    x-=speed;
  }
}
