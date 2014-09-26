use <MCAD/nuts_and_bolts.scad>;

module pulley_wall(xside)
{
   hull(){
       translate([0,0,0]) cube([20,3,2]);
       translate([8.5,0,18]) cube([3,3,2]);
       if (xside==0){
          translate([8.5,7,0]) cube([1,1,1]);
          translate([10,4,9]) rotate([90,0,0]) cylinder(r=3,h=10);
          
         } else {
          translate([8.5,-5,0]) cube([1,1,1]);
          translate([10,8,9]) rotate([90,0,0]) cylinder(r=3,h=10);
         }
       }
    
}

module pulley_body()
{
    translate([0,0,0])   pulley_wall(1);
    translate([0,20,0])  pulley_wall(0);
    %translate([10,-2,9]) rotate([90,0,180]) boltHole(3,length=28);
    %translate([10,25,9]) rotate([90,0,180]) nutHole(3); 
}

module pulley_cuts()
{
    translate([10,-2,9]) rotate([90,0,180]) boltHole(3,length=28);
    translate([10,25,9]) rotate([90,0,180]) nutHole(3);  
}

module pulley()
{
	difference(){
        translate([23,21,-12]) rotate([90,0,270]) pulley_body();
        translate([23,21,-12]) rotate([90,0,270]) pulley_cuts();
        }
    

}



pulley();