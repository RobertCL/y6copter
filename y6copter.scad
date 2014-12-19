include <config/config.scad>

folded = false;

Arms_Assembly(folded);

translate([0,0,-5]) {
    BasePlate();

    translate([-50,-60, 5])
	rcReceiver();
    
    translate([17, -10, 15])
    rotate([0, 90, 0])
    rotate([0, 0, -90])
        3drRadio();
    
    translate([25, -40, -5])
        powerModule();
}

translate([0, 0, 21]) {
    TopPlate();
	
	translate([0, 0, 5]) {
		apm();

		translate([25, 0, 0]) {
			fpvTransmitter();

			translate([0, 0, 17])
				minimOsd();
		}
		
        // TODO: GPS
	}
}


translate([0,0,-20])
rotate(a=90, v=[0,0,1])
	battery();
