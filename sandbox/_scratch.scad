include <../config/config.scad>

BatteryHolderUpperPlate();


translate([0, 0, -battery_height/2])

rotate([0, 0, 90])

    battery();