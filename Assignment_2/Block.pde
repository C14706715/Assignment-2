class Block
{
  PVector position;   
  float Size;
  
  Block()
  {
    position=new PVector(random(100, width-100), random(100, width-100));
    Size=10;
  }
}