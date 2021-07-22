
Walker[] walkers = new Walker[100]; // initialize the walker array

boolean spawn = true; // the "spawn" boolean ensures that the initial random spawning only happens once

int counter = 0;

// the function that gets called at the very first frame
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // initialize the 100 walkers
  for (int i = 0; i < 100; i++)
  {
    walkers[i] = new Walker();
  }
}

// the function that gets called every frame
void draw()
{
  // flush the screen
  background(80);
  
  // spawn the walkers
  if (spawn == true)
  {
    for (int i = 0; i < 100; i++)
    {
      walkers[i].spawn();
    }
    spawn = false;
  }
  
  for (int i = 0; i < 100; i++)
  {
    // only render the walker if the walker it has not been counted (not yet reached the mouse position)
    if (walkers[i].counted == false)
    {
      walkers[i].render(); // render the walker
      walkers[i].getDirection(); // get the direction of the walker movement
      walkers[i].move(); // make the walker move
      
      // get the distance between the walker position and the mouse position
      PVector distance = PVector.sub(walkers[i].mousePosition, walkers[i].walkerPosition);
      
      // if the walker reaches the mouse position
      if ((distance.mag() <= 5) && (walkers[i].counted == false))
      {
        counter++; // increment the counter
        walkers[i].counted = true; // the walker has been counted
      }
    }
  }
  
  // if the counter reaches 100, reset the counter and spawning conditions
  if (counter >= 100)
  {
    spawn = true;
    counter = 0;
    
    for (int i = 0; i < 100; i++)
    {
      walkers[i].counted = false;  
    }
  }
}

// the function that gets the mouse position
PVector mousePos()
{
  float x = mouseX - Window.widthPx / 2;
  float y = -(mouseY - Window.heightPx / 2);
  return new PVector(x, y);
}
