use <MCAD/nuts_and_bolts.scad>;

module pulley_wall(xside)
{
    hull(){
       translate([0,0,0]) cube([20,8,2]);
       
       if (xside==0){
          translate([8.5,0,14]) cube([3,3,2]);
          translate([8.5,10,0]) cube([1,1,1]);
          translate([10,9.5,9]) rotate([90,0,0]) cylinder(r=3,h=10);
          
         } else {
          translate([8.5,-2,14]) cube([3,3,2]);
          translate([8.5,-5,0]) cube([1,1,1]);
          translate([10,8,9]) rotate([90,0,0]) cylinder(r=3,h=10);
         }
       }
    
}

module pulley_body()
{
    translate([0,4,0])   pulley_wall(1);
    translate([0,22,0])  pulley_wall(0);
    %translate([10,2.2,9]) rotate([90,0,180]) boltHole(3,length=32);
    %translate([10,27,9]) rotate([90,0,180]) nutHole(3); 
}

module pulley_cuts()
{
    translate([10,-2,9]) rotate([90,0,180]) boltHole(3,length=35);
    translate([10,28,9]) rotate([90,0,180]) nutHole(3);  
    translate([10,30,9]) rotate([90,0,180]) nutHole(3); 
}

module pulley()
{
	difference(){
        translate([23,21,-12]) rotate([90,0,270]) pulley_body();
        translate([23,21,-12]) rotate([90,0,270]) pulley_cuts();
        }
    

}



pulley();