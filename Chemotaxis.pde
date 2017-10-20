int score;
int eater;
int ellipseX;
int ellipseY;
Walker[] Bobs; //declairing the array
void setup()

{
  noStroke();
  ellipseMode(CENTER);
  size(500, 500);
  ellipseX =  (int)(Math.random()* width);
  ellipseY =  (int)(Math.random()* height);
  Bobs = new Walker[100]; //initializing the array
  for (int i = 0; i < Bobs.length; i++)
  
  {
    Bobs[i]= new Walker ();
  }
}
void draw()
{
  
  background(51);
  fill(205, 127, 50);
  ellipse(ellipseX, ellipseY, 30, 30);  
  for (int i = 0; i < Bobs.length; i++) {
    Bobs[i].walk();
    Bobs[i].show();
  }
  if (eater > 25) {
score = score + 1; 

    ellipseX =  (int)(Math.random()* width);
    ellipseY =  (int)(Math.random()* height);
    eater = 0;
  }
  textSize(44);
  fill(212,175,55);
  text("SCORE:", 10,50);
  text(score, 165,50);
}
class Walker
{
  int myX, myY;
  Walker()
  {
    myX = 250;
    myY = 250;
  }
  void walk()
  {
    int moveX = mouseX - myX;
    int moveY = mouseY- myY;
    myX = myX + (int)(Math.random()*9) + (int)map(moveX, -150, 150, -8, -1);
    myY = myY + (int)(Math.random()*9) + (int)map(moveY, -150, 150, -8, -1);
    if (dist(myX, myY, ellipseX, ellipseY) <30) {
      eater = eater + 1;
    }
  }
  void show()

  {
    fill(192, 192, 192);
    ellipse(myX, myY, 100, 100);
  }
}
