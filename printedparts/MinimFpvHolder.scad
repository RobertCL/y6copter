
module MinimFpvHolder()
{
	minim_w = 11;
	fpv_w = 14;

	box_outer_w = minim_w + fpv_w + 3 * 4Perim;
	box_outer_l = 45 + 2 * 4Perim;

	box_inner_w = box_outer_w - 2 * 4Perim;
	box_inner_l = box_outer_l - 2 * 4Perim;

	// Base
	linear_extrude(2) {
		square([box_outer_w, box_outer_l]);

		// Tie downs
		translate([box_outer_w - 3 - 7, -10])
			square([7, 10]);
		translate([box_outer_w - 3 - 7, box_outer_l])
			square([7, 10]);
	}

	// Tie down lips
	linear_extrude(4) {
		translate([box_outer_w - 3 - 7, -10])
			square([7, 4Perim]);
		translate([box_outer_w - 3 - 7, box_outer_l + 10 - 4Perim])
			square([7, 4Perim]);
	}

	// Main walls
	linear_extrude(30)
	difference() {
		square([box_outer_w, box_outer_l]);

		// Minim Enclosure
		translate([4Perim, 4Perim]) {
			square([minim_w, box_inner_l]);

			// Telemetry input
			translate([minim_w - 5.5 - 3, box_inner_l])
				square([3, 4Perim+eta]);
			// Video in/out
			translate([minim_w - 3 - 5, -4Perim-eta])
				square([5, 4Perim+eta]);
		}

		// FPV Enclosure
		translate([box_outer_w - 4Perim - fpv_w, 4Perim]) {
			square([fpv_w, box_inner_l]);

			// Antenna
			translate([1, box_inner_l])
				square([7, 4Perim+eta]);
			// Video / power in
			translate([2.5, -4Perim - eta])
				square([7, 4Perim+eta]);
		}
	}

	// Board Supports
	linear_extrude(12) {
		// FPV
		translate([box_outer_w - 4Perim - 3.5, 0])
			square([3.5, 15]);
		translate([box_outer_w - 4Perim - 5, box_outer_l - 4Perim - 5])
			square([5, 5]);

		// Minim
		translate([4Perim, 4Perim + 5])
			square([4, 9]);
		translate([4Perim, 4Perim + 20])
			square([4, 19]);
	}

	// Lid screw in point
	linear_extrude(30)
	translate([4Perim, 4Perim + 5])
	difference() {
		square([4, 9]);

		translate([1.6, 4.5])
			circle(d=3);
	}
}


module Minim_Lid()
{
	minim_w = 11;
	fpv_w = 14;

	linear_extrude(2)
	difference() {
		square([2 * 2Perim + 3 * 4Perim + minim_w + fpv_w, 45 + 3 * 4Perim]);

		// Lid screw in point
		translate([2Perim + 4Perim, 2Perim + 4Perim + 5])
		translate([1.6, 4.5])
			circle(d=3mmHoleDia);

		// Minim Ventilation
		translate([2Perim + 4Perim + 1, 2Perim + 4Perim + 16])
		for (i=[0:6])
		translate([0, 1+i * 4])
			square([9, 2]);

		// Fpv cutouts
		translate([2Perim + 2*4Perim + minim_w, 2Perim + 4Perim]) {
			// Button
			translate([5, 19])
				square([7, 7]);

			// Ventilation
			for (i=[0:3])
			translate([1, 1 + i * 4])
				square([11, 2]);
			for (i=[0:3])
			translate([1, 1 + 28 + i * 4])
				square([11, 2]);
		}
	}

	translate([0, 0, -3])
	linear_extrude(3)
	difference() {
		square([2 * 2Perim + 3 * 4Perim + minim_w + fpv_w, 45 + 3 * 4Perim]);

		translate([2Perim, 2Perim])
			square([3 * 4Perim + minim_w + fpv_w, 45 + 2 * 4Perim]);

		// Telemetry Input Cutout
		//translate([2Perim + 4Perim + minim_w - 5.5 - 3,  2Perim + 2 * 4Perim + 45])
		//	square([3, 2Perim+eta]);

		// Fpv Camera Input Cutout
		translate([2Perim + 2*4Perim + minim_w, 0])
		translate([2.5, -eta])
			square([7, 2Perim+eta]);
	}
}