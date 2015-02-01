include <../config/config.scad>

translate([0,0,-5])
    BasePlate();

*Arms_Assembly(0);

translate([0,0,21])
    TopPlate();


translate([rcReceiver_width/2, 75, 0])
rotate([0, 0, 180])
	rcReceiver();

translate([0, 0, 21+5]) {
	apm();

	*translate([25, 0, 0]) {
		fpvTransmitter();

		translate([0, 0, 17])
			minimOsd();
		}
		
	*translate([-30, 30, 0])
	rotate([0, 0, -90])
	rotate([90, 0, 0])
		3drRadio();

	// TODO: GPS
}

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