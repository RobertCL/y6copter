module PcbPins(numPins = 4, a = 0, spacers = true)
{
    // Standard PCB header pin
    pcbholepitch        = 2.54;         // spacing of PCB holes
    holediameter        = 1.25;         // diameter of PCB hole
    pinheight           =   11;         // length of PCB pins
    pinoffset           =    3;         // offset of PCB pins
    pinwidth            = 0.63;         // width/gauge of PCB pins
    spacerwidth         = 2.25;         // height of breakaway pin frame
    spacerheight        = 2.25;         // height of breakaway pin frame

	rotate(a = a)
	for (i = [0 : numPins - 1]) {
		translate([i * pcbholepitch, 0, 0]) {
			// Header Pins
			color("white")
			translate([0, 0, -pinoffset])
			linear_extrude(pinheight)
				square(pinwidth, center = true);

			if (spacers) {
				// Pin Spacers
				color(Grey20)
				linear_extrude(spacerheight)
					square(spacerwidth, center = true);

				// Break-Away Material
				color(Grey20)
				translate([pcbholepitch/2, 0, 0])
				linear_extrude(spacerheight)
					square([pcbholepitch - spacerwidth, spacerwidth * 0.85], center = true);
			}
		}
	}
}