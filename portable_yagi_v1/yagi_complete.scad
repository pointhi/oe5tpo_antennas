/*
 *  This file is part of the portable pluggable YAGI Design.
 *
 *  This documentation describes Open Hardware and is licensed under the
 *  CERN OHL either version 1.2 of the license, or (at your option) any
 *  later version.
 *
 *  You may redistribute and modify this documentation under the terms of
 *  the CERN OHL v.1.2 (http://ohwr.org/cernohl). This documentation is
 *  distributed WITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF
 *  MERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A PARTICULAR PURPOSE.
 *  Please see the CERN OHL v.1.2 for applicable conditions.
 *
 *  Copyright (c) 2016 Thomas Pointhuber
 */

use <antenna_parts.scad>;
use <director_module.scad>;
use <radiator_module.scad>;
use <clamp.scad>;

module director_module_full() {
    color("grey")
        director_module();
    translate([6, 0, 10.4])
        director();
    color("black")
    translate([19, 0, 10/2 + 9/2 - 0.5 - 0.1])
        clamp();
}

module radiator_module_full() {
    color("grey")
        radiator_module();
    translate([6, 170/2+6, 10.4]) {
        director(length=170);
    }
    translate([6, -170/2-6, 10.4]) {
        director(length=170);
    }
    color("black")
    translate([19, 0, 10/2 + 9/2 - 0.5 - 0.1])
        clamp();
    
    translate([-15, 0, 20]) connector();
}

module director_module_full_2m() {
    color("grey")
    director_module();
    translate([6, 0, 10.4])
        director(length=900);
}

module radiator_module_full_2m() {
    color("grey")
        radiator_module();
    translate([6, 450/2+6, 10.4]) {
        director(length=450);
    }
    translate([6, -450/2-6, 10.4]) {
        director(length=450);
    }
    color("black")
    translate([19, 0, 10/2 + 9/2 - 0.5 - 0.1])
        clamp();
    
    translate([-15, 0, 20]) connector();
}

translate([500, 0, 0])
    rod_profile(width=10, inner_width=8, length=1000);

/*translate([0, 0, 0]) director_module_full();
translate([115, 0, 0]) radiator_module_full();
translate([165, 0, 0]) director_module_full();
translate([330, 0, 0]) director_module_full();
translate([545, 0, 0]) director_module_full();
translate([785, 0, 0]) director_module_full();
translate([960, 0, 0]) director_module_full();
*/

rotate([90, 0, 0]) {
    translate([0, 0, 0]) {
        translate([0, 0, 0]) director_module_full_2m();
        translate([260, 0, 0]) radiator_module_full_2m();
        translate([470, 0, 0]) director_module_full_2m();
        translate([985, 0, 0]) director_module_full_2m();
    }
}