include <MCAD/units.scad>;
include <MCAD/materials.scad>
include <MCAD/stepper.scad>
include <MCAD/motors.scad>
use <MCAD/shapes.scad>;
use <smallbridges/scad/bom.scad>;
use <smallbridges/scad/vslot.scad>;
$fn = 32;


module nema_cutout()
{
// Motor shaft/pulley cutout.
      rotate([90, 0, 0]) cylinder(r=12, h=20, center=true, $fn=60);
      // NEMA 17 stepper motor mounting screws.
      for (x = [-1, 1]) for (z = [-1, 1]) {
        scale([x, 1, z]) translate([15.5, -5, 15.5]) {
          rotate([90, 0, 0]) cylinder(r=1.65, h=20, center=true, $fn=12);
          }
        }
}

module nema_motor()
{
   union(){
     nema_mount();
     translate([0,-4,1]) rotate([90,0,0]) motor(Nema17, NemaLong, dualAxis=false);
     }
}

module nema_mount()
{
   difference(){
      translate([-22.5,0,-21.5]) rotate([90,0,0]) cube([45,45,5]);
      translate([0,0,1]) nema_cutout();
      }
   //nema_cutout();
}

nema_motor();