module 3drRadio()
{
	color(PcbColor)
		cube([35, 3.75, 17]);

	color("gold")
	translate([35, -1, 0.5]) {
		cube([1.5, 6.5, 6.5]);

		translate([1.5,6.5/2,6.5/2])
		rotate(a=90, v=[0,1,0])
			cylinder(r=5.2/2, h=8);
	}

	translate([64, 2.25, 3.5])
	rotate(a=90, v=[0,0,1])
	rotate(a=-90, v=[1,0,0])
		duckAntenna();
}

module duckAntenna() {
	color(Grey20) {
	
		cylinder(r=9.5/2, h=25);
		
		rotate(a=90, v=[1, 0, 0]) {
			cylinder(r1=9.5/2, r2=8/2, h=85);
			translate([0,0,85])
				sphere(r=8/2);
		}
	}
}