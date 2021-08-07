public class Liquid
{
  private float x;
  private float y;
  private float horizon;
  private float depth;
  private float dragCoefficient;
  
  public Liquid(float x, float y, float horizon, float depth, float dragCoefficient)
  {
    this.x = x;
    this.y = y;
    this.horizon = horizon;
    this.depth = depth;
    this.dragCoefficient = dragCoefficient;
  }
  
  public void render(float red, float green, float blue)
  {
    fill(red, green, blue);
    beginShape();
    vertex(x - horizon, y, 0);
    vertex(x + horizon, y, 0);
    vertex(x + horizon, y + depth, 0);
    vertex(x - horizon, y + depth, 0);
    endShape();
  }
  
  public boolean isCollidingWith(Walker walker)
  {
    PVector position = walker.position;
    return position.x >= this.x - this.horizon &&
           position.x <= this.x + this.horizon &&
           position.y <= this.y; 
  }
  
  public PVector calculateDragForce(Walker walker)
  {
    // drag magnitude is coefficient of drag * speed^2
    float speed = walker.getVelocity().mag();
    float dragMagnitude = this.dragCoefficient * speed * speed;
    
    // direction is inverse of velocity
    PVector dragForce = walker.getVelocity().copy().mult(-1);
    
    // scale drag force according to magnitude
    dragForce.normalize().mult(dragMagnitude);
    
    return dragForce;
  }
}
