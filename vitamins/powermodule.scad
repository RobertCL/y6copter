
module powerModule()
{
	// Board
	color(PcbColor)
		cube([21.5, 25, 1.6]);

	// Connector to APM
	translate([2, 6.5, -3.2])
	rotate(a=90, v=[1, 0, 0])
		DF13Connector(6);

	// Power filter
	color(Grey20)
	translate([0.3, 4, 1.6])
		cube([10, 10, 4]);

	// Cables
	color(Grey20)
	translate([21.5-2, 3, 3.6])
	rotate(a=90, v=[1, 0, 0])
		cylinder(r=4/2, h=15);
	color(Grey20)
	translate([21.5-2, 15+25-3, 3.6])
	rotate(a=90, v=[1, 0, 0])
		cylinder(r=4/2, h=15);
	color("Red")
	translate([21.5-2, 3, -2])
	rotate(a=90, v=[1, 0, 0])
		cylinder(r=4/2, h=15);
	color("Red")
	translate([21.5-2, 15+25-3, -2])
	rotate(a=90, v=[1, 0, 0])
		cylinder(r=4/2, h=15);
}