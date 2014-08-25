include <MCAD/units.scad>;
include <MCAD/materials.scad>
use <MCAD/shapes.scad>;
use <bom.scad>;
use <vslot.scad>;
use <nemamount.scad>;

$fn = 32;

rod_length = 500;

module body()
{
	cube([100,100,100]);
}


module pulley_cutout()
{
	cube([20,20,20]);


}


module motors()
{
    //motor(Nema17, NemaLong, dualAxis=false);
    
    translate([25,-22.5,48]) rotate([270,0,0]) nema_motor();
    translate([-23,25,26]) rotate([270,0,0]) nema_motor();
}

module show_rods()
{  // Vertical Rod
   %translate([45,45,-1 *  rod_length]) rotate([0,0,0]) vslot20x20(rod_length);
   %translate([25,-1,35]) rotate([0,90,90]) vslot20x20(rod_length);
   %translate([-1,25,15]) rotate([0,90,0]) vslot20x20(rod_length);
   
}
module vslot_cutouts(){

   
   translate([45,45,-1]) rotate([0,0,0]) vslot20x20_cutout(110);
   translate([25,-1,35]) rotate([0,90,90]) vslot20x20_cutout(110);
   translate([-1,25,15]) rotate([0,90,0]) vslot20x20_cutout(110);
}


module corner()
{

	difference(){
         union() {
            body();
            motors();
            show_rods();
            //translate([40,5,35]) pulley_cutout();
            }
         union() {
            vslot_cutouts();
            translate([40,5,35]) pulley_cutout();
            }
         }

}

corner();
