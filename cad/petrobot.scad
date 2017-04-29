//width_inside=60;
//height_inside=60;
//length_inside=90;

width_inside=67;
height_inside=67;
length_inside=105;


material=3;

width=width_inside+2*material;
height=height_inside+2*material;
length=length_inside+2*material;

tab = 12;
$fn=100;
module screw_hole(a) {
    rotate(a) hull() {
        translate([-0.5,0]) circle(r=1.5);
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

module front() {
    difference() {
        frontback();
        translate([material,material]) {
            translate([width_inside/2,height_inside*2/3]) {
                translate([-26/2,0]) circle(r=8.1);
                translate([26/2,0]) circle(r=8.1);
            }
            
            translate([width_inside/2,height_inside*1/3]) {
                translate([-6,-5]) hull() {
                    circle(r=1.5);
                    translate([24,9]) circle(r=1.5);
                }
            }
            
            translate([width_inside/2,height_inside*2/3]) {
                translate([3,8]) hull() {
                    circle(r=0.8);
                    translate([8,5]) circle(r=0.8);
                }
            }
            translate([width_inside/2,height_inside*2/3]) {
                mirror([1,0]) translate([3,8]) hull() {
                    circle(r=0.8);
                    translate([8,5]) circle(r=0.8);
                }
            }
        }
    }
}

module side() {
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
        /*
        translate([material+5+7.5+7.5/2,11.2]) circle(r=7.5/2);
        translate([material+5+20.5+4/2,11.2]) circle(r=4/2);
        translate([material+5+41,11.2-5/2]) square([3,5]);
        translate([material+5+30.2+3/2,11.2-10.1+1.5]) circle(r=3/2);
        translate([material+5+30.2+3/2,11.2+10.1-1.5]) circle(r=3/2);
        */
        translate([material+6.5+7.5+7.5/2,11.2]) circle(r=7.5/2);
        translate([material+6.5+11.25,11.2-11.25+20.5+4/2]) circle(r=4/2);
        translate([material+6.5+11.25-5/2,11.2-11.25+41]) square([5,3]);
        translate([material+6.5+11.25-10.1+1.5,11.2-11.25+30.2+3/2]) circle(r=3/2);
        translate([material+6.5+11.25+10.1-1.5,11.2-11.25+30.2+3/2]) circle(r=3/2);
        
        // arduino
        /*translate([length-material-15-tab,height_inside-30-material]) square([tab,material]);
        translate([length-material-40-2*tab,height_inside-30-material]) square([tab,material]);
        */
    }
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


module bottom() {
    difference() { 
        topbottom();
        
        translate([material+6.5+11.25-5.5/2,material+8]) square([5.5,4]);
        translate([material+6.5+11.25-5.5/2,material+width_inside-8-4]) square([5.5,4]);
        translate([material+length_inside-20,width/2-39/2]) circle(r=1.5);
        translate([material+length_inside-20,width/2+39/2]) circle(r=1.5);
    }
}


module top() {
    difference() { 
        topbottom();
        
        // pin slots
        /*translate([length-material-22-8+2,material + width_inside/2-53.3/2+2.5]) hull() {
            circle(r=1.5);
            translate([-44,0]) circle(r=1.5);
        }
        translate([length-material-22-8-4+2,material + width_inside/2+53.3/2-2.5]) hull() {
            circle(r=1.5);
            translate([-40,0]) circle(r=1.5);
        }*/
        
        // screw holes for shield mount
        translate([length-material-22,material + width_inside/2-53.3/2+2.5]) circle(r=1.5);
        //translate([length-material-22+1.3,material + width_inside/2+53.3/2-2.5]) circle(r=1.5);
        //translate([length-material-22-50.8,material + width_inside/2-53.3/2+2.5+15.2]) circle(r=1.5);
        translate([length-material-22-50.8,material + width_inside/2-53.3/2+2.5+15.2+27.9]) circle(r=1.5);
        
        // cutouts analog pins
        translate([length-material-22-50.8+2.5,material + width_inside/2-53.3/2+2.5+15.2+27.9-6.7]) square([16,10]);
        
        // power led
        translate([length-material-22-11,material + width_inside/2-53.3/2+2.5+33]) circle(r=1.3);
        
        // Servos
        translate([length-material-22+7,material + width_inside/2-53.3/2]) square([8,7.5]);
        // hole for screw power terminals
        //translate([length-material-22+10.5,material + width_inside/2+53.3/2-3]) hull() {
        //    circle(r=2);
        //    translate([0,-4]) circle(r=2);
        //}
        
        translate([0,material+17.5]) hull() {
            circle(r=3);
            translate([8,0]) circle(r=3);
        }
    }   
}

module back() {
    difference() {
        frontback();
        translate([width/2-53.3/2+8,height-material-30+4+2.5]) square([14,13]);
        translate([width/2+53.3/2-3-10,height-material-30+4+2.5]) square([9,12]);
        //translate([width/2+53.3/2-1-8,height-material-30+4+15]) square([8,7]);
        
        translate([material+width_inside-5,material+32]) circle(r=5.8/2);
    }
}


/*
front();
translate([width+2,0]) side();
translate([width+2,height+2]) side();
translate([width+length+4,0]) bottom();
translate([width+length*2+6,0]) top();
translate([0,height+2]) back();
*/

back();
translate([width+2,0]) side();
translate([width+length+4,0]) side();
translate([width+length*2+6,0]) top();
translate([width+length*3+8,0]) bottom();

translate([0,height+2]) {
    back();
    translate([width+2,0]) side();
    translate([width+length+4,0]) side();
    translate([width+length*2+6,0]) top();
    translate([width+length*3+8,0]) bottom();
}