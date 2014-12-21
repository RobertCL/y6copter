BasePlateFrontArmLength = 60;
BasePlateBackArmLength = 100;

module BasePlate()
{
	difference() {
		linear_extrude(5)
		difference() {
			hull() {
				for (i=[1, -1])
				mirror([i,0,0])
				rotate(a=i * 60, v=[0, 0, 1])
				translate([0, BasePlateFrontArmLength, 0])
					circle(r=15);

				translate([0, -BasePlateBackArmLength, 0])
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
			translate([0, BasePlateFrontArmLength, 0])
				circle(d=3mmHoleDia);

			// Rear outer hole
			translate([0, -BasePlateBackArmLength, 0])
				circle(d=3mmHoleDia);

			
			// Leg Mounting holes
			for (i=[0, 1])
			mirror([i, 0, 0])
			translate([18, -55, 0])
				circle(d=3mmHoleDia);
			for (i=[0, 1])
			mirror([i, 0, 0])
			translate([18, 55, 0])
				circle(d=3mmHoleDia);
			translate([0, 55, 0])
				circle(d=3mmHoleDia);

			// Round off sides
			for (i=[0,1])
				mirror([i, 0, 0])
				translate([215, -110])
					circle(r=200);

			// Round off front
			//translate([0, 175])
			//	circle(r=140);

			// Central Hole
			circle(r=8);
		}

		// Leg mount holes nut insets
		for (i=[0, 1])
		mirror([i, 0, 0])
		translate([18, 55, 2.5])
			cylinder(d=6.3, h=3, $fn=6);
	}

	// Arm grips
	for (i=[0,1])
	mirror([i, 0, 0]) {
		// Rear arm gripper
		translate([ArmDia/2, -BasePlateBackArmLength + 10, 0])
			cube([4, BasePlateBackArmLength - 16, 10]);
		rotate([0, 0, 30])

		// Front arm stops
		translate([6, -ArmDia/2 - 4, 0])
			cube([BasePlateFrontArmLength - 25, 4 , 10]);
	}
}