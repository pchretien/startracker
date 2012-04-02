c_down_radius = 2.75;
c_down_heigth = 12;
c_up_radius = 3.4;
c_up_heigth = 12;
c_out_radius = 8.5;
c_slot_width = 6;
c_slot_depth = 2.75;
c_slot_offset = 3.5;
c_slot_bottom = 1;
c_bolt_radius = 1.75;
c_bolt_location = 5;

module coupling()
{
difference()
{
	// Coupling body
	cylinder(r=c_out_radius, h=c_up_heigth+c_down_heigth, $fn=36);
	
	// Bottom hole
	cylinder(r=c_down_radius, h=c_down_heigth, $fn=36);

	// Top hole
	translate([0,0,c_down_heigth])
		cylinder(r=c_up_radius, h=c_up_heigth, $fn=36);

	// Bottom slot
	translate([c_slot_offset,-1*c_slot_width/2,0])
		cube([c_slot_depth,c_slot_width,c_down_heigth-c_slot_bottom]);

	// Top slot
	translate([c_slot_offset,-1*c_slot_width/2,c_down_heigth+c_slot_bottom])
		cube([c_slot_depth,c_slot_width,c_up_heigth-c_slot_bottom]);

	// Bottom bolt hole
	translate([0,0,c_bolt_location])
		rotate(a=90, v=[0,1,0])
			rotate(a=180, v=[0,0,1])
				cylinder(r=c_bolt_radius, h=1.25*c_out_radius);

	// Top bolt hole
	translate([0,0,c_down_heigth+c_up_heigth-c_bolt_location])
		rotate(a=90, v=[0,1,0])
			rotate(a=180, v=[0,0,1])
				cylinder(r=c_bolt_radius, h=1.25*c_out_radius);
}
}

//coupling();