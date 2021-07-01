// note: remove comment in line 53 of the walker class to enable black hole mouse cursor movement

Walker[] matters = new Walker[100]; // initialize the walker array
Walker blackHole = new Walker(); // creates a black hole instance of the walker class

boolean exists = false; // the "exists" boolean ensures that the initial random spawning only happens once

// the function that gets the mouse position
PVector mousePos()
{
  float x = mouseX - Window.widthPx / 2;
  float y = -(mouseY - Window.heightPx / 2);
  return new PVector(x, y);
}

// the function that gets called at the very first frame
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

// the function that gets called every frame
void draw()
{
  // flush the screen with black
  background(0);
  
  // initial random spawning only happens once, resets only after all matter is consumed by the black hole
  if (exists == false)
  {
    for (int i = 0; i < 100; i++)
    {
      matters[i] = new Walker();
      matters[i].spawnMatter();
      matters[i].spawnBlackHole();
      
      // assign further created black holes to the initial black hole position
      matters[i].blackHolePosition = matters[0].blackHolePosition;
    }
    exists = true;
  }
  
  // create the matter and the black hole into existence
  for (int i = 0; i < 100; i++)
  {
    matters[i].createMatter();
    matters[i].createBlackHole();
  }
  
  // determine if all matter is sucked into the black hole
  int counter = 0;
  for (int i = 0; i < 100; i++)
  {
    // calculate the distance between the incoming matter and the black hole
    PVector difference = PVector.sub(matters[i].blackHolePosition, matters[i].matterPosition);
    
    // increment the counter as soon as the matter comes into contact with the black hole
     if (difference.mag() < 25)
    {
      counter++;
    }
    
    // if the black hole has successfully consumed all matter, reset the boolean to spawn new matter and another black hole
    if (counter == 100)
    {
      exists = false;
    }
    
    // the matter gravitates towards the black hole
    matters[i].moveMatter();
  }
}
