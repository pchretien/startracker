include <parameters.scad>

base_x = 47.0;
base_y = 29.4;
base_z = 36.5;

pivot_x = 27.0;
pivot_y = pivot_x/2;
pivot_z = 17.75;

bearing_shoulder = 1.25; 
bearing_shoulder_h = 1.0; 

slot_width = 7;
slot_heigth = 17;
slot_depth = 33;

slot_y = 15.6;
slot_z = 8;

buffer = 0.01;

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

module nut_1_4() 
{ 
	linear_extrude(height=nut_1_4_thickness)
		circle(r=nut_1_4_radius, $fn = 6);
}

difference()
{
	// Piece square stock
	union()
	{
		cube([base_x,base_y,base_z]);
	
		translate([base_x-pivot_x,-1*pivot_y,0])
			cube([pivot_x,pivot_y,pivot_z]);
	
		translate([base_x-(pivot_x/2),-1*pivot_y,0])
			cylinder(r=pivot_y, h=pivot_z);
	}

	// Top bearing hole
	translate([base_x-(pivot_x/2),-1*pivot_y,pivot_z-bearing_thickness])
		cylinder(r=bearing_out_radius, h=bearing_thickness);

	// Bottom bearing hole
	translate([base_x-(pivot_x/2),-1*pivot_y,0])
		cylinder(r=bearing_out_radius, h=bearing_thickness);

	// Bearing shoulder center hole
	translate([base_x-(pivot_x/2),-1*pivot_y,0])
		cylinder(r=bearing_out_radius-bearing_shoulder, h=pivot_z);

	// Bearing shoulder chamfer
	translate([base_x-(pivot_x/2),-1*pivot_y,bearing_thickness])
		cylinder(r1=bearing_out_radius, r2=bearing_out_radius-bearing_shoulder, h=bearing_shoulder_h);

	// Main rod hole
	translate([-1*buffer,t_rod_out_radius+3,18.25])
		rotate(a=90, v=[0,1,0])
			cylinder(r=t_rod_out_radius, h=base_x+2*buffer);

	// Nut slot
	translate([0,slot_y,slot_z])
		slot();	

	// 1/4" nut hole
	translate([base_x/2,slot_width+slot_y+nut_1_4_thickness-0.1, base_z/2])
		rotate(a=90, v=[1,0,0])
			rotate(a=30, v=[0,0,1])
				nut_1_4();

	// Tripod 1/4" rod hole
	translate([base_x/2,base_y+buffer, base_z/2])
		rotate(a=90, v=[1,0,0])
			cylinder(r=3.2, h=base_y-slot_y-slot_width+2*buffer);
}



