include <parameters.scad>

hdm_base_x = 43.0;
hdm_base_y = 53.0;
hdm_base_z = 15.4;
hdm_curve_radius = 40;

hdm_base_in_x = 30;
hdm_base_in_y = 33;

hdm_side_holes_y = 7.7;
hdm_side_holes_radius = 4.1;

hdm_buffer = 0.01;

module head_down_motor()
{
difference()
{
	// Piece stock
	union()
	{
		intersection()
		{
			translate([-1*(hdm_base_x/2),0,0])
				cube([hdm_base_x,hdm_base_y,hdm_base_z]);

			translate([0,hdm_base_y-hdm_curve_radius,0])
				cylinder(r=hdm_curve_radius, h=hdm_base_z, $fn=18);
		}			

		translate([-1*(hdm_base_x/2),0,0])
			cube([hdm_base_x,top_width,top_height]);		
	}	

	translate([-1*(hdm_base_in_x/2),0,0])
		cube([hdm_base_in_x,hdm_base_in_y,hdm_base_z]);

	translate([0,hdm_base_y, hdm_base_z/2])
		rotate(a=90, v=[1,0,0])
			cylinder(r=t_rod_out_radius, h=hdm_base_y-hdm_buffer);

	translate([-1*(hdm_base_x/2)-hdm_buffer,hdm_side_holes_y, hdm_base_z/2])
		rotate(a=90, v=[0,1,0])
			cylinder(r=t_rod_out_radius, h=hdm_base_x+2*hdm_buffer);
}
}