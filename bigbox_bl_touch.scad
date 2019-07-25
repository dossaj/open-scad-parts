
translate([6, 4, 20.5]) 
union()
{
  bl_touch_interface();
  struts();
}
translate([16, 0, 4]) rotate([0, 90, 0]) mount();


module mount()
{
  difference()
  {
    hull()
    {
      translate([0, 4.5, 0]) cylinder(h = 4, r = 4.5, $fn = 64);
      translate([0, 29.5, 0]) cylinder(h = 4, r = 4.5, $fn = 64);
    }
  
    translate([0,  4.75, 0]) cylinder(h = 4, r = 1.75, $fn = 64);
    translate([0, 29.25, 0]) cylinder(h = 4, r = 1.75, $fn = 64);
  }
}

module bl_touch_interface()
{
  difference()
  {

    hull()
    {
      translate([0, 4, 0]) cylinder(h = 2, r = 4, $fn = 64);
      translate([0, 22, 0]) cylinder(h = 2, r = 4, $fn = 64);
      translate([-5.75, 9.25, 0]) cube(size = [11.5, 7.5, 2]);
    }
  
    translate([0, 4, 0]) cylinder(h = 4, r = 1.6, $fn = 64);
    translate([0, 22, 0]) cylinder(h =45, r = 1.6, $fn = 64);
  } 
}

module struts()
{
  difference()
  {
    union()
    {
      translate([4, 4.25, 0]) cube(size = [10, 4, 2]);
      translate([10, 4.25, -12]) cube(size = [4, 4, 12]);
      translate([4, 17.75, 0]) cube(size = [10, 4, 2]);
      translate([10, 17.75, -12]) cube(size = [4, 4, 12]);
      
      translate([7.5, 21.75, 0]) rotate([90, 45, 0]) cube(size = [5, 5, 17.5]);
    }
       translate([5, 26, 2]) rotate([90, 0, 0]) cube(size = [10, 5, 30]);
    translate([11, 26, 2]) rotate([90, 45, 0]) cube(size = [5, 5, 30]);
   
  }
  

  
}