include <../config/config.scad>

translate([0,0,-5])
    BasePlate();

Arms_Assembly(0);

translate([0,0,21])
    TopPlate();


translate([rcReceiver_width/2, 75, 0])
rotate([0, 0, 180])
	rcReceiver();

translate([0, 0, 21+5]) {
        translate([0, 0, 12.5]) {
            ApmHolder();
            translate([0, 0, 4])
                apm();
			translate([0, 0, 4.2])
			    ApmHolder_Top();
        }

	translate([25, 0, 0]) {
		fpvTransmitter();

		translate([0, 0, 17])
			minimOsd();
		}
		
	translate([-25-4Perim-.25, 42-4Perim-.25, 1])
	rotate([0, 0, -90])
	rotate([90, 0, 0])
		3drRadio();

	// TODO: GPS
}

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