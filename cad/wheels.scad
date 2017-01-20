$fn=200;
difference() {
    circle(r=36);
    difference() {
        circle(r=5.3/2);
        translate([3.6/2,-5]) square([10,10]);
        translate([-10-3.6/2,-5]) square([10,10]);
        
    }
    translate([8,0]) circle(r=1.5);
    rotate(120) translate([8,0]) circle(r=1.5);
    rotate(240) translate([8,0]) circle(r=1.5);
    
    translate([-16,19]) text("WOODYEAR", size=3, font="PhattPhreddy", spacing=1.2);
    rotate(180) translate([-16,19]) text("WOODYEAR", size=3, font="PhattPhreddy", spacing=1.2);
}

translate([75,0]) difference() {
    circle(r=35);
    difference() {
        circle(r=5.3/2);
        translate([3.6/2,-5]) square([10,10]);
        translate([-10-3.6/2,-5]) square([10,10]);
        
    }
    translate([8,0]) circle(r=1.5);
    rotate(120) translate([8,0]) circle(r=1.5);
    rotate(240) translate([8,0]) circle(r=1.5);
}