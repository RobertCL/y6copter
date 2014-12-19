include <config/config.scad>

folded = false;

// Rear Arm
for (ang = [-90])
	rotate(a= ang, v=[0,0,1])
	translate([0,-ArmDia/2,0])
		Arm_Assembly(ArmTypeRear);

// Front arms
if (!folded) {
	for (ang = [30, 150])
		rotate([0,0,ang])
		translate([0,-ArmDia/2,0])
			Arm_Assembly(ArmTypeFront);
} else { 
	for (angv = [[30, -110], [150, 110]])
		translate([BasePlateFrontArmLength * cos(angv[0]), BasePlateFrontArmLength * sin(angv[0]), 0])
		rotate([0,0,angv[1]])
		translate([-BasePlateFrontArmLength * cos(angv[0]), -BasePlateFrontArmLength * sin(angv[0]), 0])
		rotate([0,0,angv[0]])
		translate([0,-10.5,0])
			Arm_Assembly(ArmTypeFront);
}

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
