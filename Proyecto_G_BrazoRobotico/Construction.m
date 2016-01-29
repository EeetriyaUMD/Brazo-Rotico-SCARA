function [] = Construction()

global x0 y0 x1 y1 x2 y2 w1 w2 w3 t LOcation1 LOcation2 posts counter1

A = t;

for xx = 1:20
    
    face1 = [cos(A(xx)), cos(A(xx+1)), cos(A(xx+1)), cos(A(xx))]; 
    face2 = [sin(A(xx)), sin(A(xx+1)), sin(A(xx+1)), sin(A(xx))];
    face3 = [0, 0, 1, 1];
        
%%CILINDROS
    
    patch(x0 + face1*(3 + w3), y0 + face2*(3 + w3), face3*(1.2 + w3), [0 0 0]);
    patch(x0 + face1*(2 + w3), y0 + face2*(2 + w3), (face3*(0.8 + w3)) + (1.2 + w3), 'b');
    patch(x0 + face1*(1 + w3), y0 + face2*(1 + w3), (face3*(6 + w3)) + (2 + w3*2), 'r');   
    patch(x0 + face1*(1.2 + w3), y0 + face2*(1.2 + w3), (face3*(0.5 + w3)) + (8 + w3*3) ,[0 0 0]);
    patch(x1 + face1*(1.2 + w3), y1 + face2*(1.2 + w3), (face3*(2.5 + w3*2)) + (8+ w3*3), [0 0 0]);
    patch(x2 + face1*(1.2 + w3), y2 + face2*(1.2 + w3), (face3*(0.5 + w3)) + (10+ w3*4), [0 0 0]);
    patch(x2 + face1*(0.5 + w3), y2 + face2*(0.5 + w3), (face3*(9 + w3*4)) + ((w1 + 1) + w3), 'r');
    patch(x2 + face1*(1.2 + w3), y2 + face2*(1.2 + w3), (face3*(0.5 + w3)) + ((w1 + 10) + w3*5), 'b');
    patch(x2 + face1*(1.2 + w3), y2 + face2*(1.2 + w3), (face3*(0.5 + w3)) + ((w1 + 0.5) + w3), 'b');

