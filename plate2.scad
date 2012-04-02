include<hinge7.scad>
include <wheel.scad>
include <motor.scad>

//cube(center=true, [100,100,0.001]);

translate([-25,30,0])
	hinge7();

translate([22,-22,0])
	rotate(a=200,v=[0,0,1])
		wheel();

translate([-27,0,0])
	rotate(a=0,v=[0,0,1])
		motor();