include <parameters.scad>

bloc_length = 45;
bloc_width = 30;
bloc_heigth = 10;
bloc_y = 18;

nut_1_4_shoulder = 2.0;
bearing_shoulder = 2.0;

module bearing_608()
{
	cylinder(h=bearing_thickness,r=bearing_out_radius, $fn=36);
}

module nut_1_4() 
{ 
	linear_extrude(height=nut_1_4_thickness)
		circle(r=nut_1_4_radius, $fn = 6);
}

difference()
{
	translate([-1*bloc_width/2,-1*bloc_y,0])
		cube(size=[bloc_width,bloc_length,bloc_heigth]);

	translate([0,bearing_out_radius+1,bloc_heigth-bearing_thickness])
		bearing_608();

	translate([0,-1*(nut_1_4_radius+1),bloc_heigth-nut_1_4_thickness])
		nut_1_4();

	translate([0,bearing_out_radius+1,0])
		cylinder(h=bloc_heigth,r=bearing_out_radius-bearing_shoulder, $fn=36);

	translate([0,-1*(nut_1_4_radius+1),0])
		cylinder(h=bloc_heigth,r=nut_1_4_radius-nut_1_4_shoulder, $fn=36);
}
