
Walker[] walkers = new Walker[10]; // initialize the walker array

// initialize the forces
PVector gravity = new PVector(0, -0.4);
PVector wind = new PVector(0.15, 0);

// the function that gets called at the very first frame
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  // initialize the 10 walkers
  for (int i = 0; i < 10; i++)
  {
    walkers[i] = new Walker();
    walkers[i].setMass(10 - i);
    walkers[i].setScale(walkers[i].mass * 15);
    walkers[i].setColor(random(256), random(256), random(256), 255);
    walkers[i].setVelocityLimit(10);
    walkers[i].render(-500, 200);
  }
}

// the function that gets called every frame
void draw()
{
  background(80); 
  
  stroke(0.1);
  
  for (Walker walker : walkers)
  {
    walker.render(walker.position.x, walker.position.y); // render the walker
    walker.applyForce(wind); // apply the wind
    walker.applyForce(gravity); // apply the gravity
    walker.update(); // update the walker due to applied forces
    walker.applyBounce(); // apply a bounce force to the walker when necessary
  }
}
