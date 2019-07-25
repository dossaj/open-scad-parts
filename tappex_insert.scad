height = 8;
depth = 4;
hole_diameter = 3.5;
inner_diameter = 4.75;
outer_diameter = 7.5;

insert();

module insert()
{
  difference()
  {
    union()
    {
      cylinder(d=outer_diameter, h=depth, $fn=64);
      cylinder(d=inner_diameter, h=height, $fn=64);
      cylinder(d=inner_diameter-0.1, h=height+0.1, $fn=64);
      cylinder(d=inner_diameter-0.2, h=height+0.2, $fn=64);
      cylinder(d=inner_diameter-0.3, h=height+0.3, $fn=64);
      cylinder(d=inner_diameter-0.4, h=height+0.4, $fn=64);
      cylinder(d=inner_diameter-0.5, h=height+0.5, $fn=64);
      cylinder(d=inner_diameter-0.6, h=height+0.6, $fn=64);
    }
    cylinder(d=hole_diameter, h=height+1, $fn=64);
    cylinder(d=6.35, h=3, $fn=6);
  }
}