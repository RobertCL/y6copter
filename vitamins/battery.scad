Con_Battery_FrontLeft = [ [-162/2, -46/2, -29/2], [0, 0, 1], 0, 0, 0 ];;

Battery_Length = 155;
Battery_Width = 45;
Battery_Height = 31;

module battery()
{
	if (DebugCoordinateFrames)  frame();
	if (DebugConnectors) {
		connector(Con_Battery_FrontLeft);
	}
	
	c = 2;

	color("yellow")
	hull()
	for (x = [0:1], y = [0:1], z = [0:1])
		mirror([x,0,0])
		mirror([0,y,0])
		mirror([0,0,z])
		translate([Battery_Length/2 - c, Battery_Width/2 - c, Battery_Height/2 - c])
			sphere(r=c);
}