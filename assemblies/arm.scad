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
