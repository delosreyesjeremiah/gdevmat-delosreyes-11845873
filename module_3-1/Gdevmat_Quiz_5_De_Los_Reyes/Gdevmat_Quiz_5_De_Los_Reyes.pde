
VectorWalker myVectorWalker = new VectorWalker(); // creates a new instance of the vector walker class
VectorWalker myVectorWalker2 = new VectorWalker(); // creates another instance of the vector walker class

// the function that gets called at the very first frame
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // initialize the starting speed of the vector walker
  myVectorWalker.randomizeSpeed();
  myVectorWalker2.randomizeSpeed();
}

// the function that gets called every frame
void draw()
{
  // flush the screen with black background
  background(255);
  
  // the first vector walker
  myVectorWalker.render();
  myVectorWalker.moveAndBounce();
  
  // the second vector walker
  myVectorWalker2.render();
  myVectorWalker2.moveAndBounce();
}
