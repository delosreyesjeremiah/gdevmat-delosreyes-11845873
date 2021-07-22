class Walker
{
  PVector walkerPosition = new PVector(); // initialize the position
 
  PVector mousePosition = new PVector(); // the mouse position
  PVector direction = new PVector(); // the direction between the mouse and the walker
  PVector velocity = new PVector(); // the velocity
 
  float scale; // the size of the walker
  float acceleration = 1.0f; // the acceleration
  float velocityLimit = 10; // add a limit to the velocity
  
  boolean counted = false; // variable to check if a walker has been counted
  
  // rgba values
  int r;
  int g;
  int b;
  int a;
  
  // the function that spawns the walker at random locations with random properties
  void spawn()
  {
    walkerPosition.x = Window.windowWidth * randomGaussian(); 
    walkerPosition.y = Window.windowHeight * randomGaussian();
    scale = random(1, 51);
   
    r = int(random(256));
    g = int(random(256));
    b = int(random(256));
    a = int(random(50, 151));
  }
 
  // the function that renders the walker
  void render()
  {
    fill(r, g, b, a);
    noStroke();
    circle(walkerPosition.x, walkerPosition.y, scale); 
  }
 
  // the function that establishes the direction of the walker movement
  void getDirection()
  {
    mousePosition = mousePos(); // initialize the mouse position
    direction = PVector.sub(mousePosition, walkerPosition); // get the direction between the mouse and the walker
    velocity = direction.normalize(); // initialize the velocity
  }
 
  // the function that makes the walker move
  void move()
  {
    velocity = direction.normalize().mult(acceleration); // apply acceleration to the velocity
   
    this.velocity.limit(velocityLimit); // apply a limit to the velocity
    this.walkerPosition.add(this.velocity); // apply the velocity to the walker
   
    acceleration += 0.2f; // increase acceleration by 0.2
  }
}
