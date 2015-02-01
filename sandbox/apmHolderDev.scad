include <../config/config.scad>

*rotate([180, 0, 0])
    ApmHolder_Top();


ApmHolder();
translate([0, 0, 4.2+5])
    ApmHolder_Top();

translate([0, 0, 4.5])
    apm();

