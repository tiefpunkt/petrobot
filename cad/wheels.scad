$fn=200;

module curved_text(string, r, size, font, angle) {
    for (a =[0:len(string)]) {
        rotate(a*angle*-1) translate([0,r]) text(string[a], size=size, font=font, halign="center");
    }
}

difference() {
    circle(r=60/2+1);
    circle(r=1.3);
    translate([8,0]) circle(r=1.5);
    rotate(120) translate([8,0]) circle(r=1.5);
    rotate(240) translate([8,0]) circle(r=1.5);
    
    //translate([-16,19]) text("WOODYEAR", size=3, font="PhattPhreddy", spacing=1.2);
    curved_text("WOODYEAR", size=3, font="PhattPhreddy", r=24, angle=10);
    rotate(180) curved_text("WOODYEAR", size=3, font="PhattPhreddy", r=24, angle=10);
    rotate(70) curved_text("9/1 R 2.4", size=2.4, font="Arial", r=24, angle=4);
    rotate(180+70) curved_text("9/1 R 2.4", size=2.4, font="Arial", r=24, angle=4);
    //rotate(180) translate([-16,19]) text("WOODYEAR", size=3, font="PhattPhreddy", spacing=1.2);
}

translate([70,0]) difference() {
    circle(r=60/2+1);
    difference() {
        circle(r=5.3/2);
        translate([3.6/2,-5]) square([10,10]);
        translate([-10-3.6/2,-5]) square([10,10]);
        
    }
    translate([8,0]) circle(r=1.5);
    rotate(120) translate([8,0]) circle(r=1.5);
    rotate(240) translate([8,0]) circle(r=1.5);
    
    //translate([-16,19]) text("WOODYEAR", size=3, font="PhattPhreddy", spacing=1.2);
    //rotate(180) translate([-16,19]) text("WOODYEAR", size=3, font="PhattPhreddy", spacing=1.2);
}

translate([35,53]) difference() {
    circle(r=60/2);
    difference() {
        circle(r=5.3/2);
        translate([3.6/2,-5]) square([10,10]);
        translate([-10-3.6/2,-5]) square([10,10]);
        
    }
    translate([8,0]) circle(r=1.5);
    rotate(120) translate([8,0]) circle(r=1.5);
    rotate(240) translate([8,0]) circle(r=1.5);
}