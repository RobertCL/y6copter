include <../config/config.scad>

arms = false;
foldedpc = 0;

if (arms) Arms_Assembly(foldedpc);


translate([0,0,-5])
    BasePlate();

*translate([0,0,21])
    TopPlate();


*translate([rcReceiver_width/2, 75, 0])
rotate([0, 0, 180])
	rcReceiver();

*union() {
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