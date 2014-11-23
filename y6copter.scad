include <config/config.scad>


for (ang = [30, -90, 150])
rotate(a= ang, v=[0,0,1]) {

	translate([0,-5,0]) {
		color(WoodColor)
			cube([300, 10, 10]);

		translate([285, 5, 5])
			Motor_Assembly();
	}
}

translate([0,0,15]) {
	apm();

	translate([3,-120])
		3drRadio_Assembly();

	translate([-3,-70])
	rotate(a=180, v=[0,0,1])
		rcReceiver();

}

translate([0,0,-20])
rotate(a=90, v=[0,0,1])
	battery();
