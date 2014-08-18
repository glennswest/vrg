include <MCAD/units.scad>;
include <MCAD/materials.scad>
use <MCAD/shapes.scad>;
use <smallbridges/scad/bom.scad>;
use <smallbridges/scad/vslot.scad>;
$fn = 32;

rod_length = 500;

module body()
{
	cube([60,60,60]);
}


module pulley_cutout()
{
	cube([20,20,20]);


}


module show_rods()
{  // Vertical Rod
   translate([45,45,-1 *  rod_length]) rotate([0,0,0]) vslot20x20(rod_length);
   translate([15,-1,35]) rotate([0,90,90]) vslot20x20(rod_length);
   translate([-1,15,15]) rotate([0,90,0]) vslot20x20(rod_length);

}
module vslot_cutouts(){

   
   translate([45,45,-1]) rotate([0,0,0]) vslot20x20_cutout(60);
   translate([15,-1,35]) rotate([0,90,90]) vslot20x20_cutout(60);
   translate([-1,15,15]) rotate([0,90,0]) vslot20x20_cutout(60);
}


module corner()
{

	difference(){
         union() {
            body();
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
