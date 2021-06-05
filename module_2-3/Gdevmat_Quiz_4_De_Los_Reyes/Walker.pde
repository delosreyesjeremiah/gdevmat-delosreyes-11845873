class Walker
{
  float x;
  float y;
  
  // change in time of x and y values
  float tx = 0, ty = 1000; 
  
  // change in time of rgb values (a value should be 255 by default)
  float tr = 255, tg = 64, tb = 128; 
  
  // change in time of thickness value
  float tt; 
  
  // function that draws and renders the circle
  void render()
  {
    int r = int(map(noise(tr), 0, 1, 0, 255)); // randomize the red values using perlin (0 to 255)
    int g = int(map(noise(tg), 0, 1, 0, 255)); // randomize the green values using perlin (0 to 255)
    int b = int(map(noise(tb), 0, 1, 0, 255)); // randomize the blue values using perlin (0 to 255)
    
    // increment change in time of rgb values
    tr += 0.05f;
    tg += 0.05f;
    tb += 0.05f;
    
    // randomize thickness value using perlin
    float thickness = perlinThickness();
    
    // draw the circle
    noStroke();
    fill(r, g, b);
    circle(x, y, thickness); 
  }
  
  // function that illustrates perlin noise by walking
  void perlinWalk()
  {
    // randomize x and y values using perlin, map scale to screen size
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
    
    // increment change in time of x and y values
    tx += 0.005f;
    ty += 0.005f;
    
    // render the circle
    render();
  }
  
  // function that randomizes the thickness of the circle using perlin
  float perlinThickness()
  {
    float thickness = map(noise(tt), 0, 1, 5, 150); // randomize the thickness using perlin (5 to 150)
    tt += 0.01f; // increment change in time of the thickness
    return thickness;
  }
}
