abstract class Segment implements Curve
{
  private float angL;
  private float angH;
  private PVector point1;
  private PVector point2;
  protected PVector relP1;
  protected PVector relP2;
  private Collection<PVector> points;
  private Collection<PVector> empty;
  protected PVector point;
  private boolean rollover;
  
  protected Segment(PVector c, PVector p1, PVector p2)
  {
    point1 = p1;
    point2 = p2;
    relP1 = PVector.sub(p1, c);
    relP2 = PVector.sub(p2, c);
    float ang1 = (relP1.heading() + TWO_PI) % TWO_PI;
    float ang2 = (relP2.heading() + TWO_PI) % TWO_PI;
    angL = min(ang1, ang2);
    angH = max(ang1, ang2);
    rollover = (angH - angL > PI);
    points = new HashSet<PVector>();
    empty = new HashSet<PVector>();
    point = new PVector();
    points.add(point);
  }
  
  private boolean intersectsPoint(float angle, float tangent)
  {
    if(rollover)
    {
      return angle >= angH || angle <= angL;
    }
    return angle >= angL && angle <= angH;
  }
  
  public void draw()
  {
    line(point1.x, point1.y, point2.x, point2.y);
  }
  
  public Collection<PVector> getPoints(float angle, float tangent)
  {
    if(intersectsPoint(angle, tangent))
    {
      setPoint(angle, tangent);
      return points;
    }
    return empty;
  }
  
  protected abstract void setPoint(float angle, float tangent);
}
