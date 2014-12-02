include <config/config.scad>

// Arms
for (ang = [30, -90, 150])
rotate(a= ang, v=[0,0,1]) {

	translate([0,-10.5,0]) {
		color(WoodColor)
			cube([300, 21, 21]);

		translate([285, 10.5, 10.5])
			Motor_Assembly();
	}
}


translate([0,0,-3])
    BasePlate();

translate([0,0,25]) {
	apm();

	translate([3,-120])
		3drRadio_Assembly();

	translate([-3,-70])
	rotate(a=180, v=[0,0,1])
		rcReceiver();

	translate([25, 0, 0]) {
		fpvTransmitter();

		translate([0, 0, 17])
			minimOsd();
	}
}



translate([10, -40, 10.5])
    powerModule();

translate([0,0,-20])
rotate(a=90, v=[0,0,1])
	battery();
