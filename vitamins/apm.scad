apm_width = 40.5;
apm_length = 66;

Con_APM_FrontLeft = [ [-apm_width/2 + 2.5, -apm_length/2 + 2.5, 0], [0, 0, 1], 0, 0, 0 ];

module apm()
{
	if (DebugCoordinateFrames)  frame();
	if (DebugConnectors) {
		connector(Con_APM_FrontLeft);
	}

	// Board
	color(PcbColor)
	linear_extrude(2)
	difference() {
		square([apm_width, apm_length], true);

		// Mount holes
		for (i = [0:1], j = [0:1])
			mirror([i, 0, 0])
			mirror([0, j, 0])
			translate([apm_width / 2 - 2.5, apm_length / 2 - 2.5])
				circle(r=1.5);

		// Mount direction
		square([6,20], center=true);
		translate([0,8,0])
		rotate(a=90, v=[0,0,1])
			circle(r=8, $fn=3);
	}

	// Back servo pin rail
	translate([-apm_width/2 + 2.54*2.5, -apm_length/2 + 2.54/2 + 10, 2])
		PcbPins(cols=14, rows=3, a=90);

	// Front pins with minim pins
	translate([apm_width/2 -2.54/2, -apm_length/2 + 2.54/2 + 15.5, 2])
		PcbPins(cols=12, rows=1, a=90);

	// Motors Out (Rear of board)
	translate([-apm_width/2 + 10 + 2.54/2, -apm_length/2, 3])
	rotate(a=90, v=[1,0,0])
		PcbPins(cols=8, rows=3);

	// Servo In (Front of board)
	translate([-apm_width/2 + 5 + 2.54, apm_length/2, 3])
	mirror([0,1,0])
	rotate(a=90, v=[1,0,0])
		PcbPins(cols=8, rows=3);

	// Usb connector
	color(MetalColor)
	translate([-apm_width/2 - .6, apm_length/2-17.5, 2])
		cube([5.6, 7.5, 2]);

	// 3DR Radio connector
	translate([-apm_width/2, -apm_length/2 + 6, 2])
		DF13Connector(5);

	// Power Module connector
	translate([apm_width/2 - 9.5, -apm_length/2 + 6, 2])
		DF13Connector(6);

	// GPS connector
	translate([apm_width/2 - 6, apm_length/2 -5.5 -8, 2])
	rotate(a=90, v=[0,0,1])
		DF13Connector(5);

}