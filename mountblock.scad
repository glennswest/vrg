use <vslot.scad>;
use <MCAD/nuts_and_bolts.scad>;


module mountblock_body()
{
	cube([40,40,20]);
	translate([20,20,0]) %vslot20x20(200);
     %translate([37,20,10]) rotate([90,0,270]) boltHole(5, length=18);
     %translate([3,20,10]) rotate([90,0,90]) boltHole(5, length=18);
}


module mountblock_cuts()
{
	translate([20,20,-0.2]) vslot20x20_cutout(80.1);
    translate([37,20,10]) rotate([90,0,270]) boltHole(5, length=18);
    translate([3,20,10]) rotate([90,0,90]) boltHole(5, length=18);
}


module mountblock()
{
	difference(){
         mountblock_body();
         mountblock_cuts();
         }

}


mountblock();