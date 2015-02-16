include <../config/config.scad>

OtherParts=true;

color(Level2PlasticColor)
BatteryHolderPlate();

if (OtherParts) {
    
    translate([25/2, -47+15+3, 11])
    rotate([0, 180, 0])
    rotate([0, 0, -90])
        powerModule();

    translate([0, -20, -battery_height/2])
    rotate([0, 0, 90])
        battery();


    // Legs
    union() {
    translate([0, -51, 13])
    rotate([90, 0, 0])
        Leg();

    translate([0, 59, 13])
    rotate([90, 0, 0])
        Leg();
    }
}