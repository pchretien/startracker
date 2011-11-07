// Ball joint in SCAD by Erik de Bruijn
// Based on a design by Makerblock ( http://makerblock.com/2010/03/blender-help/ )
size=5; // size of the ball joint
joint_spacing =0.1; // some space between them?
joint_thickness = 2; // thickness of the arms
joint_arms = 4; // how many arms do you want?
arm_width = 10; // actually: how much is removed from the arms Larger values will remove more

//render settings
$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice

print();

module print()
{
	translate([8,6,size+12]) ball();
	translate([0,0,15]) rotate([0,180,0]) joint();	
}

module ball()
{
	sphere(r=size);
	translate([0,0,-size-4]) cylinder(r1=6,r2=3,h=6);

	difference()
	{
		translate([0,0,-size-12]) cylinder(r=6,h=8);
		translate([0,0,-size-12]) cylinder(r=3.2,h=8);
	}
}

module joint()
{
	difference()
	{
		cube([20.0,30.0,15.0]);
		translate([10,-1,7.5]) rotate([-90,0,0]) cylinder(r=4.75,h=40.0);
	}
	difference()
	{
		translate([0,10,-13]) cube([20.0,20.0,15.0]);
		translate([10,20,-11.5]) sphere(r=size+joint_spacing);
		translate([9,-1,-13]) cube([2,40,2]);
		translate([21,19,-13]) rotate([0,0,90]) cube([2,40,2]);
	}

}