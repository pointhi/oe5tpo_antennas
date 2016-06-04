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

use <director_module.scad>;
use <antenna_parts.scad>;

module radiator_module(rod_width=10,                // width of rod
                       rod_clearance=0.8,           // has to be adjust to the printer tolerance
                       module_front_length=40,
                       module_back_length=15,
                       shell=3,
                       director_diameter=6,         // diameter of radiator
                       director_module_width=80,
                       back_module_width=35,
                       back_module_cut=25,
                       back_module_cut_length=15,
                       director_x=6,
                       director_y=5,
                       director_y_shell=2,
                       director_inner_spacer=10,
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

    union() {
        difference() {
            union() {
                director_module(rod_width=rod_width,
                                rod_clearance=rod_clearance,
                                module_length=module_front_length,
                                shell=shell,
                                director_diameter=director_diameter,
                                director_module_width=director_module_width,
                                director_x=director_x,
                                director_y=director_y,
                                director_y_shell=director_y_shell,
                                clamp_x=clamp_x,
                                clamp_overlap=clamp_overlap,
                                clamp_asymetic=clamp_asymetic,
                                clamp_diameter=clamp_diameter,
                                clamp_hole=clamp_hole);
                // main body
                translate([-module_back_length, -module_outer_width/2, -module_outer_width/2])
                        cube([module_back_length, module_outer_width, module_outer_width], center=false);
                
                // director holder
                hull() {
                    
                    translate([-module_back_length,
                               module_outer_width/2,
                               module_y_bottom_start + director_y - director_diameter/2 - director_y_shell])
                        cube([module_back_length, // TODO
                              (back_module_width-module_outer_width)/2,
                              director_diameter + director_y_shell*2]);
                    translate([-module_back_length,
                               -module_outer_width/2-(back_module_width-module_outer_width)/2,
                               module_y_bottom_start + director_y - director_diameter/2 - director_y_shell])
                        cube([module_back_length, // TODO
                              (back_module_width-module_outer_width)/2,
                              director_diameter + director_y_shell*2]);
                    
                    // outer part of hull
                    translate([-module_back_length, -module_outer_width/2, 0])
                        cube([module_back_length, // TODO
                              module_outer_width,
                              1]);
                }
                
                // wall for connector
                translate([-module_back_length, -back_module_width/2, module_y_bottom_start])
                    cube([4, back_module_width, 30]);
                
                translate([-module_back_length,
                           -back_module_width/2,
                           module_y_bottom_start]) {
                    hull() {
                        cube([4, 4, 20]);
                        cube([14, 4, 10]);
                    }
                }
                
                translate([-module_back_length,
                           back_module_width/2-4,
                           module_y_bottom_start]) {
                    hull() {
                        cube([4, 4, 20]);
                        cube([14, 4, 10]);
                    }
                }
                
                hull() {
                    support_width_start = 10;
                    support_width_end = 10;
                    translate([-module_back_length,
                               -back_module_width/2,
                               module_y_bottom_start+director_y-support_width_start/2])
                        cube([1, back_module_width, support_width_start]);
                    translate([0,
                               -director_module_width/2,
                               module_y_bottom_start+director_y-support_width_end/2])
                        cube([1, director_module_width, support_width_end]);
                }
            }
            // rod
            translate([-module_back_length/2, 0, 0])
                cube([module_back_length + 2, module_inner_width, module_inner_width], center=true);
            
            // inner cut
            translate([director_x+director_diameter/2-back_module_cut_length, -back_module_cut/2, module_y_bottom_start+director_y])
                cube([back_module_cut_length, back_module_cut, 20], center=false);
            
            // connector cut
            translate([director_x, 0, 20]) {
                rotate([0,-90,0]) cylinder(r=16/2, h=50);
                
                translate([-director_x-1+director_y, 18.4/2, 18.4/2]) {
                    rotate([0,-90,0]) cylinder(r=3/2, h=module_back_length+director_y+1);
                }
                
                translate([-director_x-1+director_y, 18.4/2, -18.4/2]) {
                    rotate([0,-90,0]) cylinder(r=3/2, h=module_back_length+director_y+1);
                }
                
                translate([-director_x-1+director_y, -18.4/2, -18.4/2]) {
                    rotate([0,-90,0]) cylinder(r=3/2, h=module_back_length+director_y+1);
                }
                
                translate([-director_x-1+director_y, -18.4/2, 18.4/2]) {
                    rotate([0,-90,0]) cylinder(r=3/2, h=module_back_length+director_y+1);
                }
                
            }
        }
        translate([director_x-director_diameter/2,
                   -director_inner_spacer/2,
                   module_y_bottom_start+director_y-director_diameter/2]) {
            cube([director_diameter, director_inner_spacer, director_diameter/2]);
        }
    }
}

radiator_module();
//translate([-15, 0, 20]) connector();
