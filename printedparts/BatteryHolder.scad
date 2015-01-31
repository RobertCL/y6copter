BasePlateFrontArmLength = 60;
BasePlateBackArmLength = 100;

module BatteryHolderPlate()
{
	difference() {
		// Main Plate
		linear_extrude(5)
		difference() {
			union() {
				/*for(i=[0, 1])
				mirror([0, i, 0])
				translate([-Battery_Width/2, -59, 0])
					square([Battery_Width, 8]);*/

				square([Battery_Width, Battery_Length-37], center=true);

				for (i=[0, 1])
				mirror([0, i, 0])
				translate([0, 25, 0])
					square([Battery_Width + 22, 31], center=true);
			}
		
			// Battery Velcro Slots
			for (i=[0, 1], j=[0,1])
			mirror([j ,0, 0])
			mirror([0, i, 0])
			translate([(Battery_Width + 20)/2 - 6, 25, 0])
				square([7, 21], center=true);


			// Leg Mounting holes
			for (i=[0, 1], j=[0, 1])
			mirror([0, j, 0])
			mirror([i, 0, 0])
			translate([18, -55, 0])
				circle(d=3mmHoleDia);

			// Central Hole
			circle(r=8);

			// Weight loss cutouts
			for (i=[0,1])
			mirror([0, i, 0])
			translate([0, -19])
				square([Battery_Width-10, 14], center=true);

			translate([0, 39])
				square([Battery_Width-10, 14], center=true);
			translate([0, -39])
				square([Battery_Width-30, 14], center=true);
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

			translate([-Battery_Width/2, -59, 5-eta])
				cube([Battery_Width, 8, 5]);
		}

		// Leg Mounting holes
		for (i=[0, 1], j=[0, 1])
		mirror([0, j, 0])
		mirror([i, 0, 0])
		translate([18, -55, 0])
			cylinder(d=3mmHoleDia, h=10);
	}
}