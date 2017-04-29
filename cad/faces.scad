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
module tri() {
    scale(1.2) rotate(60) hull() {
        translate([0,3.7]) scale([1.1,4]) circle(r=1);
        rotate(60) translate([0,3.7]) scale([1,4]) circle(r=1);
        translate([0,3.7*2])rotate(120) translate([0,3.7]) scale([1.3,4]) circle(r=1);
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

module face_base() { 
    difference() {
        frontback();
        translate([material,material]) {
            translate([width_inside/2,height_inside*2/3]) {
                translate([-26/2,0]) circle(r=8.1);
                translate([26/2,0]) circle(r=8.1);
            }
        }
    }
}

module face1() {
    difference() {
        face_base();
        translate([material,material]) {
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

module face2() {
    difference() {
        face_base();
        
        translate([material,material]) {
            translate([width_inside/2,height_inside*1/3+3]) {
                circle(r=3);
                hull() {
                    translate([4.5,0]) circle(r=.4);
                    translate([18,0]) circle(r=.4);
                }
                mirror([1,0]) hull() {
                    translate([4.5,0]) circle(r=.4);
                    translate([18,0]) circle(r=.4);
                }
                hull() {
                    translate([4,3]) circle(r=.4);
                    translate([18,7]) circle(r=.4);
                }
                mirror([0,1]) hull() {
                    translate([4,3]) circle(r=.4);
                    translate([18,7]) circle(r=.4);
                }
                mirror([1,0]) hull() {
                    translate([4,3]) circle(r=.4);
                    translate([18,7]) circle(r=.4);
                }
                mirror([1,0]) mirror([0,1]) hull() {
                    translate([4,3]) circle(r=.4);
                    translate([18,7]) circle(r=.4);
                }
            }
            /*  
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
            }*/
        }
    }
}

module face3() {
    difference() {
        face_base();
        
        translate([material,material]) {
            translate([width_inside/2,height_inside*1/3]) {
                translate([0,5]) rotate(90) circle(r=2,$fn=3);
                scale([1.3,1]) difference() {
                    circle(r=10);
                    resize([24,16]) circle(r=10);
                    translate([-10,0]) square([20,20]);
                }
            }
            /*  
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
            }*/
        }
    }
}

module face4() {
    difference() {
        face_base();
        
        translate([material,material]) {
            translate([width_inside/2,height_inside*1/3+5]) {
                    tri();
                    mirror([1,0]) tri();
                    circle(r=2.4);
                
                translate([-14,25]) rotate(190) scale([0.8,0.5]) difference() {
                    circle(r=10);
                    resize([24,16]) circle(r=10);
                    translate([-10,0]) square([20,20]);
                }
                
                translate([14,25]) rotate(170) scale([0.8,0.5]) difference() {
                    circle(r=10);
                    resize([24,16]) circle(r=10);
                    translate([-10,0]) square([20,20]);
                }
            }
        }
    }
}

module face5() {
    difference() {
        face2();
        translate([width-15,height-13]) rotate(-30) {
            tri();
            mirror([1,0]) tri();
            circle(r=2);
        }
    }
}



module face6() {
    difference() {
        face_base();
        
        translate([material,material]) {
            translate([width_inside/2,height_inside*1/3+5]) {
                    tri();
                    mirror([1,0]) tri();
                    circle(r=2.4);
                
                translate([-14,25]) rotate(190) scale([0.8,0.5]) difference() {
                    circle(r=10);
                    resize([24,16]) circle(r=10);
                    translate([-10,0]) square([20,20]);
                }
                
                translate([14,25]) rotate(170) scale([0.8,0.5]) difference() {
                    circle(r=10);
                    resize([24,16]) circle(r=10);
                    translate([-10,0]) square([20,20]);
                }
            }
        }
    }
}

face1();
translate([width+5,0]) face2();
translate([2*(width+5),0]) face3();

translate([0,height+5]) {
    face4();
    translate([width+5,0]) face5();
    translate([2*(width+5),0]) face6();
}