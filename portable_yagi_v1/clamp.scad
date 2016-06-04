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

module clamp(clamp_lever_length = 28,
             clamp_lever_height = 3.5,
             clamp_base_lever_length = 21,
             clamp_top_angle = 30,
             clamp_width = 10,
             clamp_asymetic_y=0.5,
             clamp_asymetic_x=0.1,
             clamp_diameter=9,
             clamp_hole=3) {
    $fn = 50;

    difference() {
        union() {
            // main body
            translate([-clamp_asymetic_x, clamp_width/2, -clamp_asymetic_y])
                rotate([90, 0, 0])
                        cylinder(r=clamp_diameter/2, clamp_width);
            
            // main lever
            translate([-clamp_asymetic_x,
                       -clamp_width/2,
                       clamp_diameter/2-clamp_lever_height-clamp_asymetic_y])
                cube([clamp_base_lever_length, clamp_width, clamp_lever_height]);
            
            // top part of lever
            translate([-clamp_asymetic_x+clamp_base_lever_length,
                       -clamp_width/2,
                       clamp_diameter/2-clamp_lever_height-clamp_asymetic_y])
                rotate([0, -clamp_top_angle, 0])
                cube([clamp_lever_length-clamp_base_lever_length, clamp_width, clamp_lever_height]);
        }
        
        // mounting hole
        translate([0, clamp_width/2+1, 0])
            rotate([90, 0, 0])
                    cylinder(r=clamp_hole/2, clamp_width+2);
    }
}

/*translate([18.5, 0, 10/2 + 9/2 + 0.5 - 0.1])*/ clamp();

