include <corner.scad>;
use <pulley.scad>;

module pulleys()
{
    //translate([56,47,123]) rotate([270,90,0]) pulley();
    translate([25,-22.5,46]) rotate([270,0,90]) pulley();
    translate([-23,25,26]) rotate([270,0,0])    pulley();
}

module pulley_corner()
{

	difference(){
         union() {
            body();
            pulleys();
            show_rods();
            }
         union() {
            vslot_cutouts();
            }
         }

}

pulley_corner();