class Walker
{
  float x;
  float y;
  int rng;
  
  // the function that draws and renders the walker
  void render()
  {
    int r = int(random(256)); // randomize the red values (0 to 255)
    int g = int(random(256)); // randomize the green values (0 to 255)
    int b = int(random(256)); // randomize the blue values (0 to 255)
    int a = int(random(50, 101)); // randomize the alpha values (50 to 100)
    
    fill(r, g, b, a);
    noStroke();
    
    circle(x, y, 30);
    
    // randomizes the eight directions (0 to 7)
    rng = int(random(8));
  }
  
  // the function that randomizes the movements of the walker
  void randomWalk()
  {
    // moves up
    if (rng == 0)
    {
      y += 10;
    }
    // moves down
    else if (rng == 1)
    {
      y -= 10;
    }
    // moves to the left
    else if (rng == 2)
    {
      x -= 10; 
    }
    // moves to the right
    else if (rng == 3)
    {
      x += 10; 
    }
    // moves to the upper left
    else if (rng == 4)
    {
      x -= 10;
      y += 10;
    }
    // moves to the upper right
    else if (rng == 5)
    {
      x += 10;
      y += 10;
    }
    // moves to the lower left
    else if (rng == 6)
    {
       x -= 10;
       y -= 10;
    }
    // moves to the lower right
    else if (rng == 7)
    {
      x += 10;
      y -= 10;
    }
  }
  
  // the function that has a bias on the movements of the walker
  void randomWalkBiased()
  {
    // 25% bias of walker moving upwards
    int bias = int(random(4));
    if (bias == 1)
    {
      rng = 0; 
    }
    // 25% bias of walker moving downwards
    else
    {
     bias = int(random(4));
      if (bias == 1)
      {
        rng = 1; 
      }
      // 40% bias of walker moving left
      else
      {
        bias = int(random(5));
        if (bias <= 1)
        {
          rng = 2;
        }
        // 40% bias of walker moving right
        else
        {
          bias = int(random(5));
          if (bias <= 1)
          {
            rng = 3; 
          }
          // walker randomly moves diagonally (corners) if no biased movements are chosen
          else
          {
            rng = int(random(4, 8)); 
          }
        }
      }
    }
    
    randomWalk();
  }
}
