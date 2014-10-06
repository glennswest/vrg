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

module fixed_rounded_box(x,y,z)
{
    translate([x / 2, y / 2, z / 2]) roundedBox([x,y,z], 5, true);
}



module body()
{
	difference(){
       cube([100,100,96]);
       translate([60,-1,-1]) cube([41,102,102]);
       translate([-1,71,-1]) cube([102,41,202]);
       
       }
     
}



module pulley_cutout()
{
	cube([20,20,20]);


}



module motor_wedge(ht)
{
  
    difference(){
	 union(){
      translate([-11.5,4,14]) rotate([180,90,0]) wedge(angle=50,height=25,topFactor=.75, center=true, wedgeWidth=8);
      translate([-32,4,14]) rotate([0,90,0]) wedge(angle=50,height=25,topFactor=.75, center=true, wedgeWidth=8);
      }
    translate([-50,-50,-5]) cube([200,200,5]);
    }
   
}
module motors()
{
    
      translate([23,22.5,135]) rotate([270,90,0]) nema_geared_motor();
      translate([25,-22.5,48]) rotate([270,0,90]) nema_motor();
      difference(){
         translate([25,-22.5]) rotate([0,0,90]) motor_support(48);
         translate([30,-15,-.1]) cube([20,12,15]);
         }
    
      translate([-22,20,26]) rotate([270,0,0]) nema_motor();
      translate([-22,20,26]) rotate([180,0,180]) motor_support(26);
	  
       
      translate([6,-17,0]) sensor_mount();
      
      translate([61,17,44])  rotate([180,0,90])  sensor_mount();
      translate([59,55,0])   cube([20,16,30]);
      translate([-1,53,54]) rotate([0,90,90]) sensor_mount();
}

module show_rods()
{  // Vertical Rod
   %translate([45,45,(-1 *  rod_length)+95]) rotate([0,0,0]) vslot20x20(rod_length);
   %translate([25,-1,35]) rotate([0,90,90]) vslot20x20(rod_length);
   %translate([-1,20,15]) rotate([0,90,0]) vslot20x20(rod_length);
 
   %translate([50,20,0]) boltHole(5, length=12);
   %translate([10,20,0]) boltHole(5, length=12);

   %translate([60,45,15]) rotate([90,0,270]) boltHole(5, length=18);
   %translate([60,45,55]) rotate([90,0,270]) boltHole(5, length=18);
 
   %translate([25,10,0]) boltHole(5, length=12);
   %translate([25,55,0]) boltHole(5, length=12);

  
   

}

module vslot_cutouts(){

   
   translate([45,45,-13]) rotate([0,0,0]) vslot20x20_cutout(110);
   
   translate([25,-30,35]) rotate([0,90,90]) vslot20x20_cutout(110);
   translate([-25,20,15]) rotate([0,90,0]) vslot20x20_cutout(110);

   translate([50,20,0]) boltHole(5, length=12);
   translate([10,20,0]) boltHole(5, length=12);

   translate([60,45,15]) rotate([90,0,270]) boltHole(5, length=12);
   translate([60,45,55]) rotate([90,0,270]) boltHole(5, length=12);

   translate([25,10,0]) boltHole(5, length=38);
   translate([25,55,0]) boltHole(5, length=38);
}


module motor_corner()
{

	difference(){
         union() {
            body();
            motors();
            show_rods();
            }
         union() {
            vslot_cutouts();
            }
         }

}


