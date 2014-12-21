module Motor_Assembly()
{
	translate([0,0,10.5]) {
		motor();

		attach(Con_Motor_Shaft, Con_Propellor)
			rotate(a=360*$t*anim_props, v=[0,0,1])
				propellor();
	}

	rotate(a=180, v=[1,0,0])
	translate([0,0,10.5]) {
		motor();
		
		attach(Con_Motor_Shaft, Con_Propellor)
			rotate(a=360*$t*anim_props, v=[0,0,1])
			propellor();
	}
}