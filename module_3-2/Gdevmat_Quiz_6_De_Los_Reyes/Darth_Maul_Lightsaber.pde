class DarthMaulLightsaber
{
  PVector handle;
  PVector lightsaber;
  
  float handleMagnitude = 60;
  float lightsaberMagnitude = 360;
  
  // the function that renders the handle of the lightsaber
  void handle()
  {
    strokeWeight(8);
    stroke(0, 0, 0);
    
    handle = mousePos();
    handle.normalize().mult(handleMagnitude);
    line(0, 0, handle.x, handle.y);
  }
  
  // the function that renders the opposite handle of the lightsaber
   void handle2()
  {
    strokeWeight(8);
    stroke(0, 0, 0);
    
    handle = mousePos();
    handle.normalize().mult(handleMagnitude);
    line(0, 0, -handle.x, -handle.y);
  }
  
  // the function that renders the lightsaber
  void lightsaber1()
  {
    innerGlow1();
    outerGlow1();
  }
  
  // the function that renders the opposite lightsaber
  void lightsaber2()
  {
   innerGlow2();
   outerGlow2();
  }

  // the function that renders the lightsaber shaft
  void lightsaberShaft1()
  {
    lightsaber = mousePos();
    lightsaber.normalize().mult(lightsaberMagnitude);
    line(handle.x, handle.y, lightsaber.x, lightsaber.y);
  }

  // the function that renders the inner glow of the lightsaber
  void innerGlow1()
  {
    strokeWeight(4);
    stroke(255, 255, 255);
  
    lightsaberShaft1();
  }

  // the function that renders the outer glow of the lightsaber
  void outerGlow1()
  {
    strokeWeight(16);
    stroke(255, 0 , 0, 75);
   
    lightsaberShaft1();
  }
  
  // the function that renders the opposite lightsaber shaft
  void lightsaberShaft2()
  {
    lightsaber = mousePos();
    lightsaber.normalize().mult(lightsaberMagnitude);
    line(-handle.x, -handle.y, -lightsaber.x, -lightsaber.y);
  }
  
  // the function that renders the inner glow of the opposite lightsaber
  void innerGlow2()
  {
    strokeWeight(4);
    stroke(255, 255, 255);
  
    lightsaberShaft2();
  }

  // the function that renders the outer glow of the opposite lightsaber
  void outerGlow2()
  {
    strokeWeight(16);
    stroke(255, 0 , 0, 75);
   
    lightsaberShaft2();
  }
  
  // the function that prints the magnitude of one side of the double-sided lightsaber
  void printMagnitude()
  {
    PVector magnitude = lightsaber.add(handle);
    println("Magnitude: " + magnitude.mag());  
  }
}
