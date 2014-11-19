include <../config/config.scad>




// Animate FPS=25, Steps=40



translate([0,0,5]) {
    motor();

    attach(Con_Motor_Shaft, Con_Propellor)

        rotate(a=360*$t, v=[0,0,1])
        propellor();

}

rotate(a=180, v=[1,0,0])

translate([0,0,5]) {

    motor();



    attach(Con_Motor_Shaft, Con_Propellor)



        rotate(a=360*$t, v=[0,0,1])

        propellor();

}



