
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



module pulley_mounts()
{
      
    
      translate([24,-22.5,48]) rotate([270,0,90+180]) pulley_mount();  
  
	
	
	
}


module vslot_cuts()
{
   
   
   translate([25,-30+18,35]) rotate([0,90,90]) vslot20x20_cutout(110);
 	
	
	
}

module show_rods()
{  
   %translate([25,-1,35]) rotate([0,90,90]) vslot20x20(rod_length);
   %translate([25,5,24]) boltHole(5, length=12);


  
   

}

module mini_body()
{
	pulley_mounts();	
        translate([11.5,-10.5,20+1]) cube([27,32,30+2]); // X mount vslot
	
}

module mini_cuts()
{
	vslot_cuts();
	translate([25,5,24]) boltHole(5, length=12);
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
