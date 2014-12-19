// ArmType [0] - first hole distance
ArmTypeFront = [BasePlateFrontArmLength];
ArmTypeRear = [BasePlateBackArmLength];


module Arm_Assembly(ArmType)
{
	translate([10, 0, 0])
	color(WoodColor)
	linear_extrude(ArmDia)
	difference() {	
		square([ArmLength-10, ArmDia]);

		// Inner hole
		translate([10, ArmDia/2])
			circle(d=3mmHoleDia);

		// Outer (pivot) hole
		translate([ArmType[0] - 10, ArmDia/2])
			circle(d=3mmHoleDia);
	}

	translate([ArmLength-15, ArmDia/2, ArmDia/2])
		Motor_Assembly();
}

module Arms_Assembly(folded = false)
{
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