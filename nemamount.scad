include <MCAD/units.scad>;
include <MCAD/materials.scad>
include <MCAD/stepper.scad>
include <MCAD/motors.scad>
use <MCAD/shapes.scad>;
$fn = 32;


module nema_geared_cutout()
{
    //pulley opening
    translate([16,1,21]) rotate([90,0,0]){
      cylinder (h=22, r=6.6);

      rotate([0,0,45]) {
        translate([14,0,0]) cylinder(h=22, r=1.6, $fn=12);
        translate([0,14,0]) cylinder(h=22, r=1.6, $fn=12);
        translate([-14,0,0]) cylinder(h=22, r=1.6, $fn=12);
        translate([0,-14,0]) cylinder(h=22, r=1.6, $fn=12);
      }
     
    }

    //gearhead indentation
    translate([16,-5,21]) rotate([90,0,0]) cylinder (h=3.35, r=11.25);

    //pulley hub indentation
    //translate([16,20-2,21]) rotate([90,0,0]) cylinder (h=5.6, r=7);
    
}

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
     %translate([0,-4,1]) rotate([90,0,0]) motor(Nema17, NemaLong, dualAxis=false);
     }
}

module nema_geared_motor()
{
   union(){
     nema_geared_mount();
     %translate([16,-7,22]) rotate([90,0,180]) motor(Nema17, NemaLong, dualAxis=false);
    
     }
}

module nema_geared_mount()
{
   difference(){
      translate([-6,-6,0]) rotate([90,0,0]) cube([45,45,5]);
      translate([0,0,1]) nema_geared_cutout();
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

//nema_motor();
nema_geared_motor();
