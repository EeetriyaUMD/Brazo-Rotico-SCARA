function [] = Assess()

global C1 C2 C3 C4 C5 x0 y0 x1 y1 x2 y2 w1 w2 w3
global pivotx0 pivoty0 pivot1 pivot2
 
p1 = pi/2+ C1*pi/180;
p2 = p1 + C2*pi/180;

w3 = C5*3;

x0 = pivotx0;
y0 = pivoty0;
x1 = pivotx0 + (pivot1 + w3*4)*cos(p1);
y1 = pivoty0 + (pivot1 + w3*4)*sin(p1);
x2 = x1 + (pivot2 + w3*8)*cos(p2);
y2 = y1 + (pivot2 + w3*8)*sin(p2);

w1 = C3*5 + 2;
w2 = C4*0.8;

cla

end
