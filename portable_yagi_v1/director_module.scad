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

module director_module(rod_width=10,                // width of rod
                       rod_clearance=0.8,           // has to be adjust to the printer tolerance
                       module_length=40,
                       shell=3,
                       director_diameter=6,         // diameter of director
                       director_module_width=40,
                       director_x=6,
                       director_y=5,
                       director_y_shell=2,
                       clamp_x=18.5,
                       clamp_overlap=0.2,           // clamp overlap to rod
                       clamp_asymetic=0.5,
                       clamp_diameter=9,
                       clamp_hole=3) {

    module_outer_width = rod_width + rod_clearance + shell*2;
    module_inner_width = rod_width + rod_clearance;
                           
    module_y_bottom_start = module_inner_width/2;

    director_box_length = clamp_x+clamp_diameter/2+clamp_asymetic+1; // TODO
    director_box_height = director_y-shell + director_diameter/2 + director_y_shell;

    director_module_length = director_x*2;

    $fn = 50;

    difference() {
        union() {
            // main body
            translate([0, -module_outer_width/2, -module_outer_width/2])
                    cube([module_length, module_outer_width, module_outer_width], center=false);

            hull() {
                translate([0, -module_outer_width/2, -module_outer_width/2])
                    cube([director_box_length+director_box_height, module_outer_width, module_outer_width], center=false);
                
                // director box
                translate([0, -module_outer_width/2, module_y_bottom_start+shell])
                    cube([director_box_length,
                          module_outer_width,
                          director_box_height]);
            }
            hull() {
                
                translate([0,
                           module_outer_width/2,
                           module_y_bottom_start + director_y - director_diameter/2 - director_y_shell])
                    cube([director_module_length, // TODO
                          (director_module_width-module_outer_width)/2,
                          director_diameter + director_y_shell*2]);
                translate([0,
                           -module_outer_width/2-(director_module_width-module_outer_width)/2,
                           module_y_bottom_start + director_y - director_diameter/2 - director_y_shell])
                    cube([director_module_length, // TODO
                          (director_module_width-module_outer_width)/2,
                          director_diameter + director_y_shell*2]);
                
                // outer part of hull
                translate([0, -module_outer_width/2, 0])
                    cube([director_module_length, // TODO
                          module_outer_width,
                          1]);
            }
        }
        
        // rod
        translate([module_length/2, 0, 0])
            cube([module_length + 2, module_inner_width, module_inner_width], center=true);
        
        // director
        translate([director_x, 0, module_y_bottom_start+director_y])
            director(diameter=director_diameter, length=350);
        
        // clamp cutout
        translate([clamp_x-clamp_diameter/2-clamp_asymetic*2-1,
                   -module_inner_width/2,
                   module_y_bottom_start-1])
            cube([director_box_length+director_box_height-(clamp_x-clamp_diameter/2-clamp_asymetic*2-1),
                  module_inner_width,
                  director_y-shell + director_diameter + director_y_shell+2], center=false);

        // clamp hole
        translate([clamp_x,
                   module_outer_width/2+1,
                   rod_width/2 + clamp_diameter/2 + clamp_asymetic - clamp_overlap])
            rotate([90, 0, 0])
                cylinder(r=clamp_hole/2, module_outer_width+2);
        
        // bevel
        translate([clamp_x-clamp_diameter/2-clamp_asymetic*2-1+1, 0, module_inner_width/2-1.5])
            hull() {
                cube([6, module_inner_width, 0.5], center=true);
                cube([0.5, module_inner_width, 6], center=true);
            }
        translate([clamp_x-clamp_diameter/2-clamp_asymetic*2-2+director_box_length+director_box_height-(clamp_x-clamp_diameter/2-clamp_asymetic*2-1), 0, module_inner_width/2-1.5])
            hull() {
                cube([6, module_inner_width, 0.5], center=true);
                cube([0.5, module_inner_width, 6], center=true);
            }

        // arrow
        translate([module_length-1.5-5, 0,-module_outer_width/2-1])
            linear_extrude(height = 1.5)
                polygon(points=[[5,0],[0,2.5],[0,-2.5]]);
        
        // lettering field
        translate([module_length-16,-(module_outer_width-4)/2,-module_outer_width/2-1])
            cube([8, module_outer_width-4, 1.5]);
    }
}

director_module();

