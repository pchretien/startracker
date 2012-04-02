include <parameters.scad>

hd_base_x = 30.0;
hd_base_y = 50.0;
hd_base_z = 15.4;
curve_radius = 40;

hd_base_in_x = 20;
hd_base_in_y = 15;
hd_base_in_front_x = 14;
hd_base_in_off_y = 15;

hd_side_holes_y = 7.7;
hd_side_holes_radius = 5.1;
hd_side_holes_length = 21;

hd_slot_x = 19;
hd_slot_y = 10.2;
hd_slot_z = 7.7;

hd_buffer = 0.01;

module head_down()
{
difference()
{
	// Piece stock
	union()
	{
		intersection()
		{
			translate([-1*(hd_base_x/2),0,0])
				cube([hd_base_x,hd_base_y,hd_base_z]);

			translate([0,hd_base_y-curve_radius,0])
				cylinder(r=curve_radius, h=hd_base_z, $fn=18);
		}			

		translate([-1*(hd_base_x/2),0,0])
			cube([hd_base_x,top_width,top_height]);		
	}	

	translate([-1*(hd_base_in_x/2),hd_base_in_off_y,0])
		cube([hd_base_in_x,hd_base_in_y,hd_base_z]);

	translate([-1*(hd_base_in_front_x/2),0,0])
		cube([hd_base_in_front_x,hd_base_in_y,hd_base_z]);

	translate([-1*(hd_slot_x/2),hd_side_holes_y-(hd_slot_y/2),hd_base_z-hd_slot_z])
		cube([hd_slot_x,hd_slot_y,hd_slot_z]);

	translate([0,hd_base_y, hd_base_z/2])
		rotate(a=90, v=[1,0,0])
			cylinder(r=t_rod_out_radius, h=hd_base_y-hd_buffer, $fn=36);

	translate([-1*(hd_side_holes_length/2),hd_side_holes_y, hd_base_z/2])
		rotate(a=90, v=[0,1,0])
			cylinder(r=hd_side_holes_radius, h=hd_side_holes_length, $fn=36);
}
}

//head_down();