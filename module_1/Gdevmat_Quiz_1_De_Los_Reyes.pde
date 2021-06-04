float amplitude = 0; // amplitude of the sine function
float frequency = 0.03f; // frequency of the sine function
boolean maxGrowth = false; // controls growth of the sine function

// the function that gets called at the very first frame
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

// the function that gets called every frame
void draw()
{
  background(0);
  
  // size of the sine function automatically changes during runtime (manually through WASD keys)
  manipulateSineFunction();
  
  // draw the cartesian plane
  drawCartesianPlane();
 
  // draw the functions
  drawSineFunction(amplitude, frequency);
  drawQuadraticFunction();
  drawLinearFunction();
}

// function that draws the cartesian plane
void drawCartesianPlane()
{
  strokeWeight(1);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  for (int i = -300; i <= 300; i += 10)
  {
    line(i, -3, i, 3);
    line(-3, i, 3, i);
  } 
}

// function that draws the quadratic function: f(x) = x^2 - 15x - 3 (yellow)
void drawQuadraticFunction()
{
  color yellow = color(255, 255, 0);
  fill(yellow);
  noStroke();
  
  for (float x = -300; x <= 300; x += 0.1f)
  {
   circle(x, (float)Math.pow(x, 2) - (x * 15) - 3, 4); 
  }  
}

// function that draws the linear function: f(x) = -5x + 30 (purple)
void drawLinearFunction()
{
  color purple = color(128, 0, 128);
  fill(purple);
  noStroke();
  
  for (float x = -300; x <= 300; x += 0.1f)
  {
   circle(x, (-5 * x) + 30, 4); 
  }  
}

// function that draws the sine function : f(x) = a * sin(b(x)) (red)
void drawSineFunction(float amplitude, float frequency)
{
  color red = color(255, 0, 0);
  fill(red);
  noStroke();
  
  for (float x = -300; x <= 300; x += 0.1f)
  {
   circle(x, amplitude * ((float)Math.sin(frequency * x)), 4); 
  }
}

// changes the size of the sine function during runtime
void manipulateSineFunction()
{
  // manually changes the size of the sine function using WASD keys
  if (keyPressed)
  {
    if (key == 'w' || key == 'W')
    {
      amplitude += 10;
    }
    else if (key == 's' || key == 'S')
    {
      amplitude -= 10;
    }
    else if (key == 'a' || key == 'A')
    {
      frequency -= 0.005f;
    }
      else if (key == 'd' || key == 'D')
    {
      frequency += 0.005f;
    }
  }
  
  // automatically changes the size of the sine function
  if ((maxGrowth == false) && (keyPressed == false))
  {
    amplitude += 30;
    if (amplitude >= 150)
    {
      maxGrowth = true;
    }
  }
  else if ((maxGrowth == true) && (keyPressed == false))
  {
    amplitude -= 30;
    if (amplitude <= -150)
    {
      maxGrowth = false; 
    }
  }
}
