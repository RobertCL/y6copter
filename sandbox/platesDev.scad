include <../config/config.scad>

//$fn = 200;

arms = true;
foldedpc = 0;

if (arms) Arms_Assembly(foldedpc);


translate([0,0,-5])
    BasePlate();

translate([0,0,21])
    TopPlate();

union() {
    translate([0, -51, -8])
    rotate([90, 0, 0])
        Leg();

    translate([0, 59, -8])
    rotate([90, 0, 0])
        Leg();
}

// Ground
*color("Green")
translate([0, 0, -120])
    cube([1000, 1000, 5], center = true);