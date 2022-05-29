public class Background extends backgroundItems{
  color color1 = color(48, 148, 214);
  color color2 = color(195, 227, 247); 
  public Background(){}
  
  void display(){
    /**
    Makes a nicer looking background with a gradient but makes the game laggy
    
    for (int i = 0; i < 900; i++){
      float inter = map(i, 0, 900, 0, 1);
      color c = lerpColor(color1, color2, inter);
      stroke(c);
      line(0, i, 1920, i);
    }
  }
  **/
  noStroke();
  fill(207, 233, 250);
  rect(0, 0, 1920, 900);
}
}
