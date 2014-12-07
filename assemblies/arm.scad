module Arm_Assembly()
{
	color(WoodColor)
		cube([ArmLength, ArmDia, ArmDia]);

	translate([ArmLength-15, ArmDia/2, ArmDia/2])
		Motor_Assembly();
}
