include <parameters.scad>

base_x = 72.0;
base_y = 15.4;
base_z = 34.5;

pivot_x = 27.0;
pivot_y = pivot_x/2;
pivot_z = 17.75;

bearing_shoulder = 1.25; 
bearing_shoulder_h = 1.0; 

camera_mount_radius = 13.5;
scope_out_radius = 5.5;
scope_hole_radius = 2.5;

main_rod_heigth = 17.5;
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

module bolt_3_8_head() 
{ 
	linear_extrude(height=bolt_3_8_head_thickness)
		circle(r=bolt_3_8_head_radius, $fn = 6);
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

		translate([camera_mount_radius,base_y, base_z])
			rotate(a=90, v=[1,0,0])
				cylinder(r=camera_mount_radius, h=base_y);

		translate([base_x-pivot_x,0,0])
			cylinder(r=scope_out_radius, h=base_z+camera_mount_radius, $fn=36);
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
	translate([-1*buffer,t_rod_out_radius+3,main_rod_heigth])
		rotate(a=90, v=[0,1,0])
			cylinder(r=t_rod_out_radius, h=base_x+2*buffer);

	// 3/8" nut hole 
	translate([camera_mount_radius,bolt_3_8_head_thickness, base_z])
		rotate(a=90, v=[1,0,0])
			rotate(a=30, v=[0,0,1])
				bolt_3_8_head();

	// Tripod 3/8" rod hole
	translate([camera_mount_radius,base_y, base_z])
		rotate(a=90, v=[1,0,0])
			cylinder(r=t_rod_out_radius+0.2, h=base_y);	

	translate([base_x-pivot_x,0,0])
		cylinder(r=scope_hole_radius, h=base_z+camera_mount_radius, $fn=36);
}



