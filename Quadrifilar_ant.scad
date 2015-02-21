
//currnet values for 1700Mhz

$fn = 100;

wireD = 2;
twist_t = 270; //degrees turn. Multiples of 90
total_height = 125; //in mm

//for the large loop, in mm

heightl = 56.7;
diameterl = 24.5;

//for the small loop

heights = 54.2;
diameters = 23.4;


// the rest

r_l = diameterl/2;
r_s = diameters/2;
aveR = (r_l+r_s)/2;


difference() {
translate([0,0,-(total_height-heightl)])
cylinder(total_height,aveR, aveR);

ant();


}









module ant() {
//large loop
linear_extrude(height = heightl, center = false, convexity = 10, twist = twist_t, slices = 20, scale = 1.0) {

translate([diameterl/2,0,0])
circle(wireD);

translate([-diameterl/2,0,0])
circle(wireD);
}
rotate([0,90,0])
translate([0,0,(-diameterl/2)-wireD])
cylinder(diameterl+2*wireD,wireD, wireD);

rotate([0,90,0])
translate([-heightl,0,(-diameterl/2)-wireD])
cylinder(diameterl+2*wireD,wireD, wireD);



//small loop
translate([0,0,heightl-heights]) {
linear_extrude(height = heights, center = false, convexity = 10, twist = twist_t, slices = 20, scale = 1.0) {

translate([0,diameters/2,0])
circle(wireD);

translate([0,-diameters/2,0])
circle(wireD);
}}

rotate([90,0,0])
translate([0,heightl-heights,(-diameterl/2)-wireD])
cylinder(diameterl+2*wireD,wireD, wireD);

rotate([90,0,0])
translate([0,heightl,(-diameterl/2)-wireD])
cylinder(diameterl+2*wireD,wireD, wireD);

translate([0,0,-90])
cylinder(heightl+100,aveR/2,aveR/2); //feedline

}
