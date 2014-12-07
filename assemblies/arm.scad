module Arm_Assembly()
{
	translate([10, 0, 0])
	color(WoodColor)
		cube([ArmLength-10, ArmDia, ArmDia]);

	translate([ArmLength-15, ArmDia/2, ArmDia/2])
		Motor_Assembly();
}
