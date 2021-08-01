
Walker[] walkers = new Walker[8]; // initialize the walker array

// the function that resets the walkers
void resetWalkers()
{
  int positionY = 0;

   // initialize the 8 walkers
  for (int i = 0; i < 8; i++)
  {
    positionY = 2 * (Window.windowHeight / 8) * (i - 4);
    walkers[i] = new Walker();
    walkers[i].setMass(8 - (i - 1));
    walkers[i].setScale(walkers[i].mass * 10);
    walkers[i].setColor(random(256), random(256), random(256), 255);
    walkers[i].setPosition(-500, positionY);
    walkers[i].setVelocityLimit(10);
  }
}

// if mouse has been pressed reset the walkers
void mousePressed()
{
  resetWalkers();
}

// the function that gets called at the very first frame
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  resetWalkers();
}
// the function that gets called every frame
void draw()
{
  background(255);
  
  // draw a vertical line at the center
  fill(0, 0, 0);
  for (float y = Window.bottom; y <= Window.top; y += 0.1f)
  {
   circle(0, y, 5); 
  }
  
  noStroke();
  for (Walker walker: walkers)
  {
    // Friction = -1 * mew * N * v
    float mew = 0.01f;
    if (walker.position.x > 0)
        mew = 0.4f;
    float normalForce = 1;
    float frictionMagnitude = mew * normalForce;
    PVector friction = walker.getVelocity().copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    
    // apply the friction
    walker.applyForce(friction);
    
    // apply the acceleration
    PVector acceleration = new PVector(0.2 , 0);
    walker.applyForce(acceleration);
    
    // apply bounce to the walker if necessary
    walker.applyBounce();
    
    // update the walker
    walker.update();
    
    // render the walker
    walker.render();
  }
}
