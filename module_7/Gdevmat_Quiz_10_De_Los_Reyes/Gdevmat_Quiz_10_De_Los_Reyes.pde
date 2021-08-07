
// Initialize the walker array
Walker[] walkers = new Walker[10]; 

void resetWalkers()
{
  float positionX = 0f;
  for (int i = 0; i < 10; i++)
  {
    positionX = 2f * (Window.windowWidth / 10) * (i - 5);
    walkers[i] = new Walker();
    walkers[i].setMass(int(random(10)));
    walkers[i].setScale(walkers[i].mass * 10);
    walkers[i].setColor(random(256), random(256), random(256), 255);
    walkers[i].setPosition(positionX, Window.windowHeight + 100);
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

// Initialize the ocean
Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f); 

void draw()
{
  background(255);
  
  noStroke();
  
  ocean.render(28, 120, 186);
  
  for (Walker walker: walkers)
  {
    // Simulate gravity
    PVector gravity = new PVector(0, -0.15f * walker.getMass());
    walker.applyForce(gravity);
    
    // If walker enters the ocean, apply the drag force
    if (ocean.isCollidingWith(walker))
    {
      PVector dragForce = ocean.calculateDragForce(walker);
      walker.applyForce(dragForce);
    }
    // Only apply wind if walker is not in the ocean
    else
    {
      // Simulate wind
      PVector wind = new PVector(0.1, 0);
      walker.applyForce(wind);
      
      // Simulate air resistance
      float dragCoefficient = 0.1f;
      float normalForce = 1;
      float frictionMagnitude = dragCoefficient * normalForce;
      PVector friction = walker.getVelocity().copy().mult(-1);
      walker.applyForce(friction.normalize().mult(frictionMagnitude));
    }
    
    walker.applyBounce();
    walker.update();
    walker.render();
  }
}
