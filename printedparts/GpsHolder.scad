gps_width = 28.5;
gps_length = 33;

module GpsLowerPlate()
{
	linear_extrude(1.5)
	difference() {
		square([gps_width, gps_length], center=true);

		translate([0, -gps_length/2 + 3mmHoleDia/2 + 1])
			gps_mount_holes();

		translate([-gps_width/2, gps_length/2 - 7])
			square([12, 7]);
	}

	translate([0, 0, 1.5])
	linear_extrude(2) {

		difference() {
			for(i=[0, 1])
			mirror([i, 0, 0])
			translate([-gps_width/2, -gps_length/2, 0])
				square([6, 6]);

			translate([0, -gps_length/2 + 3mmHoleDia/2 + 1])
				gps_mount_holes();

		}

		translate([gps_width/2 - 28.5+12, gps_length/2 - 4])
			square([28.5-12, 4]);
	}
}


module GpsUpperPlate()
{
	linear_extrude(4)
	difference() {
		square([gps_width, gps_length], center=true);

		translate([0, -gps_length/2 + 3mmHoleDia/2 + 1])
			gps_mount_holes();

		translate([0, gps_length/2 - 1.5 - 25.5/2 ,0])
		hull() {
			for (i=[0,1], j=[0,1])
			mirror([i, 0, 0])
			mirror([0, j, 0])
			translate([25.5/2-3, 25.5/2-3, 0])
				circle(r=3);
		}
	}

	translate([0, -gps_length/2 + 4.5/2, -2.5])
	linear_extrude(2.5)
	difference() {
		square([gps_width, 4.5], center=true);

		translate([0, -4.5/2 + 3mmHoleDia/2 + 1])
			gps_mount_holes();

		translate([-gps_width/2 + 14.5, -1, 0])
			square([8, 4.5]);
	}
}

module gps_mount_holes()
{
	for (i=[0, 1])
	mirror([i, 0, 0])
	translate([-23/2, 0, 0])
		circle(d=3mmHoleDia);
}