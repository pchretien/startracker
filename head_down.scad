include <parameters.scad>

base_x = 30.0;
base_y = 50.0;
base_z = 15.4;
curve_radius = 40;

base_in_x = 20;
base_in_y = 15;
base_in_front_x = 14;
base_in_off_y = 15;

side_holes_y = 7.7;
side_holes_radius = 5.1;
side_holes_length = 21;

slot_x = 19;
slot_y = 10.2;
slot_z = 7.7;

buffer = 0.01;

difference()
{
	// Piece stock
	union()
	{
		intersection()
		{
			translate([-1*(base_x/2),0,0])
				cube([base_x,base_y,base_z]);

			translate([0,base_y-curve_radius,0])
				cylinder(r=curve_radius, h=base_z, $fn=18);
		}			

		translate([-1*(base_x/2),0,0])
			cube([base_x,top_width,top_height]);		
	}	

	translate([-1*(base_in_x/2),base_in_off_y,0])
		cube([base_in_x,base_in_y,base_z]);

	translate([-1*(base_in_front_x/2),0,0])
		cube([base_in_front_x,base_in_y,base_z]);

	translate([-1*(slot_x/2),side_holes_y-(slot_y/2),base_z-slot_z])
		cube([slot_x,slot_y,slot_z]);

	translate([0,base_y, base_z/2])
		rotate(a=90, v=[1,0,0])
			cylinder(r=t_rod_out_radius, h=base_y-buffer, $fn=36);

	translate([-1*(side_holes_length/2),side_holes_y, base_z/2])
		rotate(a=90, v=[0,1,0])
			cylinder(r=side_holes_radius, h=side_holes_length, $fn=36);
}


