
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

module zmotor_body()
{
	translate([20,22.5-5,135]) rotate([270,90,0]) nema_geared_motor();
	translate([33-7,26.5,96-20]) cube([25+7,27,31]); // X mount vslot
}

module zmotor_cuts()
{
   // Vertical Rod
  %translate([45,40,(-1 *  rod_length)+95]) rotate([0,0,0]) vslot20x20(rod_length);
  translate([45,40,10]) rotate([0,0,0]) vslot20x20_cutout(110);	
  translate([56,40,101-4]) rotate([90,0,270]) boltHole(5, length=18);	
}

module zmotor_mount()
{
	difference(){
		zmotor_body();
		zmotor_cuts();
	}
	
}


zmotor_mount();