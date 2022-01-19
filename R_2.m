function [b,v,t,S,r, erro_2] = R_2(x,y)
    n=length(x); %Contagem de pontos
    b=zeros(2,2);
    %b(:,1)=y(:);
    fprintf('\n\n|Pont |       xi       |       yi       |        xi²        |       xi*yi      |\n');
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
    
    g = 0;
    sq_reg = 0;
    sq_tot = 0;
    y_m = yi/n;
    soma_g = 0;
    soma_reg = 0;
    soma_tot = 0;
    erro = 0;
    erro_2 = 0;
    erro_ = 0;
    
    fprintf('\n\n|Pont |      g(x)      |     SQreg     |      SQtot      |        di        |       di²       |\n');
    
    for j=1:1:n
        g = t(2)*x(j) + t(1);
        sq_reg = ((g - y_m)^2);
        sq_tot = ((y(j) - y_m)^2);
        erro = y(j) - g;
        erro2 = (y(j) - g)^2;
        fprintf('|  %d  |  %d  |  %d  |  %d  |  %d  |  %d  |\n',j,g,sq_reg,sq_tot,erro,erro2);
        soma_g = soma_g + g;
        soma_reg = soma_reg + sq_reg;
        soma_tot = soma_tot + sq_tot;
        erro_ = erro_ + erro;
        erro_2 = erro_2 + (erro^2);
    end
    
    fprintf('|Tot  |       %d       |   %d    |   %d   |   %d    |    %d   |\n\n',soma_g,soma_reg,soma_tot,erro_,erro_2);
    
    r = soma_reg/soma_tot;
 
    
end