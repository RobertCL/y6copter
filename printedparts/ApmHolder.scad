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
