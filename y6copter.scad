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

			translate([0, 0, 17.5]) {
				color(Level2PlasticColor)
				translate([2.8, -.8, 0])
					GpsLowerPlate();
    
				color(Level2PlasticColor)
				translate([2.8, -.8, 3.5+2.5+2])
					GpsUpperPlate();
			}
		}

		translate([56, 44, 0]) {
			color(Level2PlasticColor)
			rotate([0, 0, 180]) {
				MinimFpvHolder();

				translate([-2Perim, -2Perim, 30])
					Minim_Lid();
			}

			*fpvTransmitter();
			
			translate([-10, -46, 19])
			rotate([0, 90, 0])
				minimOsd();
		}
		
		translate([-25-4Perim-.25, 42-4Perim-.25, 1])
		rotate([0, 0, -90])
		rotate([90, 0, 0])
			3drRadio();

		translate([-25+2Perim, 42+2Perim, 9])
		rotate([0, 0, -180])
			RcTimerAirModuleHolder_Lid();

			
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
    cylinder(d=9, h=200);

// Battery Holder
translate([0,0,-21])
    render() BatteryHolderPlate();

translate([25/2, -47+15+3, 11-21])
rotate([0, 180, 0])
rotate([0, 0, -90])
    powerModule();

translate([0, -30, -37])
rotate(a=90, v=[0,0,1])
	battery();
