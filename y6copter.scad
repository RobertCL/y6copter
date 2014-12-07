include <config/config.scad>

folded = false;

// Rear Arm
for (ang = [-90])
	rotate(a= ang, v=[0,0,1])
	translate([0,-ArmDia/2,0])
		Arm_Assembly();

// Front arms
if (!folded) {
	for (ang = [30, 150])
		rotate([0,0,ang])
		translate([0,-ArmDia/2,0])
			Arm_Assembly();
} else { 
	for (angv = [[30, -110], [150, 110]])
		translate([BasePlateFrontArmLength * cos(angv[0]), BasePlateFrontArmLength * sin(angv[0]), 0])
		rotate([0,0,angv[1]])
		translate([-BasePlateFrontArmLength * cos(angv[0]), -BasePlateFrontArmLength * sin(angv[0]), 0])
		rotate([0,0,angv[0]])
		translate([0,-10.5,0])
			Arm_Assembly();
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
