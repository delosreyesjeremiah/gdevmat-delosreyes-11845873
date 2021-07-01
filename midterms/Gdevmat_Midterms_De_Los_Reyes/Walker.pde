class Walker
{
  PVector matterPosition = new PVector(); // initialize the position of the matter
  PVector blackHolePosition = new PVector(); // initialize the position of the black hole
  
  // render properties (rgba values, scale)
  int r;
  int g;
  int b;
  int a;
  float scale;
  
  // the function that spawns matter at random locations and sizes
  void spawnMatter()
  {
    // controls the spawn location
    float gaussian = randomGaussian(); // controls spawn location using gaussian distribution
    float standardDeviation = 100; // adjust to control the dispersion
    float mean = 0; // adjust to control the spawn location
    matterPosition.x = random(-640, 640.1); // randomize value of x factoring in the height of the screen as min and max values
    matterPosition.y = standardDeviation * gaussian + mean; // randomize value of y using gaussian distribution
    
    // randomize the size (maximum limit is 3/5 the size of the black hole)
    scale = random(1, 31);
    
    // randomize the color
    r = int(random(256)); // randomize the red values (0 to 255)
    g = int(random(256)); // randomize the green values (0 to 255)
    b = int(random(256)); // randomize the blue values (0 to 255)
    a = int(random(50, 201)); // randomize the alpha values (50 to 200)
  }
  
  // the function that creates the matter
  void createMatter()
  {
    fill(r, g, b, a);
    noStroke();
    circle(matterPosition.x, matterPosition.y, scale);
  }
  
  // the function that spawns the black hole at random locations
  void spawnBlackHole()
  {
    // randomize the spawn location
    blackHolePosition.x = random(-640, 640.1);
    blackHolePosition.y = random(-360, 360.1);
  }
  
  // the function that creates the black hole (note: constant scale of 50)
  void createBlackHole()
  {
    // note: remove comment "//" below to enable black hole mouse cursor movement
    //blackHolePosition = mousePos();
    
    fill(255, 255, 255);
    noStroke();
    circle(blackHolePosition.x, blackHolePosition.y, 50);
  }
  
  // the function that moves the matter towards the black hole
  void moveMatter()
  {
    // get the direction between the matter and the black hole
    PVector direction = PVector.sub(blackHolePosition, matterPosition);
    
    // add direction to the current position of the matter
    //increase the value for a higher intensity of the black hole's gravitational pull
    matterPosition.add(direction.normalize().mult(3)); 
  }
}
