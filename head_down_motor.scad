include <parameters.scad>

base_x = 42.0;
base_y = 53.0;
base_z = 15.4;
curve_radius = 40;

base_in_x = 32;
base_in_y = 33;

side_holes_y = 7.7;
side_holes_radius = 4.1;

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

	translate([-1*(base_in_x/2),0,0])
		cube([base_in_x,base_in_y,base_z]);

	translate([0,base_y, base_z/2])
		rotate(a=90, v=[1,0,0])
			cylinder(r=t_rod_out_radius, h=base_y-buffer);

	translate([-1*(base_x/2)-buffer,side_holes_y, base_z/2])
		rotate(a=90, v=[0,1,0])
			cylinder(r=t_rod_out_radius, h=base_x+2*buffer);
}


