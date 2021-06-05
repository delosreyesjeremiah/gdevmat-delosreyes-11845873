
// the function that gets called at the very first frame
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255); 
}

// creates new instance of the walker class
Walker perlinWalker = new Walker(); 

// the function that gets called every frame
void draw()
{
  perlinWalker.perlinWalk();
}
