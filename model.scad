$fn=100;

grid_path = "grid_fin_-_big-90x126mm-std.stl";

holder_outer_diameter=107;
holder_lenght=10;

cylinder_outer_diameter=105;
cylinder_inner_diameter=95;
cylinder_lenght=90;

cube_remove_back_size = max(cylinder_lenght, cylinder_outer_diameter, holder_outer_diameter);

difference(){
    difference(){
        cylinder(h=cylinder_lenght, d=cylinder_outer_diameter, center=true);
        translate([45,0,0])
            cube(cube_remove_back_size, center=true);
    };
    cylinder(h=cylinder_lenght, d=cylinder_inner_diameter, center=true);
}



module holder(position){
    difference(){
        difference(){
            translate([0,0,position])
                cylinder(h=holder_lenght, d=holder_outer_diameter, center=true);
            translate([45,0,0])
                cube(cube_remove_back_size, center=true);
        };
        cylinder(h=cylinder_lenght, d=cylinder_inner_diameter, center=true);
    }
}

holder((cylinder_lenght/2)-(holder_lenght/2));
holder(-(cylinder_lenght/2)+(holder_lenght/2));


difference(){
    translate([-150,0,15])
        rotate([90,0,90])
            import(grid_path);
    cylinder(h=cylinder_lenght, d=cylinder_inner_diameter, center=true);
 }