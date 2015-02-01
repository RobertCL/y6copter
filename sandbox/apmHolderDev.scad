include <../config/config.scad>

ApmHolder();
translate([0, 0, 4.2+5])
    ApmHolder_Top();

translate([0, 0, 4.5])
    apm();

color(Level2PlasticColor)
translate([2.8, -.8, 22.6])
    GpsLowerPlate();
    
color(Level2PlasticColor)
translate([2.8, -.8, 22.6+3.5+2.5+2])
    GpsUpperPlate();