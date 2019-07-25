/* [Basic] */
// Horizontal Distance of the outer holes, measured from center of hole
outerHorizontalDistance = 67; // [0:500]
// Vertical Distance of the outer holes, measured from center of hole
outerVerticalDistance = 128; // [0:500]

// Horizontal Distance of the inner holes, measured from center of hole
innerHorizontalDistance = 61; // [0:500]
// Vertical Distance of the inner holes, measured from center of hole
innerVerticalDistance = 95; // [0:500]

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

module to(){
  posBl = [width / 2, width / 2, 0];
  posBr = [innerHorizontalDistance + (width / 2), width / 2, 0];
  posTl = [width / 2, innerVerticalDistance + (width / 2), 0];
  posTr = [innerHorizontalDistance + (width / 2), innerVerticalDistance + (width / 2), 0];
  
  difference(){
    //main piece
    cube(size=[innerHorizontalDistance + width, innerVerticalDistance + width, strutHeight]);
    //cut out
    translate([width, width, 0]) cube(size=[innerHorizontalDistance - width, innerVerticalDistance - width, strutHeight]);
    nut(posBl);
    nut(posBr);
    nut(posTl);
    nut(posTr);
  }
  
  post(posBl, screwDiameter);
  post(posBr, screwDiameter);
  post(posTl, screwDiameter);
  post(posTr, screwDiameter);
}

module from(){
  posBl = [width / 2, width / 2, 0];
  posBr = [outerHorizontalDistance + (width / 2), width / 2, 0];
  posTl = [width / 2, outerVerticalDistance + (width / 2), 0];
  posTr = [outerHorizontalDistance + (width / 2), outerVerticalDistance + (width / 2), 0];
  
  difference(){
    cube(size=[outerHorizontalDistance + width, outerVerticalDistance + width, strutHeight]);
    translate([width, width, 0]) cube(size=[outerHorizontalDistance - width, outerVerticalDistance - width, strutHeight]);
    hole(posBl, screwDiameter);
    hole(posBr, screwDiameter);
    hole(posTl, screwDiameter);
    hole(posTr, screwDiameter);
  }
}

union(){

difference(){
  from();
  translate([(outerHorizontalDistance - innerHorizontalDistance) / 2, (outerVerticalDistance - innerVerticalDistance) / 2, 0]) cube(size=[innerHorizontalDistance + width, innerVerticalDistance + width, strutHeight]);
}
  
translate([(outerHorizontalDistance - innerHorizontalDistance) / 2, (outerVerticalDistance - innerVerticalDistance) / 2, 0]) 
to();
  }
