
wheel_heigth = 4;
wheel_radius = 25;
wheel_shaft_radius = 3.1;
wheel_holes_radius = 8;

handle_length = 20;
handle_width = 4;
handle_knob_radius = 5;

offset = (wheel_radius-wheel_shaft_radius)/2 + wheel_shaft_radius;

union()
{
	translate([wheel_radius-1,-1*handle_width/2,0])
		cube([handle_length,handle_width,wheel_heigth]);

	translate([wheel_radius-1+handle_length,0,0])
		cylinder(r=handle_knob_radius,h=wheel_heigth);

	rotate(a=45, v=[0,0,1])
	{
		difference()
		{
			cylinder(r=wheel_radius,h=wheel_heigth);
			cylinder(r=wheel_shaft_radius,h=wheel_heigth);
			translate([offset,0,0])
				cylinder(r=wheel_holes_radius,h=wheel_heigth);
			translate([-1*offset,0,0])
				cylinder(r=wheel_holes_radius,h=wheel_heigth);
			translate([0,offset,0])
				cylinder(r=wheel_holes_radius,h=wheel_heigth);
			translate([0,-1*offset,0])
				cylinder(r=wheel_holes_radius,h=wheel_heigth);
		}
	}
}