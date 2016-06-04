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

module endcap(hole_diameter=6.4,
              hole_length=10,
              start_diameter=8,
              end_diameter=10) {
    $fn = 50;

    difference() {
        hull() {
            cylinder(r=start_diameter/2, h=hole_length);
            translate([0, 0 , hole_length]) sphere(d=end_diameter);
        }
        translate([0, 0 , -1]) cylinder(r=hole_diameter/2, h=hole_length+1);
    }
}

endcap();