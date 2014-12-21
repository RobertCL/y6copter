include <config/config.scad>

// Animate props. 0=off, 1=on
anim_props = 0;
// Fold arms? true / false
folded = false; 
// Animate folding 0=off, 1=on
anim_fold = 0;  
// Percentage by which arm folds by (0..1 = 0..100%)
foldedpc = folded ? 1 : anim_fold * $t;


Arms_Assembly(foldedpc);

translate([0,0,-5]) {
    BasePlate();

    translate([-50,-60, 5])
	rcReceiver();
    
    translate([17, -10, 15])
    rotate([0, 90, 0])
    rotate([0, 0, -90])
        3drRadio();
    
    translate([25, -40, -5])
        powerModule();
}

translate([0, 0, 21]) {
    TopPlate();
	
	translate([0, 0, 5]) {
		apm();

		translate([25, 0, 0]) {
			fpvTransmitter();

			translate([0, 0, 17])
				minimOsd();
		}
		
        // TODO: GPS
	}
}

// Legs
translate([0, -51, -8])
rotate([90, 0, 0])
    Leg();

translate([0, 59, -8])
rotate([90, 0, 0])
    Leg();

// Leg Dowels
color(WoodColor)
for (i = [0,1])
mirror([i, 0, 0])
translate([95, 100, -108])
rotate([90, 0, 0])
    cylinder(d=10, h=200);

translate([0,0,-30])
rotate(a=90, v=[0,0,1])
	battery();
