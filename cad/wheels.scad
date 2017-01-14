$fn=200;
difference() {
    circle(r=40);
    difference() {
        circle(r=5.3/2);
        translate([3.6/2,-5]) square([10,10]);
        translate([-10-3.6/2,-5]) square([10,10]);
    }
}