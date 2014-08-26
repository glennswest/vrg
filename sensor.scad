
module sensor_mount_body()
{
 union() { 
      translate([0,0,0]) rotate([90,0,0]) cube([50,15,2]); 
      translate([0,18,0]) rotate([90,0,0]) cube([50,15,2]);
      
      translate([50,-2,0]) rotate([90,0,90]) cube([20,15,2]);
      translate([0,-2,0]) rotate([90,0,90]) cube([20,15,2]);
      
      
      }
}

module sensor_mount_cuts()
{

      translate([50,7.5,7.5]) rotate([90, 0, 90]) cylinder(r=2.5, h=5, center=true, $fn=12);

}

module sensor_mount()
{
   difference() {
    sensor_mount_body();
    sensor_mount_cuts();
    
     
     }
}

sensor_mount();