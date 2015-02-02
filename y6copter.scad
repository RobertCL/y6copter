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
    render() BasePlate();

    translate([rcReceiver_width/2, 75, 5])
	rotate([0, 0, 180])
		rcReceiver();
}

translate([0, 0, 21]) {
    render() TopPlate();
	
	translate([0, 0, 5]) {

		translate([0, 0, 12.5]) {
			render() ApmHolder();
			translate([0, 0, 4.2])
				render() ApmHolder_Top();

			translate([0, 0, 4.5])
				apm();

			// TODO: GPS
		}

		translate([25, 0, 0]) {
			fpvTransmitter();

			translate([0, 0, 17])
				minimOsd();
		}
		
		translate([-30, 30, 0])
		rotate([0, 0, -90])
		rotate([90, 0, 0])
			3drRadio();
	}
}

// Legs
translate([0, -51, -8])
rotate([90, 0, 0])
    render() Leg();

translate([0, 59, -8])
rotate([90, 0, 0])
    render() Leg();

// Leg Dowels
color(WoodColor)
for (i = [0,1])
mirror([i, 0, 0])
translate([95, 100, -108])
rotate([90, 0, 0])
    cylinder(d=10, h=200);

// Battery Holder
translate([0,0,-21])
    render() BatteryHolderPlate();

translate([25/2, -47+15+3, 11-21])
rotate([0, 180, 0])
rotate([0, 0, -90])
    powerModule();

translate([0,0,-37])
rotate(a=90, v=[0,0,1])
	battery();
