BasePlateFrontArmLength = 60;
BasePlateBackArmLength = 100;

module BasePlate()
{
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

		// Round off sides
		for (i=[0,1])
			mirror([i, 0, 0])
			translate([215, -110])
				circle(r=200);

		// Round off front
		translate([0, 175])
			circle(r=140);

		// Central Hole
		circle(r=8);
	}

	// Rear arm grippers
	for (i=[0,1])
	mirror([i,0,0])
	translate([ArmDia/2, -BasePlateBackArmLength + 10, 0])
		cube([4, BasePlateBackArmLength - 30, 10]);

	// Front arm grippers
	for(ang = [30, 150])
	rotate([0, 0, ang])
	for (i=[0,1])
	mirror([0,i,0])
	translate([20, -ArmDia/2 - 4, 0])
		cube([BasePlateFrontArmLength - 30, 4 , 10]);


}