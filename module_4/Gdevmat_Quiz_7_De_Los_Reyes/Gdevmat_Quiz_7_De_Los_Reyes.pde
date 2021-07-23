
Walker[] walkers = new Walker[100]; // initialize the walker array

// the function that gets called at the very first frame
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // initialize the 100 walkers
  for (int i = 0; i < 100; i++)
  {
    walkers[i] = new Walker();
    walkers[i].setColor(random(256), random(256), random(256), random(50, 151));
    walkers[i].setScale(random(1, 25));
    walkers[i].setAcceleration(0.2f);
    walkers[i].setVelocityLimit(10.0f);
    walkers[i].render(Window.windowWidth * randomGaussian(), Window.windowHeight * randomGaussian());
  }
}

// the function that gets called every frame
void draw()
{
  background(80);
  
  for (Walker walker : walkers)
  {
    walker.render(walker.position.x, walker.position.y); // render the walker
    walker.accelerate(mousePos()); // accelerate the walker to the target
  }
}

// the function that gets the mouse position
PVector mousePos()
{
  float x = mouseX - Window.widthPx / 2;
  float y = -(mouseY - Window.heightPx / 2);
  return new PVector(x, y);
}
