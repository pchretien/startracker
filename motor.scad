include <parameters.scad>

base_x = 42.0;
base_y = 25.0;
base_z = 5.5;
curve_radius = 30;

top_width = 6.25;
top_height = 20;

screw_x = 15.5;		// Relative to the motor head hole center
screw_z = 15.5;		// Relative to the motor head hole center
screw_radius = 1.75;
screw_head_radius = 3.25;
screw_head_depth = 2.5;

pin_y = 3;
pin_height = 3;
pin_radius = 4.5; // Increased size but not yet printed

motor_head_z = 26.5;
motor_head_radius = 11.5;

buffer = 0.01;

module motor_half_mount()
{
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
					cylinder(r=curve_radius, h=base_z);
			}			

			translate([-1*(base_x/2),0,0])
				cube([base_x,top_width,top_height]);

			translate([0,base_y-pin_y-pin_radius,base_z])
				cylinder(r=pin_radius, h=pin_height, $fn=36);
		}	

		// Motor head hole
		translate([0,top_width+buffer,motor_head_z])
			rotate(a=90, v=[1,0,0])
				cylinder(r=motor_head_radius, h=top_width+2*buffer, $fn=36);

		// Screw holes
		translate([screw_x,top_width+buffer,motor_head_z-screw_z])
			rotate(a=90, v=[1,0,0])
				cylinder(r=screw_radius, h=top_width+2*buffer, $fn=36);

		translate([-1*screw_x,top_width+buffer,motor_head_z-screw_z])
			rotate(a=90, v=[1,0,0])
				cylinder(r=screw_radius, h=top_width+2*buffer, $fn=36);

		// Screw head pockets
		translate([screw_x,top_width+buffer,motor_head_z-screw_z])
			rotate(a=90, v=[1,0,0])
				cylinder(r=screw_head_radius, h=screw_head_depth, $fn=36);

		translate([-1*screw_x,top_width+buffer,motor_head_z-screw_z])
			rotate(a=90, v=[1,0,0])
				cylinder(r=screw_head_radius, h=screw_head_depth, $fn=36);
	}
}

translate([0,3,0])
	motor_half_mount();

translate([0,-3,0])
	rotate(a=180, v=[0,0,1])
		motor_half_mount();



