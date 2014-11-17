
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
	translate([33,26.5,96]) cube([25,27,11]); // X mount vslot
}

module zmotor_cuts()
{
   // Vertical Rod
  %translate([45,40,(-1 *  rod_length)+95]) rotate([0,0,0]) vslot20x20(rod_length);
  translate([45,40,10]) rotate([0,0,0]) vslot20x20_cutout(110);	
  translate([56,40,101]) rotate([90,0,270]) boltHole(5, length=18);	
}

module zmotor_mount()
{
	difference(){
		zmotor_body();
		zmotor_cuts();
	}
	
}

module motor_mounts()
{
      
    
      translate([24,-22.5,48]) rotate([270,0,90+180]) nema_motor();  
      translate([-22,19,28]) rotate([270,0,0]) nema_motor();
	
	
	
}


module vslot_cuts()
{
   
   
   translate([25,-30,35]) rotate([0,90,90]) vslot20x20_cutout(110);
   translate([-25,20,15]) rotate([0,90,0]) vslot20x20_cutout(110);	
	
	
}

module show_rods()
{  
   %translate([25,-1,35]) rotate([0,90,90]) vslot20x20(rod_length);
   %translate([-1,20,15]) rotate([0,90,0]) vslot20x20(rod_length);
 
   %translate([-5,20,3]) boltHole(5, length=12);

   //%translate([60,45,15]) rotate([90,0,270]) boltHole(5, length=18);
   %translate([56,40,101]) rotate([90,0,270]) boltHole(5, length=18);
 
   %translate([25,-6,23]) boltHole(5, length=12);
 //  %translate([25,55,0]) boltHole(5, length=12);

  
   

}

module mini_body()
{
	motor_mounts();	
	translate([0,0,28]) cube([8,43,68]);     // Connect motor mounts
	translate([0,0,90]) cube([35,66,7]);
        translate([11.5,-12,20]) cube([27,12,30]); // X mount vslot
	translate([-11,6,0]) cube([12,27,30]); // Y mount vslot
	
}

module mini_cuts()
{
	vslot_cuts();
	translate([25,-6,23]) boltHole(5, length=12);
	translate([-5,20,3]) boltHole(5, length=12);
	
}

module mini_corner()
{   
   difference(){
	   mini_body();
           mini_cuts();
           }
   show_rods();
   
}

mini_corner();
zmotor_mount();