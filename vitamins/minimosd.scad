
module minimOsd()
{
	color(PcbColor)
		cube([18, 43.5, 1.6]);

	// Heatsink
	color("gold")
	translate([4.5, 24, 1.6]) {
		cube([10, 4.7, 1.25]);
		
		cube([1.3, 1.5, 4]);
		translate([3,0,0]) cube([1.3, 1.5, 4]);
		translate([6,0,0]) cube([1.3, 1.5, 4]);
		translate([8.7,0,0]) cube([1.3, 1.5, 4]);
		translate([0,3.2,0]) cube([1.3, 1.5, 4]);
		translate([3,3.2,0]) cube([1.3, 1.5, 4]);
		translate([6,3.2,0]) cube([1.3, 1.5, 4]);
		translate([8.7,3.2,0]) cube([1.3, 1.5, 4]);
		
	}

	// Apm Connector
	translate([2.8, 0, 4])
	rotate(a=90, v=[1, 0, 0])
		PcbPins(cols=6);

	// Video Connector
	translate([11, 43, 4.5])
	rotate(a=-90, v=[1, 0, 0])
		PcbPins(cols=3, rows=2);
}