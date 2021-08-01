class Walker
{
  private float mass;
  private float scale;
  
  private PVector position = new PVector();
  private PVector acceleration = new PVector();
  private PVector velocity = new PVector();
  
  private float velocityLimit;

  private float r;
  private float g;
  private float b;
  private float a;
  
  // the function that gets the velocity of the walker
  public PVector getVelocity()
  {
    return velocity;
  }
  
  // the function that gets the mass of the walker
  public float getMass()
  {
    return mass;
  }
  
  // the function that sets the scale of the walker
  public void setScale(float value)
  {
    scale = value;
  }
  
  // the function that sets the mass of the walker
  public void setMass(float value)
  {
    mass = value;
  }
  
  // the function that sets the velocity limit of the walker
  public void setVelocityLimit(float value)
  {
    velocityLimit = value;
  }
  
  // the function that sets the rgba values of the walker
  public void setColor(float red, float green, float blue, float alpha)
  {
    r = red;
    g = green;
    b = blue;
    a = alpha;
  }
  
  // the function that sets the position of the walker
  public void setPosition(float x, float y)
  {
    position.x = x;
    position.y = y;
  }
  
  // the function that renders the walker
  public void render()
  {
    fill(r, g, b, a);
    circle(position.x, position.y, scale);
  }
  
  // the function that applies the force to the walker
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }
  
  // the function that updates the walker's status based on the applied forces
  public void update()
  {
    this.velocity.add(acceleration); // apply the acceleration
    this.velocity.limit(velocityLimit); // set a limit to the velocity
    this.position.add(this.velocity); // apply the velocity
    this.acceleration.mult(0); // reset acceleration
  }
  
  // function that applies a bounce force to the walker
  public void applyBounce()
  {
     if ((position.x >= Window.right) || (position.x <= Window.left))
    {
      velocity.x *= -1;
      
      if (position.x >= Window.right)
      {
        position.x = Window.right;
      }
      else if (position.x <= Window.left)
      {
        position.x = Window.left;
      }
    }

    if ((position.y >= Window.top) || (position.y <= Window.bottom))
    {
      velocity.y *= -1;
      
      if (position.y >= Window.top)
      {
        position.y = Window.top;
      }
      else if (position.y <= Window.bottom)
      {
        position.y = Window.bottom;
      }
    }
  }
}
