function [] = Animation(a1, a2, a3)

global C1 C2 C3 LOcation1 LOcation2

Reset()

for i = 0:3.6:360

    if a1 >= i
    
        C1 = i;
    
    end
    
    if a2 >= i
    
        C2 = i;
    
    end
    
    if  (a3/0.1)*0.01 > C3
    
        C3 = (i/3.6)*0.01;
    
    end
    
    LOcation1 = Evaluation(C1);
    LOcation2 = Evaluation(C1 + C2);
    Assess()
    Construction()
    
    pause(0.05)
    
end

Reset()

end

