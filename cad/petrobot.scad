width_inside=60;
height_inside=60;
length_inside=90;

material=3;

width=width_inside+2*material;
height=height_inside+2*material;
length=length_inside+2*material;

tab = 12;
$fn=100;

module frontback() {
    translate([material,material])
    difference() {
        union() {
            square(width_inside,height_inside);
            // Tabs
            translate([width_inside*1/4-tab/2,-material]) square([tab,material+1]);
            translate([width_inside*3/4-tab/2,-material]) square([tab,material+1]);
            translate([width_inside*1/4-tab/2,height_inside-1]) square([tab,material+1]);
            translate([width_inside*3/4-tab/2,height_inside-1]) square([tab,material+1]);
            translate([-material, height_inside*1/4-tab/2]) square([material+1,tab]);
            translate([-material, height_inside*3/4-tab/2]) square([material+1,tab]);
            translate([width_inside-1, height_inside*1/4-tab/2]) square([material+1,tab]);
            translate([width_inside-1, height_inside*3/4-tab/2]) square([material+1,tab]);
        }
        
        translate([-material/2, height_inside*1/4]) circle(r=1.5);
        translate([-material/2, height_inside*3/4]) circle(r=1.5);
        translate([width_inside+material/2, height_inside*1/4   ]) circle(r=1.5);
        translate([width_inside+material/2, height_inside*3/4]) circle(r=1.5);
    }
}

difference() {
    frontback();
    translate([material,material]) {
        translate([width_inside/2,height_inside*2/3]) {
            translate([-27/2,0]) circle(r=8);
            translate([27/2,0]) circle(r=8);
        }
        
        translate([width_inside/2,height_inside*1/3]) {
            translate([-4,-5]) hull() {
                circle(r=1.5);
                translate([17,6]) circle(r=1.5);
            }
        }
    }
}


translate([width+2,0])
translate([0,material])
difference() {
    union() {
        square([length,height_inside]);
        translate([material+length_inside*1/6-tab/2,-material]) square([tab,material+1]);
        translate([material+length_inside*3/6-tab/2,-material]) square([tab,material+1]);
        translate([material+length_inside*5/6-tab/2,-material]) square([tab,material+1]);
        translate([material+length_inside*1/6-tab/2,height_inside-1]) square([tab,material+1]);
        translate([material+length_inside*3/6-tab/2,height_inside-1]) square([tab,material+1]);
        translate([material+length_inside*5/6-tab/2,height_inside-1]) square([tab,material+1]);
    }
    
    // Tab cutouts
    translate([-1, height_inside*1/4-tab/2]) square([material+1,tab]);
    translate([-1, height_inside*3/4-tab/2]) square([material+1,tab]);
    translate([length-material, height_inside*1/4-tab/2]) square([material+1,tab]);
    translate([length-material, height_inside*3/4-tab/2]) square([material+1,tab]);
    
    // Screw Mounts
    translate([material, height_inside*1/4]) {
        translate([-1,-1.5]) square([9,3]);
        translate([3,-2.75]) square([2.5,5.5]);
    }
    translate([material, height_inside*3/4]) {
        translate([-1,-1.5]) square([9,3]);
        translate([3,-2.75]) square([2.5,5.5]);
    }
    translate([length- material, height_inside*1/4]) mirror([1,0]) {
        translate([-1,-1.5]) square([9,3]);
        translate([3,-2.75]) square([2.5,5.5]);
    }
    translate([length- material, height_inside*3/4]) mirror([1,0]) {
        translate([-1,-1.5]) square([9,3]);
        translate([3,-2.75]) square([2.5,5.5]);
    }
    
    translate([length*1/12, 0]) rotate(90){
        translate([-1,-1.5]) square([9,3]);
        translate([3,-2.75]) square([2.5,5.5]);
    }
    translate([length*11/12, 0]) rotate(90){
        translate([-1,-1.5]) square([9,3]);
        translate([3,-2.75]) square([2.5,5.5]);
    }
    translate([length*1/12, height_inside]) rotate(270){
        translate([-1,-1.5]) square([9,3]);
        translate([3,-2.75]) square([2.5,5.5]);
    }
    translate([length*11/12, height_inside]) rotate(270){
        translate([-1,-1.5]) square([9,3]);
        translate([3,-2.75]) square([2.5,5.5]);
    }
    
    // Motor mount
    translate([material+5+7.5+7.5/2,11.2]) circle(r=7.5/2);
    translate([material+5+20.5+4/2,11.2]) circle(r=4/2);
    translate([material+5+41,11.2-5/2]) square([3,5]);
    translate([material+5+30.2+3/2,11.2-10.1+1.5]) circle(r=3/2);
    translate([material+5+30.2  +3/2,11.2+10.1-1.5]) circle(r=3/2);
}

translate([width+length+4,0])
difference() {
    square([length,width]);
    
    translate([-1, width_inside*1/4-tab/2+material]) square([material+1,tab]);
    translate([-1, width_inside*3/4-tab/2+material]) square([material+1,tab]);
    translate([length-material, width_inside*1/4-tab/2+material]) square([material+1,tab]);
    translate([length-material, width_inside*3/4-tab/2+material]) square([material+1,tab]);
    
    translate([material+length_inside*1/6-tab/2,-1]) square([tab,material+1]);
    translate([material+length_inside*3/6-tab/2,-1]) square([tab,material+1]);
    translate([material+length_inside*5/6-tab/2,-1]) square([tab,material+1]);
    translate([material+length_inside*1/6-tab/2,width_inside+material]) square([tab,material+1]);
    translate([material+length_inside*3/6-tab/2,width_inside+material]) square([tab,material+1]);
    translate([material+length_inside*5/6-tab/2,width_inside+material]) square([tab,material+1]);
    
    translate([material+length_inside-20,width/2-39/2]) circle(r=1.5);
    translate([material+length_inside-20,width/2+39/2]) circle(r=1.5);
    
    translate([length*1/12, material/2]) circle(r=1.5);
    translate([length*11/12, material/2]) circle(r=1.5);
    translate([length*1/12, width-material/2]) circle(r=1.5);
    translate([length*11/12, width-material/2]) circle(r=1.5);
}