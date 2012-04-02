include <parameters.scad>

h6_base_x = 47.0;
h6_base_y = 29.4;
h6_base_z = 36.5;

h6_pivot_x = 27.0;
h6_pivot_y = h6_pivot_x/2;
h6_pivot_z = 17.75;

h6_bearing_shoulder = 1.25; 
h6_bearing_shoulder_h = 1.0; 

h6_slot_width = 7;
h6_slot_heigth = 17;
h6_slot_depth = 33;

h6_slot_y = 15.6;
h6_slot_z = 8;

h6_main_rod_heigth = 18.25;

h6_buffer = 0.01;

module slot()
{
	union()
	{
		
		cube([h6_slot_depth,h6_slot_width,h6_slot_heigth]);

		translate([0,h6_slot_width/2,h6_slot_heigth])
			rotate(a=90, v=[0,1,0])
				cylinder(r=h6_slot_width/2, h=h6_slot_depth, $fs=0.5);
	}
}

module nut_1_4() 
{ 
	linear_extrude(height=nut_1_4_thickness)
		circle(r=nut_1_4_radius, $fn = 6);
}

module hinge6()
{
difference()
{
	// Piece square stock
	union()
	{
		cube([h6_base_x,h6_base_y,h6_base_z]);
	
		translate([h6_base_x-h6_pivot_x,-1*h6_pivot_y,0])
			cube([h6_pivot_x,h6_pivot_y,h6_pivot_z]);
	
		translate([h6_base_x-(h6_pivot_x/2),-1*h6_pivot_y,0])
			cylinder(r=h6_pivot_y, h=h6_pivot_z);
	}

	// Top bearing hole
	translate([h6_base_x-(h6_pivot_x/2),-1*h6_pivot_y,h6_pivot_z-bearing_thickness])
		cylinder(r=bearing_out_radius, h=bearing_thickness);

	// Bottom bearing hole
	translate([h6_base_x-(h6_pivot_x/2),-1*h6_pivot_y,0])
		cylinder(r=bearing_out_radius, h=bearing_thickness);

	// Bearing shoulder center hole
	translate([h6_base_x-(h6_pivot_x/2),-1*h6_pivot_y,0])
		cylinder(r=bearing_out_radius-h6_bearing_shoulder, h=h6_pivot_z);

	// Bearing shoulder chamfer
	translate([h6_base_x-(h6_pivot_x/2),-1*h6_pivot_y,bearing_thickness])
		cylinder(r1=bearing_out_radius, r2=bearing_out_radius-h6_bearing_shoulder, h=h6_bearing_shoulder_h);

	// Main rod hole
	translate([-1*h6_buffer,t_rod_out_radius+3,h6_main_rod_heigth])
		rotate(a=90, v=[0,1,0])
			cylinder(r=t_rod_out_radius, h=h6_base_x+2*h6_buffer);

	// Nut slot
	translate([0,h6_slot_y,h6_slot_z])
		slot();	

	// 1/4" nut hole
	translate([h6_base_x/2,h6_slot_width+h6_slot_y+nut_1_4_thickness-0.1, h6_base_z/2])
		rotate(a=90, v=[1,0,0])
			rotate(a=30, v=[0,0,1])
				nut_1_4();

	// Tripod 1/4" rod hole
	translate([h6_base_x/2,h6_base_y+h6_buffer, h6_base_z/2])
		rotate(a=90, v=[1,0,0])
			cylinder(r=3.2, h=h6_base_y-h6_slot_y-h6_slot_width+2*h6_buffer);
}
}
