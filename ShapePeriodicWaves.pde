import java.util.Collection;
import java.util.HashSet;

PeriodicShape ps;
PImage vertGraph;
PImage horizGraph;

void setup()
{
  size(600, 600);
  background(255);
  stroke(0);
  strokeWeight(1);
  fill(0);
  ps = new PeriodicShape(new PVector(62.5, 75), new PVector(150, 150));
  ps.setLoc(62.5, 25);
  ps.lineTo(100, 100);
  ps.lineTo(25, 100);
  ps.lineTo(62.5, 25);
  vertGraph = get(0, 0, 150, 450);
  horizGraph = get(0, 0, 450, 150);
}

void draw()
{
  background(255);
  image(vertGraph, 0, 151);
  image(horizGraph, 151, 0);
  Collection<PVector> points = ps.update();
  for(PVector v : points)
  {
    ellipse(v.x, 151, 2, 2);
    ellipse(151, v.y, 2, 2);
    line(v.x, 150, v.x, v.y);
    line(150, v.y, v.x, v.y);
  }
  vertGraph = get(0, 150, 150, 450);
  horizGraph = get(150, 0, 450, 150);
}