%%BRAZO
    
    if xx == LOcation1
           
        fac1 = [x0 + cos(A(xx))*(1.2 + w3), x0 + cos(A(xx + 10))*(1.2 + w3), x1 + cos(A(xx + 10))*(1.2 + w3), x1 + cos(A(xx))*(1.2 + w3)];
        fac2 = [y0 + sin(A(xx))*(1.2 + w3), y0 + sin(A(xx + 10))*(1.2 + w3), y1 + sin(A(xx + 10))*(1.2 + w3), y1 + sin(A(xx))*(1.2 + w3)];                
                
        patch(fac1, fac2, (face3*0) + (8 + w3*3), [0 0 0]); 
        patch(fac1, fac2, (face3*0) + (8.5 + w3*4), [0 0 0]);

        fac1 = [x0 + cos(A(xx))*(1.2 + w3), x1 + cos(A(xx))*(1.2 + w3), x1 + cos(A(xx))*(1.2 + w3), x0 + cos(A(xx))*(1.2 + w3)];
        fac2 = [y0 + sin(A(xx))*(1.2 + w3), y1 + sin(A(xx))*(1.2 + w3), y1 + sin(A(xx))*(1.2 + w3), y0 + sin(A(xx))*(1.2 + w3)];                
        
        patch(fac1, fac2, face3*(0.5 + w3) + (8 + w3*3), 'b');
 
        fac1 = [x0 + cos(A(xx + 10))*(1.2 + w3), x1 + cos(A(xx + 10))*(1.2 + w3), x1 + cos(A(xx + 10))*(1.2 + w3), x0 + cos(A(xx + 10))*(1.2 + w3)];
        fac2 = [y0 + sin(A(xx + 10))*(1.2 + w3), y1 + sin(A(xx + 10))*(1.2 + w3), y1 + sin(A(xx + 10))*(1.2 + w3), y0 + sin(A(xx + 10))*(1.2 + w3)];                
    
        patch(fac1, fac2, face3*(0.5 + w3) + (8 + w3*3), 'b');

    end
    
    if xx == LOcation2
    
        fac1 = [x1 + cos(A(xx))*(1.2 + w3), x1 + cos(A(xx + 10))*(1.2 + w3), x2 + cos(A(xx + 10))*(1.2 + w3), x2 + cos(A(xx))*(1.2 + w3)];
        fac2 = [y1 + sin(A(xx))*(1.2 + w3), y1 + sin(A(xx + 10))*(1.2 + w3), y2 + sin(A(xx + 10))*(1.2 + w3), y2 + sin(A(xx))*(1.2 + w3)];                
    
        patch(fac1, fac2, (face3*0) + (10 + w3*4), [0 0 0]);
        patch(fac1, fac2, (face3*0) + (10.5 + w3*5), [0 0 0]);

        fac1 = [x1 + cos(A(xx))*(1.2 + w3), x2 + cos(A(xx))*(1.2 + w3), x2 + cos(A(xx))*(1.2 + w3), x1 + cos(A(xx))*(1.2 + w3)];
        fac2 = [y1 + sin(A(xx))*(1.2 + w3), y2 + sin(A(xx))*(1.2 + w3), y2 + sin(A(xx))*(1.2 + w3), y1 + sin(A(xx))*(1.2 + w3)];                
    
        patch(fac1, fac2, face3*(0.5 + w3) + (10 + w3*4), 'b');

        fac1 = [x1 + cos(A(xx + 10))*(1.2 + w3), x2 + cos(A(xx + 10))*(1.2 + w3), x2 + cos(A(xx + 10))*(1.2 + w3), x1 + cos(A(xx + 10))*(1.2 + w3)];
        fac2 = [y1 + sin(A(xx + 10))*(1.2 + w3), y2 + sin(A(xx + 10))*(1.2 + w3), y2 + sin(A(xx + 10))*(1.2 + w3), y1 + sin(A(xx + 10))*(1.2 + w3)];
    
        patch(fac1, fac2, face3*(0.5 + w3) + (10 + w3*4), 'b');
 
    end

    %%PINZAS
    
    if xx == 3
       
        fac1 = [(x2 + cos(A(xx))*(1.2 + w3)) - w2, (x2 + cos(A(xx))*(1.2 + w3)) - (0.1708 + w3*0.8) - w2 , (x2 + cos(A(xx))*(1.2 + w3)) - (0.1708 + w3*0.8) - w2, (x2 + cos(A(xx))*(1.2 + w3)) - w2, (x2 + cos(A(xx))*(1.2 + w3)) - w2];
        fac11 = [(x2 + cos(A(xx + 6))*(1.2 + w3)) + w2, (x2 + cos(A(xx + 6))*(1.2 + w3)) + (0.1708 + w3*0.8) + w2, (x2 + cos(A(xx + 6))*(1.2 + w3)) + (0.1708 + w3*0.8) + w2, (x2 + cos(A(xx + 6))*(1.2 + w3)) + w2, (x2 + cos(A(xx + 6))*(1.2 + w3)) + w2];
        fac2 = [y2 + sin(A(xx + 16))*(1.2 + w3), y2 + sin(A(xx + 16))*(1.2 + w3), y2 + sin(A(xx))*(1.2 + w3), y2 + sin(A(xx))*(1.2 + w3), y2 + sin(A(xx + 16))*(1.2 + w3)];
        fac3 = [w1 + w3, w1 + w3, w1 + w3, w1 + w3];
        
        for i = 1: 4
            
            patch([fac1(i), fac1(i + 1), fac1(i + 1), fac1(i)], [fac2(i), fac2(i + 1), fac2(i + 1), fac2(i)], [fac3(i), fac3(i), fac3(i) + 0.5, fac3(i) + 0.5], [1 0 0]);
            patch([fac11(i), fac11(i + 1), fac11(i + 1), fac11(i)], [fac2(i), fac2(i + 1), fac2(i + 1), fac2(i)], [fac3(i), fac3(i), fac3(i) + 0.5, fac3(i) + 0.5], [1 0 0]);
        
        end
        
        patch([(x2 + cos(A(xx))*(1.2 + w3)) - w2, (x2 + cos(A(xx))*(1.2 + w3)) - (0.1708 + w3*0.8) - w2 , (x2 + cos(A(xx))*(1.2 + w3)) - (0.1708 + w3*0.8) - w2, (x2 + cos(A(xx))*(1.2 + w3)) - w2], [y2 + sin(A(xx + 16))*(1.2 + w3), y2 + sin(A(xx + 16))*(1.2 + w3), y2 + sin(A(xx))*(1.2 + w3), y2 + sin(A(xx))*(1.2 + w3)], fac3, [1 0 0]);
        patch([(x2 + cos(A(xx + 6))*(1.2 + w3)) + w2, (x2 + cos(A(xx + 6))*(1.2 + w3)) + (0.1708 + w3*0.8) + w2, (x2 + cos(A(xx + 6))*(1.2 + w3)) + (0.1708 + w3*0.8) + w2, (x2 + cos(A(xx + 6))*(1.2 + w3)) + w2], [y2 + sin(A(xx + 16))*(1.2 + w3), y2 + sin(A(xx + 16))*(1.2 + w3), y2 + sin(A(xx))*(1.2 + w3), y2 + sin(A(xx))*(1.2 + w3)], fac3, [1 0 0]);
        
    end
            
