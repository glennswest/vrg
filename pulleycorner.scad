
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
      
    
      translate([24.2,-22.5,48]) rotate([270,0,90+180]) pulley_mount();  
  
	
	
	
}


module vslot_cuts()
{
   
   
   translate([25,-30+18,35]) rotate([0,90,90]) vslot20x20_cutout(110);
 	
	
	
}

module show_rods()
{  
   %translate([25,-1,35]) rotate([0,90,90]) vslot20x20(rod_length);
   %translate([25,-2,21+28+1]) rotate([0,180,0]) boltHole(5, length=12);
   %translate([25,12,21+28+1]) rotate([0,180,0]) boltHole(5, length=12);


  
   

}

module mini_body()
{
	pulley_mounts();	
        translate([11.5-1.5,-10.5,20-2]) cube([30,30,35]); // X mount vslot
	translate([11.5-1.5-7.1,-10.5,20-2+30]) cube([49.2,30,5]);
        translate([47.15,0,38]) cube([4.9,19.3,10]);
}

module mini_cuts()
{
	vslot_cuts();
	translate([25,-2,21+28]) rotate([0,180,0]) boltHole(5, length=12);
	translate([25,12,21+28]) rotate([0,180,0]) boltHole(5, length=12);
}

module mini_corner()
{   
   difference(){
	   mini_body();
           mini_cuts();
           }
   show_rods();
   
}

rotate([0,180,0]) mini_corner();
