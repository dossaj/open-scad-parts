width=46;
depth=15;
height=22;
corner_radius=1;
thickness=3;
screw_diameter=3;
nut_diameter=6;
nut_height=2.5;
board_distence=19.5;
mounting_distence=19;

difference()
{
  //main body
  hull()
  {
    translate([corner_radius, corner_radius, 0]) cylinder(r=corner_radius, h=height, $fn=64);
    translate([corner_radius, depth-corner_radius, 0]) cylinder(r=corner_radius, h=height, $fn=64);
    translate([width-corner_radius, corner_radius, 0]) cylinder(r=corner_radius, h=height, $fn=64);
    translate([width-corner_radius, depth-corner_radius, 0]) cylinder(r=corner_radius, h=height, $fn=64);
  }
  
  bottom_thickness = thickness+nut_height;
  
  //main cut out
  translate([thickness, 0, thickness+nut_height]) cube([width-(2*thickness), depth, height-thickness-bottom_thickness]);
  
  //cable cut out
  translate([0, (depth-9)/2, 10]) cube([thickness, 9, 5]);
  
  //center the screw holes
  mount_offset_y = depth/2;
  mount_offset_x = ((width-(2*thickness)-mounting_distence) / 2) + thickness;
  translate([mount_offset_x, mount_offset_y, 0]) cylinder(d=screw_diameter, h=bottom_thickness, $fn=64);
  translate([mount_offset_x + mounting_distence, mount_offset_y, 0]) cylinder(d=screw_diameter, h=bottom_thickness, $fn=64);
  
  //cut the nut traps
  translate([mount_offset_x, mount_offset_y, thickness]) cylinder(d=nut_diameter, h=nut_height, $fn=6);
  translate([mount_offset_x + mounting_distence, mount_offset_y, thickness]) cylinder(d=nut_diameter, h=nut_height, $fn=6);
  
  //cut the board holes
  translate([width - 6.5, 2.5, height - thickness]) cylinder(d=screw_diameter, h=bottom_thickness, $fn=64);
  translate([width - 6.5 - board_distence, 2.5, height - thickness]) cylinder(d=screw_diameter, h=bottom_thickness, $fn=64);
}