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
      
    
    // % translate([24.2,-22.5,48]) rotate([270,0,90+180]) pulley_mount();
   translate([20,-29,24]) rotate([270,180,90+180]) pulley();  
  
	
	
	
}


module vslot_cuts()
{
   
   
   translate([25,-1-1,35]) rotate([0,90,90]) vslot20x20_cutout(110);
 	
	
	
}

module show_rods()
{  
   %translate([25,-1-5,35]) rotate([0,90,90]) vslot20x20(rod_length);
   //%translate([8,5,35]) rotate([0,90,0]) boltHole(5, length=12);
   //%translate([42,5,35]) rotate([0,270,0]) boltHole(5, length=12);


  
   

}

module empty_cube()
{
    difference(){
        translate([2,2,2]) cube([24,24,24]); 
        translate([5.9,5.9,1.1]) cube([16.1,16.1,20.1]);
        }
}

module mini_body()
{
	pulley_mounts();
        translate([37,-31,20]) rotate([90,0,180]) empty_cube();
        //translate([11.5-1.5-4,-10.5,20-2]) cube([38,30,35]); // X mount vslot
	
}

module mini_cuts()
{
	vslot_cuts();
        translate([19,-16,26]) cube([12,17,6]);
        translate([19,-16,38]) cube([12,17,6]);
	//translate([8,5,35]) rotate([0,90,0]) boltHole(5, length=14);
	//translate([42,5,35]) rotate([0,270,0]) boltHole(5, length=14);
        translate([25,-7,35]) rotate([270,180,0]) boltHole(5,length=40);
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
