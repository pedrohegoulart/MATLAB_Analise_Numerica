function [Coeficiente,yi,b,u1] = gregory(x, y, xi)

n=length(y)-1; %Contagem de pontos para Grau maximo 
n1 = n +1;
d=y;
b=zeros(n+1);
b(:,1)=y(:);
%u1 = num2str(b(1,1));

for j=2:n1
    for i=1:n1-j+1
        b(i,j)=(b(i+1,j-1)-b(i,j-1));
    end
end

for i=1:n
    for j=n+1:-1:i+1
        d(j)=(d(j)-d(j-1)); 
    end
    
    u=(xi-x(1))/(x(2)-x(1)); % u= (xi)-x0)/h 
    
    
    
    yi=d(i+1); %Puxa o coeficiente de grau 0
    
    % Valor da função no ponto dado
    for j=i:-1:1
        yi=d(j)+((u-j+1)/j)*yi;
        %fprintf('%d ==>  %d = %d + %d (( %d - %d + 1)) / %d ) * %d',j,  yi, d(j), u, j, j, yi);
        %fprintf('\n\n')
    end
    %yi=0;
    %for i=1:n
    %    yi=yi+(d(j)/factorial(i))*(u-n+1);
    %end
    u1 = strcat('(X-x0)/h =>','(X - (',num2str(x(1)),'))/',num2str((x(2)-x(1))), ' => ', '(',num2str(xi),' - (',num2str(x(1)),'))/',num2str((x(2)-x(1))), ' => ', num2str(u));
    Coeficiente=d(1:i+1);
end