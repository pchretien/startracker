
w_wheel_heigth = 4;
w_wheel_radius = 25;
w_wheel_shaft_radius = 3.3;
w_wheel_holes_radius = 8;

w_handle_length = 20;
w_handle_width = 4;
w_handle_knob_radius = 5;

w_offset = (w_wheel_radius-w_wheel_shaft_radius)/2 + w_wheel_shaft_radius;

module wheel()
{
	union()
	{
		translate([w_wheel_radius-1,-1*w_handle_width/2,0])
			cube([w_handle_length,w_handle_width,w_wheel_heigth]);

		translate([w_wheel_radius-1+w_handle_length,0,0])
			cylinder(r=w_handle_knob_radius,h=w_wheel_heigth);

		rotate(a=45, v=[0,0,1])
		{
			difference()
			{
				cylinder(r=w_wheel_radius,h=w_wheel_heigth);
				cylinder(r=w_wheel_shaft_radius,h=w_wheel_heigth);
				translate([w_offset,0,0])
					cylinder(r=w_wheel_holes_radius,h=w_wheel_heigth);
				translate([-1*w_offset,0,0])
					cylinder(r=w_wheel_holes_radius,h=w_wheel_heigth);
				translate([0,w_offset,0])
					cylinder(r=w_wheel_holes_radius,h=w_wheel_heigth);
				translate([0,-1*w_offset,0])
					cylinder(r=w_wheel_holes_radius,h=w_wheel_heigth);
			}
		}
	}
}

//wheel();