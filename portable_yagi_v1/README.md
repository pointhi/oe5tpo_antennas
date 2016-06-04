# Portable pluggable YAGI Design

Because I required a yagi Design which is portable and easy to assemble I designed an yagi antenna which uses 3D-Printed quick lock connectors.


**Licence:** CERN OHL v.1.2

**Maintainer:** Thomas Pointhuber

[hackady.io Project Page](https://hackaday.io/project/11328-portable-pluggable-yagi-design)

**WARNING:** I sucessfull build multiple antennas with it, but note the files are adjusted to my printer. Please read the HowTo, to get some sense what probably need adjustance before starting printing.


### Files

| Filename              | Description                                        |
| --------------------- | -------------------------------------------------- |
| antenna_parts.scad    | some parts which are mostly for rendering purpose  |
| clamp.scad            | Clamp, which is used to lock the antenna part      |
| director_module.scad  | Mounting part for director and reflector           |
| endcap.scad           | Simple endcap for round rods                       |
| radiator_module.scad  | Mounting part for radiator including N-Connector   |
| yagi_complete.scad    | Shows how a complete yagi could look like          |


### HowTo

The part values are specific adjusted for my printer, which is currently not very accurate in some parts. You probably need to adjust some values, to create usable parts with your printer.

This parts are defined in the default version to be used on a 10mm rectular boom, where all elements have a diameter of 6mm. Usable Yagi Designs are for example available by [DK7ZB](http://www.qsl.net/dk7zb/PVC-Yagis/PVC-details.htm).

Most variables should already have useful values, and shouldn't need changes before printing. But please look (and probably adjust) the following variables:

(This variables need to be changed both in ```director_module.scad``` and ```radiator_module.scad```)
* **rod_clearance**: printer specific, you can adjust this value to bypass printer tolerances. When printed correctly, the boom rod should fit into the part tightly (but movable) when adjusted correctly.
* **clamp_overlap**: to have quick lock functionality, the clamp has to have an overlap to the mounting boom otherwise the element wouldn't lock. This value should be ok, as long as the boom doesn't have to much free space, but need to be adjusted when the clamp has to much or to little holding force.


### Notes

* When you change options in clamp.scad, you also need to adjust them in ```director_module.scad``` and ```radiator_module.scad```
* ```director_module.scad``` and ```radiator_module.scad``` have a big bunch of similar variables. Changes in one often also need changes in the oter variation


### TODO

* create a config file which contains all important variables


### Known Issues

* The Radiator Module is currently only designed for N-Connectors, where the mounting holes have a distance of 18.4mm. For different Connectors, to have to adjust the variables (which are currently coded with magic numbers)
