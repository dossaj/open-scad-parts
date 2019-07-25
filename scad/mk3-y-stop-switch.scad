// PRUSA iteration4
// Y holder front
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

module ziptie_round_edge()
{
    difference()
    {
        translate([0,0,0]) rotate([90,0,0]) cylinder( h=3.2, r=4, $fn=50 );  
        translate([0,1,0]) rotate([90,0,0]) cylinder( h=5, r=2, $fn=50 );  
        translate([-10,-4,0]) cube([20,5,5]);
        translate([-20,-4,-13]) cube([20,5,20]);
    }
}


module part()    
{

    difference()
    {
        union()
        {
            // body block
            difference() {
                translate([-13,-3,0]) cube([26,10,12]);
                
                // upper corners
                translate([4,-3.5,20]) rotate([0,60,0]) cube([20,30,20]);
                translate([-21.2,-3.5,30]) rotate([0,120,0]) cube([20,30,20]);
                translate([-15,-3.3,-6]) rotate([45,0,0]) cube([30,5,5]);
                translate([15,7.3,-6]) rotate([45,0,180]) cube([30,5,5]);

                translate([-10, -3, -2]) switch();
            }
        }

        // y-axis cut
        translate([0,11,10.5]) rotate([90,0,0]) cylinder( h=14, r=4, $fn=50 );
        translate([0,8,10.5]) rotate([90,0,0]) cylinder( h=2, r1=4.5, r2=4, $fn=50 );
        translate([0,-2,10.5]) rotate([90,0,0]) cylinder( h=2, r1=4, r2=4.5, $fn=50 );
        translate([-7,-4,14.5]) rotate([0,45,0]) cube([10,20,10]);
        translate([0,8,10.5]) rotate([90,0,0]) cylinder( h=1.4, r1=5, r2=4, $fn=50 );
        
        // ziptie
        translate([7.8,5.75,9]) ziptie_round_edge();
        translate([-7.8,2.55,9]) rotate([0,0,180]) ziptie_round_edge();
        translate([-8.1,2.55,5]) cube([16.2,3.2,2]);
        translate([0.8,2.55,25]) rotate([0,60,0]) cube([20,3.2,2]);
        translate([-1.8,2.55,27]) rotate([0,120,0]) cube([20,3.2,2]);
    }
}

module switch() 
{
    cube([20, 10.5, 6.5]);
}

module switchSpring() 
{
    translate([-.5,6.6,.1]) rotate([0,0,8]) cube([25,1.2,6]);  //arm

    translate([-.2, 4.15, 0])
    difference(){  
        cylinder(d=7,h=4.5); //spring
        translate([0,0,-.1]) cylinder(d=5,h=4.7); 
        translate([0,-5,-.1]) cube([10,10,7]); 
    }
}

rotate([90,0,0]) part();

rotate([90,0,0]) translate([-12, 2.5, 0]) switchSpring();