class PeriodicShape
{
  private PVector center;
  private PVector previous;
  private Collection<Curve> curves;
  private Collection<PVector> intersections;
  private float angle;
  private float tangent;
  
  private final float DELTA_ANGLE = QUARTER_PI/30.0f;
  private final float DELTA_TANGENT = tan(DELTA_ANGLE);
  
  public PeriodicShape(PVector c)
  {
    center = c;
    curves = new HashSet<Curve>();
    previous = null;
    intersections = new HashSet<PVector>();
    angle = 0.0f;
    tangent = 0.0f;
  }
  
  public void setLoc(float x, float y)
  {
    previous = new PVector(x, y);
  }
  
  public void lineTo(float x, float y)
  {
    PVector next = new PVector(x, y);
    Segment seg = createSegment(center, previous, next);
    curves.add(seg);
    previous = next;
  }
  
  public Collection<PVector> update()
  {
    intersections.clear();
    angle = (angle + DELTA_ANGLE) % TWO_PI;
    tangent = (tangent + DELTA_TANGENT) / (1 - (tangent * DELTA_TANGENT));
    for(Curve c : curves)
    {
      intersections.addAll(c.getPoints(angle, tangent));
      c.draw();
    }
    for(PVector v : intersections)
    {
      line(center.x, center.y, v.x, v.y);
      ellipse(v.x, v.y, 3, 3);
    }
    return intersections;
  }
  
  private Segment createSegment(PVector center, PVector point1, PVector point2)
  {
    if(abs(point1.x - point2.x) <= EPSILON)
    {
      return new VerticalSegment(center, point1, point2);
    }
    return new NonVerticalSegment(center, point1, point2);
  }
}
