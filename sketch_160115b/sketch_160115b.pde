color[] colors = { #F47F7C, #DC2048, #563081, #A5CD39 };
int numFrames = 300;
 
void setup() {
  size(300, 300);
}
 
void draw() {
  background(255);
  float timeInterpolation = float(frameCount % numFrames) / numFrames;
  color leftColor = lerpColor(colors[0], colors[2], timeInterpolation);
  color rightColor =lerpColor(colors[1], colors[3], timeInterpolation);
  for (int x=0; x<width; x++) {
    float lineInterpolation = x / float(width);
    color c = lerpColor(leftColor, rightColor, lineInterpolation);
    stroke(c);
    line(x, 0, x, height);
  }
}