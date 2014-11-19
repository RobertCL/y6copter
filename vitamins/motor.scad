
Con_Motor_Base = DefCon;
Con_Motor_Shaft = [ [0, 0, 35], [0, 0, 1], 0, 0, 0 ];

module motor()
{
	diameter = 28;
	height = 30;

	if (DebugCoordinateFrames)  frame();
	if (DebugConnectors) {
		connector(Con_Motor_Base);
		connector(Con_Motor_Shaft);
	}

	color(MetalColor) {
		// Body
		cylinder(r1=(diameter-2)/2, r2=diameter/2, h=2);
		translate([0,0,2])
			cylinder(r=diameter/2, h=height);
		translate([0,0,2+height])
			cylinder(r1=diameter/2,r2=(diameter-2)/2, h=3);
		translate([0,0,2+3+height])
			cylinder(r=5, h=1);

		// Shaft
		translate([0,0,2+3+1+height])
			cylinder(r=3/2, h=10);

		// Prop spinner
		translate([0,0,2+3+1+height+4])
			cylinder(r1=5, r2=1, h=10);
	}
}