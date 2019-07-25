base();
back();

module base()
{
  hyp = sqrt(pow(11, 2) + pow(11, 2));

  difference() 
  {
    translate([4, 0, 0]) cube(size = [15, 35, 2]);
    translate([4, 4, 0]) cube(size = [15, 20, 5]);
    //translate([31, 45, 0]) rotate([0, 0, 135]) cube(size = [hyp, hyp, 5]);
  }  
}

module back()
{
  difference()
  {
    union()
    {
      translate([4, 0, 0]) rotate([0, -90, 0]) rounded_rectangle([49, 13, 4], [0, 3, 3, 0]); 
      translate([4, 0, 0]) rotate([0, -90, 0]) rounded_rectangle([12, 55, 4], [0, 3, 3, 0]);  
    }
    
    translate([0, 2.5, 0]) cube([2.5, 6, 6]);
    translate([0, 39.75, 2.9]) rotate([0, 90, 0]) cylinder(h = 5, r = 1.75, $fn=64);
    translate([0, 5.6, 37]) rotate([0, 90, 0]) cylinder(h = 5, r = 1.75, $fn=64);
    translate([0, 39.1, 37]) rotate([0, 90, 0]) cylinder(h = 6, r = 3, $fn=64);
    
    //fan screws

    //top
    translate([0, 8.5, 44.75]) rotate([0, 90, 0]) cylinder(h = 5, r = 1.6, $fn=64);
    //bottom
    translate([0, 51, 7.25]) rotate([0, 90, 0]) cylinder(h = 5, r = 1.6, $fn=64);  
  }

}

module rounded_rectangle(size, radius)
{
  x = size[0];
  y = size[1];
  z = size[2];

  tl = radius[0];
  tr = radius[1];
  bl = radius[2];
  br = radius[3];
  
  maximum = max(radius);

  linear_extrude(height=z)
  hull()
  {
    rounded_corner([tl, tl], tl, maximum);
    rounded_corner([x - bl, y - bl], bl, maximum);
    rounded_corner([tr, y - tr], tr, maximum);
    rounded_corner([x - bl, bl], bl, maximum);
  }
}

module rounded_corner(location, radius, maximum)
{
    x = location[0];
    y = location[1];
  
    translate([x, y, 0])
    if(radius == 0)
    {
      square(maximum);
    }
    else
    {
      circle(r = radius, $fn=64);
    }
}
