include <corner.scad>;

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

motor_corner();