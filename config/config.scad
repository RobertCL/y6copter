//
// Config
//

// Global OpenSCAD variables - short-hand!
// 
eta = 0.01;                     // small fudge factor to stop CSG barfing on coincident faces.
$fa = 5;
$fs = 0.5;


// Printer specific parameters
//
Perim = 0.4;    // perim extrusion width for 0.2 or 0.3 layer height
Layers = 0.3;
2Perim = 2*Perim;
4Perim = 4*Perim;

// short-hand
perim = Perim;
layers = Layers;
2perim = 2Perim;
4perim = 4Perim;


// Debugging

DebugConnectors = 1;  			// set to 1 to debug, set to 0 for production
DebugCoordinateFrames = 1; 		// set to 1 to debug, set to 0 for production


// Libraries
include <../utils/obiscad/vector.scad>
include <../utils/obiscad/attach.scad>
include <../utils/df13connector.scad>
include <../utils/pcbpins.scad>


// Include all other configuration files
include <colors.scad>
include <copterparameters.scad>
include <printedparts.scad>
include <vitamins.scad>
include <assemblies.scad>