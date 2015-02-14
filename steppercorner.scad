
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



module motor_mounts()
{
      
    
      translate([24,-22.5,48]) rotate([270,0,90+180]) nema_motor();  
  
	
	
	
}


module vslot_cuts()
{
   
   
   translate([25,-30,35]) rotate([0,90,90]) vslot20x20_cutout(110);
 	
	
	
}

module show_rods()
{  
   %translate([25,-1,35]) rotate([0,90,90]) vslot20x20(rod_length);
   %translate([25,5,24]) boltHole(5, length=12);


  
   

}

module mini_body()
{
	motor_mounts();	
        translate([11.5,-10.5,20+1]) cube([27,32,30+2]); // X mount vslot
	translate([11.5-1.5-7.6, -10.5+2+5, 20-2+30]) cube([49.6,25,5]);
        translate([47.10,0,38]) cube([4.9,21.5,10]);
}

module mini_cuts()
{
	vslot_cuts();
	translate([25,5,24]) boltHole(5, length=12);
       
        translate([25,10,21+28+1]) rotate([0,180,0]) boltHole(5, length=12);
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
