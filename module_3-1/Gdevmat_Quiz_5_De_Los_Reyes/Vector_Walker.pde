class VectorWalker
{
  PVector position = new PVector(); // initialize the position of the walker
  PVector speed = new PVector(); // initialize the speed of the walker
  
  boolean render = false; // check if the vector walker has been rendered
  
  // rgb values
  int r;
  int g;
  int b;
  
  // the function that draws and renders the walker
  void render()
  {
    if (render == false)
    {
      r = int(random(256)); // randomize the red values (0 to 255)
      g = int(random(256)); // randomize the green values (0 to 255)
      b = int(random(256)); // randomize the blue values (0 to 255)
      
      render = true;
    }
    
    fill(r, g, b, 255);
    noStroke();
    
    circle(position.x, position.y, 50);
  }
  
  // function that randomizes the initial speed of the walker
  void randomizeSpeed()
  {
    speed.x = int(random(-25, 26));
    speed.y = int(random(-25, 26));
  }
  
  // the function that moves and bounces the walker off the edge of the screen
  void moveAndBounce()
  {
    position.add(speed);
    
    if ((position.x > Window.right) || (position.x < Window.left))
    {
      speed.x *= -1;
      render = false;
      render(); // change the color of the walker
    }
    
    if ((position.y > Window.top) || (position.y < Window.bottom))
    {
      speed.y *= -1;
      render = false;
      render(); // change the color of the walker
    }
  }
}
