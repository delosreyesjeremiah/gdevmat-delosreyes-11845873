
// Initialize the walker array
Walker[] walkers = new Walker[10]; 

void resetWalkers()
{
  for (int i = 0; i < 10; i++)
  {
    walkers[i] = new Walker();
    walkers[i].setMass(random(5, 15));
    walkers[i].setScale(walkers[i].mass * 10);
    walkers[i].setColor(random(256), random(256), random(256), 64);
    walkers[i].setPosition(Window.windowWidth * randomGaussian(), Window.windowHeight * randomGaussian());
    walkers[i].setVelocityLimit(10);
  }
}

void mousePressed()
{
  resetWalkers();
}

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  resetWalkers();
}

void draw()
{
  background(255);
  noStroke();
  
  for (Walker walker : walkers)
  {
    walker.update();
    walker.render();
  }
  
  for (int i = 0; i < 10; i++)
  {
    for (int j = 0; j < 10; j++)
    {
      if (walkers[i] != walkers[j])
      {
        walkers[i].applyForce(walkers[j].calculateGravitationalAttraction(walkers[i]));
      }
    }   
  }
}
