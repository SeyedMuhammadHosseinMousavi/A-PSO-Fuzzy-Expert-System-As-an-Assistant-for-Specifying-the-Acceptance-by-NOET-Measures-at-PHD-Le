function z=CostModerate(x,moderate)
%x=[t1 t2 g1 g2 a1 a2]
      c1=.01;c2=.1;c3=1;c4=0.01;c5=0.01;c6=0.01;c7=0.01;c8=0.01;c9=0.01;c10=0.01;c=10;
    z=c1*(x(1)-x(2))^2+c2*(x(3)-x(4))^2+c3*(x(5)-x(6))^2+c4*(x(7)-x(8))^2+c5*(x(9)-x(10))^2+c6*(x(11)-x(12))^2+...
        c7*(x(13)-x(14))^2+c8*(x(15)-x(16))^2+c9*(x(17)-x(18))^2+c10*(x(19)-x(20))^2;
    for i=1:size(moderate,1)
        if moderate(i,1)>=x(1) && moderate(i,1)<=x(2) && moderate(i,2)>=x(3) && moderate(i,2)<=x(4) && moderate(i,3)>=x(5) && moderate(i,3)<=x(6)...
                && moderate(i,4)>=x(7) && moderate(i,4)<=x(8)&& moderate(i,5)>=x(9) && moderate(i,5)<=x(10)&& moderate(i,6)>=x(11) && moderate(i,6)<=x(12)...
                && moderate(i,7)>=x(13) && moderate(i,7)<=x(14)&& moderate(i,8)>=x(15) && moderate(i,8)<=x(16)&& moderate(i,9)>=x(17) && moderate(i,9)<=x(18)...
                && moderate(i,10)>=x(19) && moderate(i,10)<=x(20)
            z=z-c;
         end 
%         if moderate(i,1)<=x(2) 
%             z=z-c;
%         end 
%         if moderate(i,2)>=x(3) 
%             z=z-c;
%         end
%         if moderate(i,2)<=x(4) 
%             z=z-c;
%         end
%         if moderate(i,3)>=x(5) 
%             z=z-c;
%         end
%         if moderate(i,3)<=x(6) 
%             z=z-c;
%         end
        
    end 
end