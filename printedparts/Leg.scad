
module Leg()
{
	ro = 100;
	ri = 95;
	rd = ro - ri;
	roff = 94;

	difference() {

		// Leg arches
		linear_extrude(8) {
			square([50, 5], center=true);
			translate([0, -roff, 0])
			difference() {
				circle(r=ro);
        
				circle(r=ri);
        
				translate([-ro, -ro, 0])
					square([ro * 2, ro]);
				translate([-ro, roff + 3, 0])
					square([ro * 2, 20]);
			}
		}

		// Mounting holes
		for (i=[0, 1])
		mirror([i, 0, 0])
		translate([18, 4, 4])
		rotate([90, 0, 0])
			cylinder(d=3mmHoleDia, h=12);
		translate([0, 4, 4])
		rotate([90, 0, 0])
			cylinder(d=3mmHoleDia, h=12);
	}

	// Dowel holes
	for(i = [0, 1])
	mirror([i,0,0])
	linear_extrude(16)
	translate([ri + rd/2, -ro, 0])
	difference() {
		circle(d=16);
		circle(d=10);
	}
}