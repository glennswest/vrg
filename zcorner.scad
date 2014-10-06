use <mountblock.scad>;
use <nemamount.scad>;
use <MCAD/nuts_and_bolts.scad>;

module zmotor_body()
{
    translate([0,0,0]) rotate([0,180,0]) mountblock();
	translate([-40,-2,39]) rotate([0,90,90]) nema_geared_motor();
    translate([-70,-10,-20]) cube([31,60,20]);
    translate([-41,-10,-20]) cube([41,10,20]);
    translate([-41,40,-20]) cube([41,10,20]);
    translate([0,-10,-20]) cube([31,60,20]);
    %translate([-46,41,-10]) rotate([90,0,0]) nutHole(5);
    
   // %translate([-38,20,-10.1]) rotate([0,90,180]) cylinder(r=6,h=33);
    
    %translate([20,40,-1]) rotate([0,180,0]) boltHole(5,length=30);
    %translate([ 0,40,-1]) rotate([0,180,0]) boltHole(5,length=30);
    %translate([-4,0,-1]) rotate([0,180,0]) boltHole(5,length=50);
   // %translate([-1,20,-9.1]) rotate([0,90,0]) cylinder(r=6,h=34);
}

module zmotor_cuts()
{
    translate([-46,41,-10]) rotate([90,0,0]) nutHole(5);
    translate([-61,41,-10]) rotate([90,0,0]) nutHole(5);
    translate([20,40,-1]) rotate([0,180,0]) boltHole(5,length=30);
    translate([ 0,40,-1]) rotate([0,180,0]) boltHole(5,length=30);
    translate([-38,20,-10.1]) rotate([0,90,180]) cylinder(r=6,h=34);
    translate([-1,20,-9.1]) rotate([0,90,0]) cylinder(r=6,h=50);
    translate([-4,0,-1]) rotate([0,180,0]) boltHole(5,length=50);
}





module zmotor()
{
   difference(){
       zmotor_body();
       zmotor_cuts();
       }
}


zmotor();