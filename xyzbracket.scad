
include <MCAD/units.scad>;
include <MCAD/materials.scad>
include <MCAD/boxes.scad>;
use <MCAD/shapes.scad>;
use <MCAD/nuts_and_bolts.scad>;
use <bom.scad>;
use <vslot.scad>;
use <nemamount.scad>;
use <sensor.scad>;
use <pulley.scad>;
use <triangle.scad>;

$fn = 32;

rod_length = 500;

module xbracket_body()
{
	translate([0,0,-20]) cube([20,50,40]);
	translate([0,-20,-20]) cube([50,20,20]);
	// Z Screws
	%translate([3,10,10]) rotate([0,90,0])boltHole(5, length=35);
	%translate([3,10,-10]) rotate([0,90,0])boltHole(5, length=35);
	// Y Screws
	%translate([10,40,-17]) rotate([0,0,0])boltHole(5, length=55);
	%translate([10,20,-17]) rotate([0,0,0])boltHole(5, length=55);
	// X Screws
	%translate([10,-10,-17]) rotate([0,0,0])boltHole(5, length=55);
	%translate([35,-10,-17]) rotate([0,0,0])boltHole(5, length=35);
	
}

module xbracket_cuts()
{       // Z Screws
	translate([3,10,10]) rotate([0,90,0])boltHole(5, length=35);
	translate([3,10,-10]) rotate([0,90,0])boltHole(5, length=35);
        // Y Screws
	translate([10,40,-17]) rotate([0,0,0])boltHole(5, length=55);
	translate([10,20,-17]) rotate([0,0,0])boltHole(5, length=55);
	// X Screws
	translate([10,-10,-17]) rotate([0,0,0])boltHole(5, length=55);
	translate([35,-10,-17]) rotate([0,0,0])boltHole(5, length=35);	
	
}


module xbracket()
{
     difference(){
	    xbracket_body();
	    xbracket_cuts();
	}
}




module show_rods()
{  
   %translate([45,40,(-1 *  rod_length)+95]) rotate([0,0,0]) vslot20x20(rod_length);	
   %translate([25,-1,35]) rotate([0,90,90]) vslot20x20(rod_length);
   %translate([-1,20,15]) rotate([0,90,0]) vslot20x20(rod_length);
}



show_rods();
translate([15,30,5]) xbracket();
