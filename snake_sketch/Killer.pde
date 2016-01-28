class Killer
{
  PVector position;
  
  Killer()
  {
    //PVector used for snake killer function
    position=new PVector(random(0, width), random(0, height));
  }
}