include <../config/config.scad>

$fn = 200;

arms = true;
folded = false;

if (arms) Arms_Assembly(folded);


translate([0,0,-5])
    BasePlate();

translate([0,0,21])
    TopPlate();