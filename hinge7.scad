include <parameters.scad>

h7_base_x = 72.0;
h7_base_y = 15.4;
h7_base_z = 34.5;

h7_pivot_x = 27.0;
h7_pivot_y = h7_pivot_x/2;
h7_pivot_z = 17.75;

h7_bearing_shoulder = 1.25; 
h7_bearing_shoulder_h = 1.0; 

h7_camera_mount_radius = 13.5;
h7_scope_out_radius = 5.5;
h7_scope_hole_radius = 2.5;

h7_main_rod_heigth = 17.5;
h7_buffer = 0.01;

module slot()
{
	union()
	{
		
		cube([slot_depth,slot_width,slot_heigth]);

		translate([0,slot_width/2,slot_heigth])
			rotate(a=90, v=[0,1,0])
				cylinder(r=slot_width/2, h=slot_depth, $fs=0.5);
	}
}

module bolt_3_8_head() 
{ 
	linear_extrude(height=bolt_3_8_head_thickness)
		circle(r=bolt_3_8_head_radius, $fn = 6);
}

module hinge7()
{
difference()
{
	// Piece square stock
	union()
	{
		cube([h7_base_x,h7_base_y,h7_base_z]);
	
		translate([h7_base_x-h7_pivot_x,-1*h7_pivot_y,0])
			cube([h7_pivot_x,h7_pivot_y,h7_pivot_z]);
	
		translate([h7_base_x-(h7_pivot_x/2),-1*h7_pivot_y,0])
			cylinder(r=h7_pivot_y, h=h7_pivot_z);

		translate([h7_camera_mount_radius,h7_base_y, h7_base_z])
			rotate(a=90, v=[1,0,0])
				cylinder(r=h7_camera_mount_radius, h=h7_base_y);

		translate([h7_base_x-h7_pivot_x,0,0])
			cylinder(r=h7_scope_out_radius, h=h7_base_z+h7_camera_mount_radius, $fn=36);
	}

	// Top bearing hole
	translate([h7_base_x-(h7_pivot_x/2),-1*h7_pivot_y,h7_pivot_z-bearing_thickness])
		cylinder(r=bearing_out_radius, h=bearing_thickness);

	// Bottom bearing hole
	translate([h7_base_x-(h7_pivot_x/2),-1*h7_pivot_y,0])
		cylinder(r=bearing_out_radius, h=bearing_thickness);

	// Bearing shoulder center hole
	translate([h7_base_x-(h7_pivot_x/2),-1*h7_pivot_y,0])
		cylinder(r=bearing_out_radius-h7_bearing_shoulder, h=h7_pivot_z);

	// Bearing shoulder chamfer
	translate([h7_base_x-(h7_pivot_x/2),-1*h7_pivot_y,bearing_thickness])
		cylinder(r1=bearing_out_radius, r2=bearing_out_radius-h7_bearing_shoulder, h=h7_bearing_shoulder_h);

	// Main rod hole
	translate([-1*h7_buffer,t_rod_out_radius+3,h7_main_rod_heigth])
		rotate(a=90, v=[0,1,0])
			cylinder(r=t_rod_out_radius, h=h7_base_x+2*h7_buffer);

	// 3/8" nut hole 
	translate([h7_camera_mount_radius,bolt_3_8_head_thickness, h7_base_z])
		rotate(a=90, v=[1,0,0])
			rotate(a=30, v=[0,0,1])
				bolt_3_8_head();

	// Tripod 3/8" rod hole
	translate([h7_camera_mount_radius,h7_base_y, h7_base_z])
		rotate(a=90, v=[1,0,0])
			cylinder(r=t_rod_out_radius+0.2, h=h7_base_y);	

	translate([h7_base_x-h7_pivot_x,0,0])
		cylinder(r=h7_scope_hole_radius, h=h7_base_z+h7_camera_mount_radius, $fn=36);
}
}

//hinge7();


