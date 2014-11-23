rcReceiver_width = 35;
rcReceiver_length = 52;
rcReceiver_height = 15.5;

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

	color([0.5, 0.5, 0.5]) {

		// Main body
		linear_extrude(h)
		difference() {
			square([w,l]);

			translate([2,-eta,0])
				square([w-4, 10]);
		}

		// Pin surround
		translate([2,0,0]) {
			cube([w-4, 10, 4]);
			translate([0,0,h-3])
				cube([w-4, 10, 3]);
			translate([14,0,0])
				cube([1.5,10,h]);
		}

		// Arial Exit
		translate([w/2, l, h/2])
		rotate(a=-90, v=[1,0,0])
			cylinder(r=1, h=1);
	}

	// Pins
	translate([4, 8, 5.5])
	rotate(a=90, v=[1,0,0]) {
		PcbPins(cols=5, rows=3);
		translate([2.54*5 + 1.5 + 1.75, 0, 0])
			PcbPins(cols=5, rows=3);
	}
}