
center_length = 16;
center_width = 14;
ends_length = 8;
pivot_radius = 4.5;
pivot_length = 2.5;
shaft_radius = 3.25;

ends_width = 2*pivot_radius;
center_thickness = pivot_radius*2;

difference()
{
	union()
	{
		translate([-1*center_length/2,-1*center_width/2,0])
			cube([center_length,center_width,center_thickness]);

		translate([-1*center_length,-1*ends_width/2,0])
			cube([ends_length,ends_width,center_thickness]);

		translate([center_length/2,-1*ends_width/2,0])
			cube([ends_length,ends_width,center_thickness]);

		translate([center_length/2+ends_length,0,pivot_radius])
			rotate(a=90, v=[0,1,0])
				cylinder(r=pivot_radius, h=pivot_length, $fn=36);

		translate([-1*(center_length/2+ends_length+pivot_length),0,pivot_radius])
			rotate(a=90, v=[0,1,0])
				cylinder(r=pivot_radius, h=pivot_length, $fn=36);
	}

	cylinder(r=shaft_radius, h=center_thickness, $fn=36);
}