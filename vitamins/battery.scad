Con_Battery_FrontLeft = [ [-162/2, -46/2, -29/2], [0, 0, 1], 0, 0, 0 ];;

battery_length = 155;
battery_width = 45;
battery_height = 31;

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
		translate([battery_length/2 - c, battery_width/2 - c, battery_height/2 - c])
			sphere(r=c);
}