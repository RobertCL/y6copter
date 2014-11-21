Con_APM_FrontLeft = DefCon;

module apm()
{
	if (DebugCoordinateFrames)  frame();
	if (DebugConnectors) {
		connector(Con_APM_FrontLeft);
	}

	width = 45;
	length = 60;

	linear_extrude(2)
	difference() {
		square([width, length], true);

		for (i = [0:1], j = [0:1])
			mirror([i, 0, 0])
			mirror([0, j, 0])
			translate([width / 2 - 2.5, length / 2 - 2.5])
				circle(r=1.5);
	}

	// Back servo pin rail
	translate([-width/2 + 2, 10, 2])
		PcbPins(cols=10, rows=3, a=-90);

	// Servo In
	translate([-8, -length/2+3, 3])
	rotate(a=90, v=[1,0,0])
		PcbPins(cols=8, rows=3);

	// Motor Out
	translate([-8, length/2-3, 3])
	mirror([0,1,0])
	rotate(a=90, v=[1,0,0])
		PcbPins(cols=8, rows=3);
}