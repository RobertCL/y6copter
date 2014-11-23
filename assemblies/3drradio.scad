
module 3drRadio_Assembly()
{
	color("red") {
		import("printedparts/GPS-RADIO_plate_v2_base.STL");

		translate([0, 46.8, 20])
		rotate(a=180, v=[1, 0, 0])
			import("printedparts/GPS-RADIO_plate_v2_lid.STL");
	}

	translate([2, 37.5, 2])
		3drRadio();
}