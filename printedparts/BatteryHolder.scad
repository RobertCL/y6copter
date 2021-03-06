
module BatteryHolderPlate()
{
	difference() {
		// Main Plate
		linear_extrude(5)
		difference() {
			union() {
				translate([-battery_width/2, -battery_length/2 - 10])
					square([battery_width, battery_length-8.5]);
				translate([-20, battery_length/2 - 20])
					square([40, 40]);

				// Battery slot ears
				for (i=[0, 1])
				mirror([0, i, 0])
				translate([0, 25, 0])
					square([battery_width + 22, 31], center=true);
				// Rear battery ears
				translate([0, -78, 0])
					square([battery_width + 22, 31], center=true);
			}
		
			// Battery Velcro Slots
			for (i=[0, 1], j=[0,1])
			mirror([j ,0, 0])
			mirror([0, i, 0])
			translate([(battery_width + 20)/2 - 6, 25, 0])
				square([7, 21], center=true);

			// Additional Rear slots
			for (j=[0,1])
			mirror([j ,0, 0])
			translate([(battery_width + 20)/2 - 6, -78, 0])
				square([7, 21], center=true);


			// Leg Mounting holes
			for (i=[0, 1], j=[0, 1])
			mirror([0, j, 0])
			mirror([i, 0, 0])
			translate([18, -55, 0])
				circle(d=3mmHoleDia);

			// Central Hole
			circle(r=8);

			// Gimbal mount holes
			translate([0, battery_length/2 + 20 - 5 - 10])
			for (i=[0, 1], j=[0, 1])
			mirror([i, 0, 0])
			mirror([0, j, 0])
			translate([-15, -10])
				circle(d=3mmHoleDia);

			// Weight loss cutouts
			for (i=[0,1])
			mirror([0, i, 0])
			translate([0, -19])
				square([battery_width-10, 14], center=true);

			translate([0, 39])
				square([battery_width-10, 14], center=true);
			translate([0, -39])
				square([battery_width-30, 14], center=true);

			translate([0, 74])
				square([battery_width-26, 26], center=true);

			translate([0, -71])
				square([battery_width-10, 10], center=true);
			translate([0, -85])
				square([battery_width-10, 10], center=true);
		}

		// Leg mount hole nut insets
		for (i=[0, 1], j=[0, 1])
		mirror([0, j, 0])
		mirror([i, 0, 0])
		translate([18, 55, -eta])
			cylinder(d=6.5, h=2.5+eta, $fn=6);
	}

	// Power module holder
	translate([-(25.5+6)/2, -47+15+3 ,5-eta]) {
		linear_extrude(6.5) {
	
			square([25.5 + 6, 3]);
			translate([0, -15])
				square([3, 15 + 3]);
			translate([25.5 + 3, -15])
				square([3, 15 + 3]);
		}

		// Corner holders
		translate([0, 3, 6.5-eta])
		linear_extrude(2*Layers)
			polygon([[0,0], [9,0], [0,-9]]);
		translate([25.5+6, 3, 6.5-eta])
		linear_extrude(2*Layers)
			polygon([[0,0], [-9,0], [0,-9]]);
	}

	// End Arcs
	difference() {
		for(i=[0,1])
		mirror([0, i, 0])
		intersection() {
			translate([0, -51, -85 +3])
			rotate([90, 0, 0])
				cylinder(r=90, h=8, $fn=200);

			translate([-battery_width/2, -59, 5-eta])
				cube([battery_width, 8, 5]);
		}

		// Leg Mounting holes
		for (i=[0, 1], j=[0, 1])
		mirror([0, j, 0])
		mirror([i, 0, 0])
		translate([18, -55, 0])
			cylinder(d=3mmHoleDia, h=10);
	}
}