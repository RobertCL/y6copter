
// Module board size plus .5mm
rcTimer_w=17.5;
rcTimer_l=35.5;

module RcTimerAirModuleHolder_Base()
{

	linear_extrude(1){
		square([rcTimer_w+4Perim, 4Perim+3]);

		translate([0, 27 + 4Perim, 0])
			square([rcTimer_w+4Perim, 3]);
	}

	linear_extrude(7)
	difference() {
		square([rcTimer_w+2*4Perim, rcTimer_l+2*4perim+4]);

		// Main hole
		translate([4Perim, 4Perim, 0])
			square([rcTimer_w, rcTimer_l]);

		// Antenna Exit
		translate([4Perim, rcTimer_l+4Perim, 0]) {
			square([7.5, 1.8]);
			translate([1, 0, 0])
				square([5.5, 4+4Perim+eta]);
		}

		// Serial Connector
		translate([4Perim+1, -eta, 0])
			square([10, 4Perim+2*eta]);

		// Lid screw hole
		translate([2*4Perim + rcTimer_w - 5, 4+2*4Perim+rcTimer_l - 2.7])
			circle(d=3); // tight 3mm hole
	}
}

module RcTimerAirModuleHolder_Lid()
{
	// Module board size plus .5mm
	rcTimer_w=17.5;
	l=35.5;

	linear_extrude(2)
	difference() {
		square([rcTimer_w+2*4Perim, l+2*4perim+4]);
		
		// Lid screw hole
		translate([2*4Perim + rcTimer_w - 5, 4+2*4Perim+l - 2.7])
			circle(d=3mmDiaHole); // tight 3mm hole

		// LED's
		translate([4Perim + 11, 4Perim + 13.5, 0])
			square([4, 4]);
	}

	translate([0,0,-0.6])
	linear_extrude(0.6) 
	difference() {
		translate([4Perim + .5, 4Perim + .5, 0])
			square([rcTimer_w - 1, l -1]);

		// LED's
		translate([4Perim + 11, 4Perim + 13.5, 0])
			square([4, 4]);
	}
}