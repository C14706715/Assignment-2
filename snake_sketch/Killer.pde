class Killer
{
  PVector circle;
  
  Killer()
  {
    //PVector used for snake killer function
    circle=new PVector(random(0, width), random(0, height));
  }
}