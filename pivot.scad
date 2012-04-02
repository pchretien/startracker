
p_center_length = 16;
p_center_width = 14;
p_ends_length = 7;
p_pivot_radius = 4.5;
p_pivot_length = 2.5;
p_shaft_radius = 3.5;

p_ends_width = 2*p_pivot_radius;
p_center_thickness = p_pivot_radius*2;

module pivot()
{
difference()
{
	union()
	{
		translate([-1*p_center_length/2,-1*p_center_width/2,0])
			cube([p_center_length,p_center_width,p_center_thickness]);

		translate([-1*p_center_length/2-p_ends_length,-1*p_ends_width/2,0])
			cube([p_ends_length,p_ends_width,p_center_thickness]);

		translate([p_center_length/2,-1*p_ends_width/2,0])
			cube([p_ends_length,p_ends_width,p_center_thickness]);

		translate([p_center_length/2+p_ends_length,0,p_pivot_radius])
			rotate(a=90, v=[0,1,0])
				cylinder(r=p_pivot_radius, h=p_pivot_length, $fn=36);

		translate([-1*(p_center_length/2+p_ends_length+p_pivot_length),0,p_pivot_radius])
			rotate(a=90, v=[0,1,0])
				cylinder(r=p_pivot_radius, h=p_pivot_length, $fn=36);
	}

	cylinder(r=p_shaft_radius, h=p_center_thickness, $fn=36);
}
}

//pivot();