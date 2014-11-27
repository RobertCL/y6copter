
module fpvTransmitter()
{
	cube([28, 44, 14]);


	color("gold")
	translate([28-6.5-2.7, 44, 1]) {
		cube([6.5, 1.5, 6.5]);

		translate([6.5/2, 1.5, 6.5/2])
		rotate(a=-90, v=[1,0,0])
			cylinder(r=5.2/2, h=8);
	}

	translate([28-6.5-2.7+6.5/2, 44+9.5 , 1+6.5/2])
		cloverleaf();
}

module cloverleaf()
{
	color("gold")
	rotate(a=-90, v=[1, 0, 0])
		cylinder(r=9/2, h=20, $fn=6);

	color(Grey20)
	translate([0, 20, 0])
	rotate(a=-90, v=[1, 0, 0])
		cylinder(r=4/2, h=14);

	color(Grey80)
	translate([0, 34, 15])
	rotate(a=90, v=[0, 1, 0])
	difference() {
		rotate_extrude()
		translate([15,0])
			circle(r=3/2);

		translate([-17, -17, -3])
			cube([34, 17, 6]);
		translate([-17, -1, -3])
			cube([17, 18, 6]);
	}

	color(Grey20)
	translate([0, 34+15, 15]) {
		cylinder(r=6/2, h=8.5);

		translate([0, 0, 8.5])
			cylinder(r1=33/2, r2=26/2, h=16);
	}
}