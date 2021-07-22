class Walker
{
  int mass;
  int scale;
  
  PVector position = new PVector();
  PVector acceleration = new PVector();
  PVector velocity = new PVector();
  
  float velocityLimit = 10;

  float r;
  float g;
  float b;

  // function that randomizes the color of the walker
  void randomColor()
  {
    r = int(random(256)); // randomize the red values (0 to 255)
    g = int(random(256)); // randomize the green values (0 to 255)
    b = int(random(256)); // randomize the blue values (0 to 255)
  }
  
  // function that renders the walker
  void render(float x, float y)
  {
    position.x = x;
    position.y = y;
    
    fill(r, g, b);
    stroke(0.1);
    circle(position.x, position.y, scale);
  }
  
  // function that applies the force to the walker
  void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }
  
  // function that moves the walker
  void move()
  {
    this.velocity.add(acceleration); // apply the acceleration
    this.velocity.limit(velocityLimit); // set a limit to the velocity
    this.position.add(this.velocity); // apply the velocity
    this.acceleration.mult(0); // reset acceleration
  }
  
  // function that applies a bounce force to the walker
  void applyBounce()
  {
     if ((position.x > Window.right) || (position.x < Window.left))
    {
      velocity.x *= -1;
    }

    if ((position.y > Window.top) || (position.y < Window.bottom))
    {
      velocity.y *= -1;
    }
  }
}
