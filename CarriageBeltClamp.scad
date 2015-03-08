// Kossel Mini carriage for IGUS DryLin TWE-04-12
// Licence: CC BY-SA 3.0, http://creativecommons.org/licenses/by-sa/3.0/
// Author: Dominik Scholz <schlotzz@schlotzz.com> and contributors
// Based upon: https://github.com/jcrocholl/kossel/blob/master/carriage.scad by jcrocholl
// visit: http://www.schlotzz.com
use <MCAD/nuts_and_bolts.scad>;

// Increase this if your slicer or printer make holes too tight.
extra_radius = 0.4;

// OD = outside diameter, corner to corner.
m3_nut_od = 6.1;
m3_nut_radius = m3_nut_od/2 + 0.2 + extra_radius;
m3_washer_radius = 3.5 + extra_radius;

// Major diameter of metric 3mm thread.
m3_major = 2.85;
m3_radius = m3_major/2 + extra_radius;
m3_wide_radius = m3_major/2 + extra_radius + 0.2;



separation = 50;
thickness = 4;

horn_thickness = 13;
horn_x = 8;

belt_width = 5;
belt_x = 5.6;
belt_z = 7;
clearance = 0.125;

module tooth_cutout(x,y)
{
//tooth cutout
				for (x = [1.125 - 0.300 - clearance, 5.375 + 0.30 - clearance])
				{
					for (y = [0 : 19])
					{
						translate([x, 19 - y * 2, 6 - 0.001])
							cylinder(r = 0.7, h = horn_thickness / 2 + 1, $fn = 16);
                                        }
				}
               translate([8,17-14,2.25+8]) rotate([270,0,90]) boltHole(5,length=5);
                        
}

module body(){
    translate([-1,-14,4.5-2]) cube([5,34,12]);
}

module belt_clamp()
{
    difference(){
        body();
        translate([-6.5,0,-1.5]) tooth_cutout(0,0);
    }
    
}



module carriage()
{

	clearance = 0.125;

	// timing belt, up and down
	//for (x = [-belt_x, belt_x])
                x = belt_x;
		

	difference()
	{

	    union()
		{
			

			


			// belt clamps for GT2
			difference()
			{
				union()
				{
                                        y=12;
					{
						union()
						{
							translate([-0.5 - clearance * 2, y, horn_thickness / 2 + 1])
								cube([1, 14, horn_thickness - 2], center = true);
							translate([-1 - clearance * 2, y, horn_thickness / 2 + 1])
								cube([2, 12, horn_thickness - 2], center = true);
							n = 6;
								translate([-1 - clearance * 2, y + n, horn_thickness / 2 + 1])
									cylinder(r = 1, h = horn_thickness - 2, center = true, $fn = 16);

							translate([3.25 - clearance, y, horn_thickness / 2 + 1])
								cube([5, 14, horn_thickness - 2], center = true);

							translate([7.5, y, horn_thickness / 2 + 1])
								cube([2, 14, horn_thickness - 2], center = true);
						}
					}
				}

				// tooth cutout
				for (x = [1.125 - 0.300 - clearance, 5.375 + 0.30 - clearance])
				{
					for (y = [0 : 19])
					{
						translate([x, 19 - y * 2, 6 - 0.001])
							cylinder(r = 0.7, h = horn_thickness / 2 + 1, $fn = 16);
					}
				}

				// cutout for easier inserting of belt
				for (x = [0.5 - clearance, 6 - clearance])
					translate([x, 0, horn_thickness])
						rotate([0, 45, 0])
							cube([2 + clearance / 2, 50, 2 + clearance / 2], center = true);

			}

		}

		

	}

}

belt_clamp();