end

%%TAPAS

patch(x0 + cos(t)*(3 + w3), y0 + sin(t)*(3 + w3), t*0 + (1.2 + w3), [0 0 0]);
patch(x0 + cos(t)*(2 + w3), y0 + sin(t)*(2 + w3), t*0 + (2 + w3*2), 'b');
patch(x0 + cos(t)*(1.2 + w3), y0 + sin(t)*(1.2 + w3), t*0 + (8 + w3*3), [0 0 0]);
patch(x0 + cos(t)*(1.2 + w3), y0 + sin(t)*(1.2 + w3), t*0 + (8.5 + w3*4), [0 0 0]);
patch(x1 + cos(t)*(1.2 + w3), y1 + sin(t)*(1.2 + w3), t*0 + (8 + w3*3), [0 0 0]);
patch(x1 + cos(t)*(1.2 + w3), y1 + sin(t)*(1.2 + w3), t*0 + (10.5 + w3*4), [0 0 0]);
patch(x2 + cos(t)*(1.2 + w3), y2 + sin(t)*(1.2 + w3), t*0 + (10 + w3*4), [0 0 0]);
patch(x2 + cos(t)*(1.2 + w3), y2 + sin(t)*(1.2 + w3), t*0 + (10.5 + w3*5), [0 0 0]);
patch(x2 + cos(t)*(1.2 + w3), y2 + sin(t)*(1.2 + w3), (t*0) + ((w1 + 10) + w3*5), 'b');
patch(x2 + cos(t)*(1.2 + w3), y2 + sin(t)*(1.2 + w3), (t*0) + ((w1 + 10.5) + w3*6), 'b');
patch(x2 + cos(t)*(1.2 + w3), y2 + sin(t)*(1.2 + w3), (t*0) + ((w1 + 0.5) + w3), 'b');
patch(x2 + cos(t)*(1.2 + w3), y2 + sin(t)*(1.2 + w3), (t*0) + ((w1 + 1) + w3*2), 'b');
patch(cos(t)*16, sin(t)*16, t*0, 'r');

posts(1) = text(x1, y1, 8.3,...
     '      \leftarrowONE PIVOT',...
     'EdgeColor','red',...
     'LineWidth',2,...
     'LineStyle',':');
posts(2) = text(x2, y2, 10.3,...
     '      \leftarrowTWO PIVOT',...
     'EdgeColor','red',...
     'LineWidth',2,...
     'LineStyle',':');
posts(3) = text(x2, y2, w1 + 10.3,...
     '      \leftarrowTHREE PIVOT',...
     'EdgeColor','red',...
     'LineWidth',2,...
     'LineStyle',':');
posts(4) = text(x2, y2, w1 + 0.3,...
     '      \leftarrowFOUR PIVOT',...
     'EdgeColor','red',...
     'LineWidth',2,...
     'LineStyle',':');
posts(5) = text(x0, y0, 8.3,...
     '      \leftarrowZERO PIVOT',...
     'EdgeColor','red',...
     'LineWidth',2,...
     'LineStyle',':');
posts(6) = text(5, 0, 0,...
     ' WORK AREA',...
     'LineWidth',2,...
     'LineStyle',':');
 
if (counter1 == 1)
    
    set(posts,'Visible','on');
    
else
    
    set(posts,'Visible','off');
    
end

camlight

end
