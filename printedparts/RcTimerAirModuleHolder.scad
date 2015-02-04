
// Module board size plus .5mm
rcTimer_w=17.5;
rcTimer_l=35.5;

module RcTimerAirModuleHolder_Base()
{

	linear_extrude(3.5){
		square([rcTimer_w+4Perim, 4Perim+3]);

		translate([0, 27 + 4Perim, 0])
			square([rcTimer_w+4Perim, 3]);
	}

	linear_extrude(9.5)
	difference() {
		square([rcTimer_w+2*4Perim, rcTimer_l+2*4perim+4]);

		// Main hole
		translate([4Perim, 4Perim, 0])
			square([rcTimer_w, rcTimer_l]);

		// Antenna Exit
		translate([4Perim, rcTimer_l+4Perim, 0]) {
			square([7.5, 1.8]);
			translate([0.5, 0, 0])
				square([6.5, 4+4Perim+eta]);
			translate([-4Perim, 3.5, 0])
				square([10.5, 5]);
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
	linear_extrude(2)
	difference() {
		square([rcTimer_w + 3 * 4Perim, rcTimer_l + 2 * 4perim + 4]);
		
		// Lid screw hole
		translate([2Perim + 2*4Perim + rcTimer_w - 5, 4 + 2 * 4Perim + rcTimer_l - 2.7])
			circle(d=3mmHoleDia);

		// LED's
		translate([2Perim + 4Perim + 11, 4Perim + 13.5, 0])
			square([4, 4]);

		// Antenna Exit
		translate([4Perim, rcTimer_l + 4Perim, 0]) {
			translate([-4Perim, 3.5, 0])
				square([2Perim+10.5, 5]);
		}
	}

	// Inside protrusion
	translate([0,0,-0.6])
	linear_extrude(0.6) 
	difference() {
		translate([2Perim + 4Perim + .4, 4Perim + .4, 0])
			square([rcTimer_w - .8, rcTimer_l - .8]);

		// LED's
		translate([2Perim + 4Perim + 11, 4Perim + 13.5, 0])
			square([4, 4]);
	}

	// Side clip walls
	translate([0,0,-3])
	linear_extrude(3) 
	difference() {
		square([rcTimer_w + 3 * 4Perim, rcTimer_l + 2 * 4perim + 4]);

		translate([2Perim, -eta, 0])
			square([rcTimer_w + 2 * 4Perim, rcTimer_l + 2 * 4perim + 4 +eta]);

		translate([4Perim, rcTimer_l + 4Perim, 0])
			translate([-4Perim, 3.5, 0])
				square([2Perim+10.5, 5]);
	}
}