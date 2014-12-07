include <../config/config.scad>

$fn = 200;

arms = true;
folded = false;

if (arms) {
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
}

translate([0,0,-5])
    BasePlate();