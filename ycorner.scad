use <cornerparts.scad>
use <mountblock.scad>;
use <nemamount.scad>;
use <MCAD/nuts_and_bolts.scad>;

module ymotor_body()
{
    translate([0,0,0]) rotate([0,180,0]) mountblock();
	translate([0,20,25]) rotate([0,0,90]) nema_motor();
    translate([0,0,-20]) cube([25,40,20]);
    translate([-70,0,-20]) cube([31,40,20]);
    %translate([0,20,-10.1]) rotate([0,90,0]) cylinder(r=6,h=26.2);
    %translate([-46,11,-10]) rotate([90,0,0]) nutHole(5);
    %translate([-61,11,-10]) rotate([90,0,0]) nutHole(5);
	//%translate([-38,20,-10.1]) rotate([0,90,180]) cylinder(r=6,h=33);

    
}

module ymotor_cuts()
{
    translate([-46,11,-10]) rotate([90,0,0]) nutHole(5);
    translate([-61,11,-10]) rotate([90,0,0]) nutHole(5);
    translate([-46,11,-10]) rotate([90,0,0]) cylinder(r=2.6,h=20);
    translate([-61,11,-10]) rotate([90,0,0]) cylinder(r=2.6,h=20);

    translate([0,20,-9]) rotate([0,90,0]) cylinder(r=6,h=35);

     translate([-38,25,-5.1]) rotate([0,90,180]) cube([10,15,35]); 
}

module ymotor()
{
   difference(){
       ymotor_body();
       ymotor_cuts();
       }


}


ymotor();