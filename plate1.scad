include<hinge6.scad>
include <coupling.scad>
include <head_down.scad>
include <head_down_motor.scad>
include <pivot.scad>

//cube(center=true, [100,100,0.001]);

translate([0,15,0])
	hinge6();

translate([35,-30,0])
	coupling();

translate([-5,5,0])
	rotate(a=180,v=[0,0,1])
		head_down();

translate([-25,-5,0])
		head_down_motor();

translate([-35,-30,0])
	rotate(a=90,v=[0,0,1])
		pivot();

