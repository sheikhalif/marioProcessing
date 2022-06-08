public class tutorialText extends Environment{
  int x = 0;
  String message = "";
  PFont marioFont = createFont("super_mario_rpg_font.ttf", 150);
  
  public tutorialText (int x__, String s){
    x = x__;
    s = message;
  }
  
  void display(){
    textFont(marioFont);
    text(message, x, 200);
  }
  
  void move(){
    x-=speed;
  }
}
