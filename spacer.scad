use <mountblock.scad>;
use <nemamount.scad>;
use <MCAD/nuts_and_bolts.scad>;

module spacerblock()
{
   // %translate([18,-5,-2]) rotate([0,180,0]) boltHole(5, length=20);
   // %translate([48,-5,-2]) rotate([0,180,0]) boltHole(5, length=20);
   // %translate([33,-5,-17]) rotate([0,0,0]) boltHole(5,length=30);
   // %translate([33,-5,-21]) nutHole(5);
	difference(){
        translate([60,5,-20]) rotate([180,180,0]) cube([52,20,21]);
        translate([18,-5,-2]) rotate([0,180,0]) boltHole(5, length=20);
        translate([48,-5,-2]) rotate([0,180,0]) boltHole(5, length=20);
        translate([33,-5,-2]) rotate([0,180,0]) boltHole(5, length=20);
        translate([48,-105,-2]) nutHole(5);
        translate([33,-5,-17]) rotate([0,180,0]) cylinder(r=3,length=30);
        translate([33,-5,-21]) nutHole(5);
        }
}

spacerblock();