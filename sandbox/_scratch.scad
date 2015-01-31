include <../config/config.scad>

BatteryHolderUpperPlate();

translate([0, 0, -Battery_Height/2])
rotate([0, 0, 90])
    battery();