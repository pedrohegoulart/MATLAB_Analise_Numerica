function regressao_m(x,y,r)

    n=length(x); %Contagem de pontos
    b=zeros(r+1,r+1);
    %b(:,1)=y(:);
    fprintf('\n\n|Pont |       xi       |       yi       |        xi²        |       xi*yi      |        x2²        |       xi*x2      |       x2*yi      |\n');
    xi = 0;
    yi = 0;
    xi_2 = 0;
    xi_yi = 0;
    
    for j=1:1:n
        fprintf('|  %d  |  %d  |  %d  |  %d  |  %d  |\n',j,x(j),y(j),(x(j)^2),(x(j)*y(j)));
        xi = xi + x(j);
        yi = yi + y(j);
        xi_2 = xi_2 + (x(j)^2);
        xi_yi = xi_yi + (x(j)*y(j));
    end
    
    fprintf('| %s |  %d  |  %d  |  %d  |  %d  |\n\n','Tot',xi,yi,xi_2, xi_yi);
    
    b(1,1)= n;
    b(1,2)= xi;
    b(2,1)= xi;
    b(2,2)= xi_2;
    

    
    v=[yi xi_yi];
    
   

    [t,S] = Gauss(b, v);
    
end