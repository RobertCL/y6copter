apmHolder_width = apm_width + 2 + 4perim;
apmHolder_length = apm_length + 2 + 4perim;

module ApmHolder()
{
	linear_extrude(2.4)
	difference() {
		union() {
			square([apmHolder_width, apmHolder_length], center=true);

			// Anti vibration mount holes
			for (i=[0, 1], j=[0, 1])
			mirror([i, 0, 0])
			mirror([0, j, 0])
			translate([-apmHolder_width/2, -apmHolder_length/2 - 6.5], 0)
			difference() {
				union() {
					square([13, 6.5]);
					translate([6.5, 0, 0])
					circle(d=13);
				}

				translate([6.5, 0, 0])
					circle(d=9);
			}
		}

		// Mount holes
		for (i = [0:1], j = [0:1])
		mirror([i, 0, 0])
		mirror([0, j, 0])
		translate([apm_width / 2 - 2.5, apm_length / 2 - 2.5])
			circle(d=3mmHoleDia);
	}

	linear_extrude(4.2)
	difference() {
		square([apmHolder_width, apmHolder_length], center=true);

		difference() {
			square([apmHolder_width - 4perim, apmHolder_length - 4perim], center=true);

			// Mount supports
			for (i = [0:1], j = [0:1])
			mirror([i, 0, 0])
			mirror([0, j, 0])
			translate([-apmHolder_width / 2, -apmHolder_length / 2])
				square([7, 7]);

		}
				
		// Mount holes
		for (i = [0:1], j = [0:1])
		mirror([i, 0, 0])
		mirror([0, j, 0])
		translate([apm_width / 2 - 2.5, apm_length / 2 - 2.5])
			circle(d=3mmHoleDia);
	}
}


module ApmHolder_Top()
{
	// Top
	translate([0, 0, 11])
	linear_extrude(2.4)
	difference() {
		square([apmHolder_width, apmHolder_length], center=true);

		// Mount holes
		for (i = [0:1], j = [0:1])
		mirror([i, 0, 0])
		mirror([0, j, 0])
		translate([apm_width / 2 - 2.5, apm_length / 2 - 2.5])
			circle(d=3mmHoleDia);

		// Left side rail
		translate([-apm_width/2, -apm_length/2])
		translate([0, 5, 0]) {
			square([9, 5]);
			square([8.5, 40]);
		}

		// Right side
		translate([apm_width/2, -apm_length/2]) {
			// Rail
			translate([-9.5, 7, 0])
				square([10, 8]);
			translate([-3, 15, 0])
				square([3.5, 31]);

			// Led Viewing Hole
			translate([-9.5, 2])
				square([4, 4]);
		}

		// Right Side Front
		translate([apm_width/2, apm_length/2])
		translate([-10, -5.5 - 9])
			square([4, 9.5]);

		// Gps Mount Holes
		translate([-apm_width/2, -apm_length/2])
		translate([11.5, 18.5, 0]) {
			circle(d=3mmHoleDia);
			translate([23, 0, 0])
				circle(d=3mmHoleDia);
		}
	}

	// Mount holes
	translate([0, 0, 2])
	linear_extrude(2.4+11-2)
	difference() {

		// Mount supports
		for (i = [0:1], j = [0:1])
		mirror([i, 0, 0])
		mirror([0, j, 0])
		translate([-apmHolder_width / 2, -apmHolder_length / 2])
			square([7, 7]);

		// Mount holes
		for (i = [0:1], j = [0:1])
		mirror([i, 0, 0])
		mirror([0, j, 0])
		translate([apm_width / 2 - 2.5, apm_length / 2 - 2.5])
			circle(d=3mmHoleDia);
	
	}

	// Walls
	linear_extrude(2.4+11)
	difference() {
		square([apmHolder_width, apmHolder_length], center=true);

		square([apmHolder_width - 6perim, apmHolder_length - 6perim], center=true);
				
		// Mount holes
		for (i = [0:1], j = [0:1])
		mirror([i, 0, 0])
		mirror([0, j, 0])
		translate([apm_width / 2 - 2.5, apm_length / 2 - 2.5])
			circle(d=3mmHoleDia);

		// Outputs
		translate([0, -apmHolder_length/2 + Perim - eta, 0])
			square([22, 6Perim], center=true);

		// Inputs
		translate([-4.5, apmHolder_length/2 - eta - Perim, 0])
			square([21, 4Perim + 2*eta], center=true);

		// Usb
		translate([-apmHolder_width/2, apmHolder_length/2, 0])
		translate([0, -22])
			square([4Perim, 12]);
	}

	// Usb port additional wall height
	translate([0,0,6])
	linear_extrude(2.4+5)
	translate([-apmHolder_width/2, apmHolder_length/2, 0])
	translate([0, -22])
		square([3*Perim, 12]);

	// Barometer Cover
	translate([-apm_width/2, apm_length/2, 3.5])
	translate([8+12, -8-9, 0])
	linear_extrude(2.4+11-3.5)
	difference() {
		square([16, 16], center=true);
		square([16-4Perim, 16 - 2*4Perim], center=true);
	}
}