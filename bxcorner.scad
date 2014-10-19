use <mountblock.scad>;
use <nemamount.scad>;
use <pulley.scad>;
use <MCAD/nuts_and_bolts.scad>;

module bxmotor_body()
{
	translate([0,0,0]) rotate([0,180,0]) mountblock();
    translate([0,0,-20]) cube([25,40,20]);
    %translate([20,20,-10]) rotate([0,90,0]) cylinder(r=6,h=45.2);
    translate([0,40,0]) rotate([0,180,0])cube([50,10,20]);
    translate([-40,0,0]) rotate([0,180,0])cube([10,40,20]);
    %translate([-25,40,-3]) rotate([0,180,270]) boltHole(5, length=20);
    %translate([-40,40,-3]) rotate([0,180,270]) boltHole(5, length=20);

   
    
}

module bxmotor_cuts()
{
     translate([0,20,-10.1]) rotate([0,90,0]) cylinder(r=6,h=26.2);
     translate([0,20,-10.1]) rotate([0,90,0]) cylinder(r=6,h=26.2);
     translate([-65,20,-10.1]) rotate([0,90,0]) cylinder(r=6,h=26.2);
     translate([-25,40,0]) rotate([0,180,270]) cylinder(r=6, h=5);
     translate([-40,40,0]) rotate([0,180,270]) cylinder(r=6, h=5);
     translate([-25,40,-9]) rotate([0,180,270]) boltHole(5, length=12);
     translate([-40,40,-9]) rotate([0,180,270]) boltHole(5, length=12);
     
}

module bxmotor()
{
	difference(){
       bxmotor_body();
       bxmotor_cuts();
       }

}

bxmotor();