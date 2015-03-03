include <../config/config.scad>

MinimFpvHolder();

color(Level2PlasticColor)
translate([-2Perim, -2Perim, 30])
    Minim_Lid();
    
translate([-40, 0, 0])
rotate([180, 0, 0])
    Minim_Lid();