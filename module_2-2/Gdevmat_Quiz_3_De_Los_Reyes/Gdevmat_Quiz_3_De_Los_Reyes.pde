
// the function that gets called at the very first frame
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255); 
}

// the function that gets called every frame
void draw()
{
  // randomizes the color fill
  int r = int(random(256)); // randomize the red values (0 to 255
  int g = int(random(256)); // randomize the green values (0 to 255)
  int b = int(random(256)); // randomize the blue values (0 to 255)
  int a = int(random(10, 101)); // randomize the alpha values (10 to 100)
  
  // controls the spawn location
  float gaussian = randomGaussian(); // controls spawn location using gaussian distribution
  float standardDeviation = 100; // adjust to control the dispersion
  float mean = 0; // adjust to control the spawn location
  float x = standardDeviation * gaussian + mean; // randomize value of x using gaussian distribution
  float y = random(-360, 360.1); // randomize value of y factoring in the height of the screen as min and max values
  
  // controls the size
  float gaussian2 = randomGaussian(); // controls spawn size using gaussian distribution
  float standardDeviation2 = 40; // adjust to control the size dispersion
  float mean2 = 10; // adjust to regulate the size
  float thickness = standardDeviation2 * gaussian2 + mean2; // randomize the size using gaussian distribution
  
  // spawns the circles in random locations
  fill(r, g, b, a);
  noStroke();
  circle(x, y, thickness);
  
  // clears the screen after 300 frames, reset frame count
  if (frameCount == 300)
  {
    background(255);
    frameCount = 0;
  }
}
