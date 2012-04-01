down_radius = 2.75;
down_heigth = 12;
up_radius = 3.4;
up_heigth = 12;
out_radius = 8.5;
slot_width = 6;
slot_depth = 2.75;
slot_offset = 3.5;
slot_bottom = 1;
bolt_radius = 1.75;
bolt_location = 5;


difference()
{
	// Coupling body
	cylinder(r=out_radius, h=up_heigth+down_heigth, $fn=36);
	
	// Bottom hole
	cylinder(r=down_radius, h=down_heigth, $fn=36);

	// Top hole
	translate([0,0,down_heigth])
		cylinder(r=up_radius, h=up_heigth, $fn=36);

	// Bottom slot
	translate([slot_offset,-1*slot_width/2,0])
		cube([slot_depth,slot_width,down_heigth-slot_bottom]);

	// Top slot
	translate([slot_offset,-1*slot_width/2,down_heigth+slot_bottom])
		cube([slot_depth,slot_width,up_heigth-slot_bottom]);

	// Bottom bolt hole
	translate([0,0,bolt_location])
		rotate(a=90, v=[0,1,0])
			rotate(a=180, v=[0,0,1])
				cylinder(r=bolt_radius, h=1.25*out_radius);

	// Top bolt hole
	translate([0,0,down_heigth+up_heigth-bolt_location])
		rotate(a=90, v=[0,1,0])
			rotate(a=180, v=[0,0,1])
				cylinder(r=bolt_radius, h=1.25*out_radius);
}


