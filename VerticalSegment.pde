class VerticalSegment extends Segment
{
  private float relX;
  private float absX;
  private PVector center;
  
  public VerticalSegment(PVector c, PVector p1, PVector p2)
  {
    super(c, p1, p2);
    center = c;
    relX = relP1.x;
    absX = p1.x;
  }
  
  public void setPoint(float angle, float tangent)
  {
    point.set(absX, center.y + (tangent * relX));
  }
}
