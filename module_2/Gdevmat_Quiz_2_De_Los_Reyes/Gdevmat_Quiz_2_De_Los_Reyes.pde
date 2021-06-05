
Walker myWalker = new Walker(); // creates a new instance of the walker class
Walker myWalker2 = new Walker(); // creates another instance of the walker class

// the function that gets called at the very first frame
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

// the function that gets called every frame
void draw()
{
  myWalker.render();
  myWalker.randomWalk();
  
  myWalker2.render();
  myWalker2.randomWalkBiased();
}
