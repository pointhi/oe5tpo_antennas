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

module rod_profile(width=10, inner_width=8, length=100) {
    // Rod Profile dummy
    color("LightGrey") {
        translate([0, 0, 0]) {
            difference() {
                cube([length
                     ,width
                     ,width]
                    ,center=true);
                cube([length+2
                     ,inner_width
                     ,inner_width]
                    ,center=true);
            }
        }
    }
}
 
module director(diameter=6, length=350) {
    // Radiator dummy
    $fn = 50;
    color("LightGrey") {
        translate([0, length/2, 0]) {
        rotate([90,0,0])
            cylinder(r=diameter/2, h=length);
        }
    }
}

// connector
module connector() {
    $fn = 50;
    color("LightGrey") {
        translate([-module_axis_pos+radiator_1_length_offset-radiator_module_offset,0,20]) {
            difference() {
                union() {
                    translate([4,0,0]) {
                        rotate([0,-90,0])
                                cylinder(r=16/2
                                        ,h=22);
                    }
                    translate([-2,-25.5/2,-25.5/2]) {
                        cube([2
                             ,25.5
                             ,25.5]);
                    }
                }
                translate([1,18.4/2,18.4/2]) {
                    rotate([0,-90,0])
                        cylinder(r=3/2
                                ,h=4);
                }
                translate([1,18.4/2,-18.4/2]) {
                    rotate([0,-90,0])
                        cylinder(r=3/2
                                ,h=4);
                }
                translate([1,-18.4/2,18.4/2]) {
                    rotate([0,-90,0])
                        cylinder(r=3/2
                                ,h=4);
                }
                translate([1,-18.4/2,-18.4/2]) {
                    rotate([0,-90,0])
                        cylinder(r=3/2
                                ,h=4);
                }
            }
        }
    }
}
connector();
//rod_profile(width=10, inner_width=8, length=1000);
//director(diameter=6, length=350);