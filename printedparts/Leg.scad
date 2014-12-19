
module Leg()
{
	ro = 75;
	ri = 65;
	rd = ro - ri;
	roff = 69;

	difference() {

		// Leg arches
		linear_extrude(8) {
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