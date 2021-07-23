class Walker
{
  private PVector position = new PVector(); // initialize the position
 
  private PVector direction = new PVector(); // the direction 
  private PVector velocity = new PVector(); // the velocity
  private PVector acceleration = new PVector(); // the acceleration
  
  private float scale; // the size of the walker
  private float accelerationSpeed; // the acceleration speed
  private float velocityLimit; // add a limit to the velocity
  
  // rgba values
  private float r;
  private float g;
  private float b;
  private float a;
  
  // the function that sets the scale of the walker
  public void setScale(float value)
  {
    scale = value;
  }
  
  // the function that sets the acceleration speed of the walker
  public void setAcceleration(float value)
  {
    accelerationSpeed = value;
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
  
  // the function that renders the walker at a specific location
  public void render(float x, float y)
  {
    position.x = x;
    position.y = y;
    
    fill(r, g, b, a);
    noStroke();
    circle(position.x, position.y, scale); 
  }

  // the function that makes the walker accelerate towards a target
  public void accelerate(PVector target)
  {
    direction = PVector.sub(target, position); // get the direction between the target destination and the walker position
    acceleration = direction.normalize().mult(accelerationSpeed); // assign the normalized direction to the acceleration
    
    this.velocity.add(this.acceleration); // apply the acceleration to the velocity
    this.velocity.limit(velocityLimit); // apply a limit to the velocity
    this.position.add(this.velocity); // apply the velocity to the walker
  }
}
