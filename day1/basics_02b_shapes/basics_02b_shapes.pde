import processing.pdf.*;
size(200,200);
smooth();

beginRecord(PDF, "shapes.pdf"); 

background(0);
noFill();
stroke(160);

beginShape();
vertex(65,20);
vertex(80,35);
vertex(80,65);
vertex(65,80);
vertex(35,80);
vertex(20,65);
vertex(20,35);
vertex(35,20);
vertex(65,20);
endShape();

bezier(120,20,160,20,140,80,180,80);

beginShape(TRIANGLE_STRIP);
vertex(120,120);
vertex(135,180);
vertex(150,120);
vertex(165,180);
vertex(180,120);
endShape();

beginShape(TRIANGLE_FAN);
vertex(50,180);
vertex(20,135);
vertex(35,120);
vertex(65,120);
vertex(80,135);
vertex(50,180);
endShape();

endRecord();
