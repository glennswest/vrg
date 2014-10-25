use <xcorner.scad>;
use <ycorner.scad>;
use <zcorner.scad>;
use <spacer.scad>;
use <zcarriage.scad>;








rotate([0,90,180]) xmotor();
translate([20,-50,-21]) rotate([90,90,0]) ymotor();
translate([51,20,50]) rotate([0,0,180]) zmotor();
translate([22,25,29]) spacerblock();
translate([80,10,-130]) rotate([90,0,90]) zcarriage();