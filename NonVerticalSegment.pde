class NonVerticalSegment extends Segment
{
  private PVector center;
  private float slope;
  private float relIntercept;
  
  public NonVerticalSegment(PVector c, PVector p1, PVector p2)
  {
    super(c, p1, p2);
    center = c;
    PVector delP = PVector.sub(relP2, relP1);
    slope = delP.y / delP.x;
    relIntercept = relP1.y - (relP1.x * slope);
  }
  
  public void setPoint(float angle, float tangent)
  {
    if(abs(angle - HALF_PI) <= EPSILON || abs(angle + HALF_PI) <= EPSILON)
    {
      point.set(center.x, center.y + relIntercept);
    }
    else
    {
      float relX = relIntercept / (tangent - slope);
      point.set(center.x + relX, center.y + (tangent * relX));
    } 
  }
}
