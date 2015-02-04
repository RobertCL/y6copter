TopPlateFrontArmLength = 60;
TopPlateBackArmLength = 100;

module TopPlate()
{
	difference() {
		linear_extrude(5)
		difference() {
			hull() {
				for (i=[1, -1])
				mirror([i,0,0])
				rotate(a=i * 60, v=[0, 0, 1])
				translate([0, TopPlateFrontArmLength, 0])
					circle(r=15);

				translate([0, -TopPlateBackArmLength, 0])
					circle(r=15);

				translate([0, 60, 0])
					circle(r=25);
			}
		
			// Inner Holes
			for (ang = [-90, 30, 150])
			rotate([0, 0, ang])
			translate([20, 0])
				circle(d=3mmHoleDia);

			// Front outer holes
			for (i=[1, -1])
			mirror([i,0,0])
			rotate(a=i * 60, v=[0, 0, 1])
			translate([0, TopPlateFrontArmLength, 0])
				circle(d=3mmHoleDia);

			// Rear outer hole
			translate([0, -TopPlateBackArmLength, 0])
				circle(d=3mmHoleDia);

			// Round off sides
			for (i=[0,1])
				mirror([i, 0, 0])
				translate([215, -110])
					circle(r=200, $fn=100);

			// Round off front
			//translate([0, 175])
			//	circle(r=140);

			// Central Hole
			circle(r=8);

			// Anti vibration mount holes
			for (i=[0, 1], j=[0, 1])
			mirror([i, 0, 0])
			mirror([0, j, 0])
			translate([-apmHolder_width/2 + 6.5, -apmHolder_length/2 - 6.5], 0)
				circle(d=9);

			// Weight saving / random zip tie connection points
			for (i=[0,1])
			mirror([i, 0, 0]) {
				// Rear points
				translate([ArmDia/2 + 6, -BasePlateBackArmLength + 70, 0])
					square([3, BasePlateBackArmLength - 80]);
				translate([ArmDia/2 + 16, -BasePlateBackArmLength + 75, 0])
					square([3, BasePlateBackArmLength - 80]);
				translate([ArmDia/2 + 26, -BasePlateBackArmLength + 90, 0])
					square([3, BasePlateBackArmLength - 90]);

				// Front points
				translate([ArmDia/2 - 4, 54, 0])
					square([3, 24]);
				translate([ArmDia/2 + 6, 50, 0])
					square([3, 20]);
				translate([ArmDia/2 + 16, 43, 0])
					square([3, 20]);
				translate([ArmDia/2 + 26, 43, 0])
					square([3, 10]);
			}
		}

		// Hole insets
		// Inner Holes
		for (ang = [-90, 30, 150])
		rotate([0, 0, ang])
		translate([20, 0, 3])
			cylinder(d=6, h=2+eta);
		// Front outer holes
		for (i=[1, -1])
		mirror([i,0,0])
		rotate(a=i * 60, v=[0, 0, 1])
		translate([0, TopPlateFrontArmLength, 3])
			cylinder(d=6, h=2+eta);
		// Rear outer hole
		translate([0, -TopPlateBackArmLength, 3])
			cylinder(d=6, h=2+eta);

		// Antivibration holes
		for (i=[0, 1], j=[0, 1])
		mirror([i, 0, 0])
		mirror([0, j, 0])
		translate([-apmHolder_width/2 + 6.5, -apmHolder_length/2 - 6.5], -eta)
			cylinder(d=14.5, h=2.5);

	}

	// RCTimer Air Module Mount
	translate([-25, 43, 5])
	rotate([0, 0, 180])
		RcTimerAirModuleHolder_Base();
}
