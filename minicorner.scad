
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

module mini_corner()
{   
   
      translate([23,22.5,135]) rotate([270,90,0]) nema_geared_motor();
    
      translate([25,-22.5,48]) rotate([270,0,90]) nema_motor();  
      translate([-22,20,28]) rotate([270,0,0]) nema_motor();
    
}

mini_corner();