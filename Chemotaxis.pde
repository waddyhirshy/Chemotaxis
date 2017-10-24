int score;//These define the variables so I can use them later in the program
int eater;
int ellipseX;
int ellipseY;
Walker[] Bobs; //declairing the array
void setup()

{
  noStroke();
  ellipseMode(CENTER);//This makes it so an ellipse's position is set by its center not a corner
  size(500, 500);
  ellipseX =  (int)(Math.random()* width);//These randomly place the ellipse on the screen after it is eaten
  ellipseY =  (int)(Math.random()* height);
  Bobs = new Walker[100]; //initializing the array
  for (int i = 0; i < Bobs.length; i++)
  
  {
    Bobs[i]= new Walker (); // Declairing the class
  }
}
void draw()
{
  
  background(51);
  fill(205, 127, 50); //Sets the color of the ellipse
  ellipse(ellipseX, ellipseY, 30, 30); //Draws the ellipse  
  for (int i = 0; i < Bobs.length; i++) {
    Bobs[i].walk();
    Bobs[i].show();
  }
  if (eater > 25) {
score = score + 1; //Once the blob has had more than 25 of its dots touch the ellipse it adds 1 to the score

    ellipseX =  (int)(Math.random()* width);
    ellipseY =  (int)(Math.random()* height);
    eater = 0; // sets eater back to 0 once the blob has eaten the ellipse
  }
  textSize(44);
  fill(212,175,55);
  text("SCORE:", 10,50); // Displays the word SCORE: with the score next to it
  text(score, 180,50);
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
    int moveX = mouseX - myX; // This will make it do the blolb will follow your mouse by setting bias on a posotive or negative x and y values
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
