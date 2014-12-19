TopPlateFrontArmLength = 60;
TopPlateBackArmLength = 100;

module TopPlate()
{
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
				circle(r=200);

		// Round off front
		//translate([0, 175])
		//	circle(r=140);

		// Central Hole
		circle(r=8);
	}
}