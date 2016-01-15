class Block
{
  float xposition;
  float yposition;   
  float Size;
  
  Block()
  {
    xposition=random(100, width-100);
    yposition=random(100, width-100);     
    Size=10;
  }
}