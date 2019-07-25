difference()
{
  cube(size=[20, 8, 3]);
  translate([3.8, 4.05, 0]) cylinder(h = 5, r = 1.3, $fn=64);
  translate([3.8 + 6.5, 4.05, 0]) cylinder(h = 5, r = 1.3, $fn=64);
}