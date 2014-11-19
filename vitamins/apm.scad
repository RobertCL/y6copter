Con_APM_FrontLeft = DefCon;

module apm()
{
	if (DebugCoordinateFrames)  frame();
	if (DebugConnectors) {
		connector(Con_APM_FrontLeft);
	}

	width = 45;
	length = 70;

	linear_extrude(2)
	difference() {
		square([width, length], true);

		for (i = [0:1], j = [0:1])
			mirror([i, 0, 0])
			mirror([0, j, 0])
			translate([width / 2 - 2.5, length / 2 - 2.5])
				circle(r=1.5);
	}
}