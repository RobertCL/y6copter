
Con_Propellor = DefCon;

module propellor()
{
	if (DebugCoordinateFrames)  frame();
	
	if (DebugConnectors) {
		connector(Con_Propellor);
	}

	// Hub
	color(Grey50) {
		linear_extrude(6)
		difference() {
			circle(r=10/2);
			circle(r=5/2);
		}

		// Blades
		blade();
		rotate(a=180, v=[0,0,1])
			blade();
	}
}

module blade()
{
	translate([0,0,3])
	rotate(v=[1,0,0], a=25)
	linear_extrude(1)
	difference() {
		hull() {
			circle(r=8/2);

			// End
			translate([5*25.4 - 3,0,0])
				circle(r=3/2);

			// Center
			translate([70,0,0])
				circle(r=12/2);
		}

		circle(r=8/2);
	}
}