rcReceiver_width = 30.5;
rcReceiver_length = 45;
rcReceiver_height = 11;

Con_RcReceiver_FrontLeft = DefCon;

module rcReceiver()
{
	if (DebugCoordinateFrames)  frame();
	if (DebugConnectors) {
		connector(Con_RcReceiver_FrontLeft);
	}
	w = rcReceiver_width;
	l = rcReceiver_length;
	h = rcReceiver_height;

	color([0.5, 0.5, 0.5, 0.6]) {
		linear_extrude(h)
		difference() {
			square([w,l]);

			translate([2,-eta,0])
				square([w-4, 10]);
		}

		translate([2,0,0])
		{
		cube([w-4, 10, 2]);
		translate([0,0,h-2])
			cube([w-4, 10, 2]);
			}
	}

	translate([4, 8, 3])
	rotate(a=90, v=[1,0,0]) {
		PcbPins(cols=5, rows=3);
		translate([2.54*5 + 2, 0, 0])
			PcbPins(cols=4, rows=3);
	}
}