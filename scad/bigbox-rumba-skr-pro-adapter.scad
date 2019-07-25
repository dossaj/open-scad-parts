/* [Basic] */
// Horizontal Distance of the outer holes, measured from center of hole
outerHorizontalDistance = 67; // [0:500]
// Vertical Distance of the outer holes, measured from center of hole
outerVerticalDistance = 128; // [0:500]

// Horizontal Distance of the inner holes, measured from center of hole
innerHorizontalDistance = 86.50; // [0:500]
// Vertical Distance of the inner holes, measured from center of hole
innerVerticalDistance = 138; // [0:500]

// Diameter of the screw used
screwDiameter = 3; // [1:10]

// Height of the struts
strutHeight = 2; // [1:20]

//post height
postHeight = 5;

//internal
width =  (3 * screwDiameter);

module post(pos, diameter){
  difference(){
    translate(pos + [0, 0, strutHeight]) cylinder(d=width - 2, h=postHeight, $fn=64);
    translate(pos + [0, 0, strutHeight]) cylinder(d=diameter, h=postHeight, $fn=64);
  }
}

module nut(pos){
  translate(pos) cylinder(d=6.35, h=3, $fn=6);
}

module hole(pos, diameter){
  translate(pos) cylinder(d=diameter, h=3, $fn=64);
}

module to_frame(){
  posBl = [width / 2, width / 2, 0];
  posBr = [innerHorizontalDistance + (width / 2), width / 2, 0];
  posTl = [width / 2, innerVerticalDistance + (width / 2), 0];
  posTr = [innerHorizontalDistance + (width / 2), innerVerticalDistance + (width / 2), 0];
  
  difference(){
    //main piece
    cube(size=[innerHorizontalDistance + width, innerVerticalDistance + width, strutHeight]);
    //cut out
    translate([width, width, 0]) cube(size=[innerHorizontalDistance - width, innerVerticalDistance - width, strutHeight]);
  }
  
  post(posBl, screwDiameter);
  post(posBr, screwDiameter);
  post(posTl, screwDiameter);
  post(posTr, screwDiameter);
}

module to_nut_traps(){
  posBl = [width / 2, width / 2, 0];
  posBr = [innerHorizontalDistance + (width / 2), width / 2, 0];
  posTl = [width / 2, innerVerticalDistance + (width / 2), 0];
  posTr = [innerHorizontalDistance + (width / 2), innerVerticalDistance + (width / 2), 0];
  
  nut(posBl);
  nut(posBr);
  nut(posTl);
  nut(posTr);
}

module from_frame(){
  difference(){
    translate([-5, 0, 0]) cube(size=[outerHorizontalDistance + width + 10, outerVerticalDistance + width, strutHeight]);
    translate([width, width, 0]) cube(size=[outerHorizontalDistance - width, outerVerticalDistance - width, strutHeight]);
  }
}

module from_screw_holes(){
  posBl = [width / 2, width / 2, 0];
  posBr = [outerHorizontalDistance + (width / 2), width / 2, 0];
  posTl = [width / 2, outerVerticalDistance + (width / 2), 0];
  posTr = [outerHorizontalDistance + (width / 2), outerVerticalDistance + (width / 2), 0];
  
  hole(posBl, screwDiameter);
  hole(posBr, screwDiameter);
  hole(posTl, screwDiameter);
  hole(posTr, screwDiameter);
}

difference(){
  union(){
    from_frame();
    translate([(outerHorizontalDistance - innerHorizontalDistance) / 2, (outerVerticalDistance - innerVerticalDistance) / 2, 0]) to_frame();
  }
  from_screw_holes();
  translate([(outerHorizontalDistance - innerHorizontalDistance) / 2, (outerVerticalDistance - innerVerticalDistance) / 2, 0]) to_nut_traps();
}
