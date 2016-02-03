class Snake
{
  int Snakelength;
  float sidelength;
  String direction;
  ArrayList <Float>  xposition, yposition;
  int counter;
  int highScore;
  
  Snake()
  {
    Snakelength=1;
    sidelength=20;
    direction="Right";
    xposition= new ArrayList();
    yposition = new ArrayList();
    xposition.add(random(width));
    yposition.add(random(height)); 
    counter=0;
    highScore=0;
  }
}