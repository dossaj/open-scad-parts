module version_one() 
{
    difference()
    {
        hull()
        {
            cylinder(d=10, h=10.5, $fn=64);
            translate([3, 0, 0]) cylinder(d=10, h=10.5, $fn=64);
        }
        cylinder(d=6.5, h=2.5, $fn=6);
        cylinder(d=3.5, h=5, $fn=64);
        translate([3, 0, 8]) cylinder(d=6.5, h=2.5, $fn=6);
        translate([3, 0, 5.5]) cylinder(d=3.5, h=5, $fn=64);
    }
}

module version_two() 
{
    difference()
    {
        hull()
        {
            cylinder(d=10, h=10, $fn=64);
            translate([3, 0, 0]) cylinder(d=10, h=10, $fn=64);
        }
        rotate([0, 0, 45]) cylinder(d=7.25, h=2.5, $fn=4);
        cylinder(d=3.5, h=8, $fn=64);
        translate([3, 0, 0]) cylinder(d=6, h=8, $fn=64);
        translate([3, 0, 0]) cylinder(d=3.5, h=10, $fn=64);
        translate([5, -1.75, 0]) cube([6, 3.5, 8]);
    }
}

rotate([180, 0, 0])
version_two();