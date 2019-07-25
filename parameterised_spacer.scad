height = 10;
inner_diameter = 3;
outer_diameter = 10;

spacer();

module spacer()
{
  difference()
  {
    cylinder(d=outer_diameter, h=height, $fn=64);
    cylinder(d=inner_diameter, h=height, $fn=64);
  }
}