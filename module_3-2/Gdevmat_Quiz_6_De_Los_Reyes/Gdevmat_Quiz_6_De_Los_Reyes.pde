
DarthMaulLightsaber lightsaber = new DarthMaulLightsaber(); // creates an instance of the darth maul lightsaber class

// the function that gets called at the very first frame
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

// the function that gets the mouse position
PVector mousePos()
{
  float x = mouseX - Window.widthPx / 2;
  float y = -(mouseY - Window.heightPx / 2);
  return new PVector(x, y);
}

// the function that gets called every frame
void draw()
{
  // flush the screen with grey
  background(130);
  
  // render the lightsaber handle
  lightsaber.handle(); 
  lightsaber.handle2();
  
  // render the lightsaber
  lightsaber.lightsaber1();
  lightsaber.lightsaber2();
  
  // print the magnitude of the lightsaber (one side)
  lightsaber.printMagnitude();
  
  // add blur effect
  filter(BLUR, 3);
}
