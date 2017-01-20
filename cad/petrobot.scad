//width_inside=60;
//height_inside=60;
//length_inside=90;

width_inside=70;
height_inside=70;
length_inside=110;


material=3;

width=width_inside+2*material;
height=height_inside+2*material;
length=length_inside+2*material;

tab = 12;
$fn=100;
module screw_hole(a) {
    rotate(a) hull() {
        circle(r=1.5);
        translate([2,0]) circle(r=1.5);
    }
}

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
        
        translate([-material/2, height_inside*1/4]) screw_hole(180);
        translate([-material/2, height_inside*3/4]) screw_hole(180);
        translate([width_inside+material/2, height_inside*1/4   ]) screw_hole(0);
        translate([width_inside+material/2, height_inside*3/4]) screw_hole(0);
    }
}

difference() {
    frontback();
    translate([material,material]) {
        translate([width_inside/2,height_inside*2/3]) {
            translate([-26/2,0]) circle(r=8);
            translate([26/2,0]) circle(r=8);
        }
        
        translate([width_inside/2,height_inside*1/3]) {
            translate([-6,-5]) hull() {
                circle(r=1.5);
                translate([24,9]) circle(r=1.5);
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
    
    translate([material+3, 0]) rotate(90){
        translate([-1,-1.5]) square([9,3]);
        translate([3,-2.75]) square([2.5,5.5]);
    }
    translate([length-material-3, 0]) rotate(90){
        translate([-1,-1.5]) square([9,3]);
        translate([3,-2.75]) square([2.5,5.5]);
    }
    translate([material+3, height_inside]) rotate(270){
        translate([-1,-1.5]) square([9,3]);
        translate([3,-2.75]) square([2.5,5.5]);
    }
    translate([length-material-3, height_inside]) rotate(270){
        translate([-1,-1.5]) square([9,3]);
        translate([3,-2.75]) square([2.5,5.5]);
    }
    
    // Motor mount
    translate([material+5+7.5+7.5/2,11.2]) circle(r=7.5/2);
    translate([material+5+20.5+4/2,11.2]) circle(r=4/2);
    translate([material+5+41,11.2-5/2]) square([3,5]);
    translate([material+5+30.2+3/2,11.2-10.1+1.5]) circle(r=3/2);
    translate([material+5+30.2  +3/2,11.2+10.1-1.5]) circle(r=3/2);
    
    // arduino
    translate([length-material-15-tab,height_inside-30-material]) square([tab,material]);
    translate([length-material-40-2*tab,height_inside-30-material]) square([tab,material]);
}

module topbottom() {
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
        
        translate([material+3, material/2]) screw_hole(270);
        translate([length-material-3, material/2]) screw_hole(270);
        translate([material+3, width-material/2]) screw_hole(90);
        translate([length-material-3, width-material/2]) screw_hole(90);
    }
}

translate([width+length+4,0])
    difference() { 
        topbottom();
        translate([material+length_inside-20,width/2-39/2]) circle(r=1.5);
        translate([material+length_inside-20,width/2+39/2]) circle(r=1.5);
    }
    
 translate([width+length*2+6,0])
    difference() { 
        topbottom();
        translate([length-material-22-8+2,material + width_inside/2-53.3/2+2.5]) hull() {
            circle(r=1.5);
            translate([-44,0]) circle(r=1.5);
        }
        translate([length-material-22-8-4+2,material + width_inside/2+53.3/2-2.5]) hull() {
            circle(r=1.5);
            translate([-40,0]) circle(r=1.5);
        }
        translate([length-material-22+10.5,material + width_inside/2+53.3/2-3]) hull() {
            circle(r=2);
            translate([0,-4]) circle(r=2);
        }
        
        translate([0,material+15]) hull() {
            circle(r=3);
            translate([8,0]) circle(r=3);
        }
    }   

translate([0,height+2]) 
    difference() {
        frontback();
        translate([width/2-53.3/2+8,height-material-30+4]) square([14,13]);
        translate([width/2+53.3/2-3-11,height-material-30+4]) square([9,12]);
        translate([width/2+53.3/2-1-8,height-material-30+4+15]) square([8,7]);
    }
    
translate([width+2,height+2]) 
    translate([0,material]) difference() {
        union() {
            square([70,width_inside]);
            translate([70-tab-8,-material]) square([tab,material+1]);
            translate([70-2*tab-8-25,-material]) square([tab,material+1]);
            translate([70-tab-8,width_inside-1]) square([tab,material+1]);
            translate([70-2*tab-8-25,width_inside-1 ]) square([tab,material+1]);
        }
        
        translate([70-15,width_inside/2-53.3/2+2.5]) circle(r=1.5);
        translate([70-15+1.3,width_inside/2+53.3/2-2.5]) circle(r=1.5);
        translate([70-15-50.8,width_inside/2-53.3/2+2.5+15.2]) circle(r=1.5);
        translate([70-15-50.8,width_inside/2-53.3/2+2.5+15.2+27.9]) circle(r=1.5);
    }