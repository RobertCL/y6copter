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
			for (i=[0, 1], j=[0, 1])
			mirror([0, j, 0])
			mirror([i, 0, 0])
			translate([18, -55, 0])
				circle(d=3mmHoleDia);

			// RC Receiver Zip Tie Holes
			for (i=[0, 1])
			mirror([i, 0, 0])
			translate([rcReceiver_width/2 + 3, 40, 0])
				square([3, 6]);

			// Round off sides
			for (i=[0,1])
				mirror([i, 0, 0])
				translate([215, -110])
					circle(r=200, $fn=100);

			// Central Hole
			circle(r=8);

			// Weight saving / random zip tie connection points
			for (i=[0,1])
			mirror([i, 0, 0]) {
				// Rear points
				translate([ArmDia/2 + 6, -BasePlateBackArmLength + 55, 0])
					square([3, BasePlateBackArmLength - 65]);
				translate([ArmDia/2 + 16, -BasePlateBackArmLength + 75, 0])
					square([3, BasePlateBackArmLength - 80]);
				translate([ArmDia/2 + 26, -BasePlateBackArmLength + 90, 0])
					square([3, BasePlateBackArmLength - 90]);

				// Front points
				translate([ArmDia/2 + 16, 37, 0])
					square([3, 25]);
				translate([ArmDia/2 + 26, 43, 0])
					square([3, 10]);
			}
		}

		// Leg mount holes insets
		for (i=[0, 1], j=[0, 1])
		mirror([0, j, 0])
		mirror([i, 0, 0])
		translate([18, 55, 4])
			cylinder(d=6, h=1+eta);
	}

	// Arm grips
	for (i=[0,1])
	mirror([i, 0, 0]) {
		// Rear arm gripper
		translate([ArmDia/2, -BasePlateBackArmLength + 10, 0])
			cube([4, BasePlateBackArmLength - 16, 10]);
		
		// Front arm stops
		rotate([0, 0, 30])
		translate([6, -ArmDia/2 - 4, 0])
			cube([BasePlateFrontArmLength - 8, 4, 10]);

		rotate([0, 0, 30])
		translate([29, ArmDia/2, 0])
			cube([BasePlateFrontArmLength - 21, 4, 10]);

	}

	// RC Receiver grips
	for (i=[0, 1])
	mirror([i, 0, 0])
	translate([rcReceiver_width/2, 27, 0])
		cube([3, 23, 7]);
	translate([-rcReceiver_width/2 + 5, 75, 0])
		cube([rcReceiver_width -10, 3, 7]);

}