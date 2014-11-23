
Con_Motor_Base = DefCon;
Con_Motor_Shaft = [ [0, 0, 30 + 6], [0, 0, 1], 0, 0, 0 ];

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
		cylinder(r1=(diameter-2)/2, r2=diameter/2, h=3.5);
		translate([0,0,3.5])
			cylinder(r=diameter/2, h=height-7);
		translate([0,0,height-3.5])
			cylinder(r1=diameter/2,r2=(diameter-1)/2, h=3.5);

		translate([0,0,height])
			cylinder(r=5, h=1.5);

		// Prop Mount
		translate([0,0,height]) {
			linear_extrude(6)
				difference() {
					circle(r=19/2);

					for (i = [0,120,240])
					rotate(a = i, v=[0,0,1])
					translate([2.5, 2.5])
						square([8,8]);
				}

			cylinder(r=5/2, h=25);
		}

		// Prop spinner
		translate([0,0,height+6+8]) {
			cylinder(r=16/2, h=1);
			cylinder(r1=16/2, r2=1, h=20);
		}
	}
}