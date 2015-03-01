include <../config/config.scad>

MinimFpvHolder();

color(Level2PlasticColor)
translate([-2Perim, -2Perim, 20])
    Minim_Lid();
    
    
*rotate([180, 0, 0])
    Minim_Lid();