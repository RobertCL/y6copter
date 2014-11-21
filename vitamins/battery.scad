Con_Battery_FrontLeft = [ [-162/2, -46/2, -29/2], [0, 0, 1], 0, 0, 0 ];;

module battery()
{
	if (DebugCoordinateFrames)  frame();
	if (DebugConnectors) {
		connector(Con_Battery_FrontLeft);
	}

	l = 162;
	w = 46;
	h = 29;

	c = 2;

	color("yellow")
	hull()
	for (x = [0:1], y = [0:1], z = [0:1])
		mirror([x,0,0])
		mirror([0,y,0])
		mirror([0,0,z])
		translate([l/2 - c, w/2 - c, h/2 - c])
			sphere(r=c);
}