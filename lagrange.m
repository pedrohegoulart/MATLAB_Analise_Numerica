function [Coeficiente,yi] = lagrange(x,y,xi)
syms p;
soma = 1;
equacao = 1;
n=length(x)-1; %Contagem de pontos para Grau maximo 
n1 = n+1;
b=zeros(n+1,n+1);
l = '';
l2 = '';

%u1 = strcat('(X-x0)/h =>','(X - (',num2str(x(1))


for t=1:1:n1
    for h=1:1:n1
        if h ~= t
            l = strcat(l,strcat('(X - (', num2str(x(h)),'))'));
            l2 = strcat(l2, strcat('(',num2str(x(t)),' - (',num2str(x(h)),'))'));
            soma = soma * (x(t)-x(h));
            equacao = equacao *(p - x(h));
        else
            %continue;
        end    
        
    end
    %fprintf('%d
    soma_y = (1/soma) * y(t);
    equacao_tot = expand(equacao);
    parte1 = strcat(l,' / ',l2);
    parte2 = strcat(string(equacao_tot),' / ',num2str(soma));
    parte3 = strcat(string(equacao_tot*soma_y));
    fprintf('\n');
    fprintf('L%d = %s => %s => %s \n\n\n',t-1,parte1,parte2,parte3);
    equacao = 1;
    soma = 1;
    l = '';
    l2 = '';
    
    
end

for k=1:n+1
    m=1;
    for j=1:n+1
        if k~=j
            m=conv(m,poly(x(j)))/(x(k)-x(j)); %Matriz de coeficientes calculados
        end
    end
    b(k,:)=m;
   
end

Coeficiente=y*b; % Coeficientes

yi=Coeficiente(n+1); %Puxa o coeficiente de grau 0

t=0;

% Valor da função no ponto dado
for j=1:n
     f = (Coeficiente(j) * xi^(n-t));
     yi = f + yi;
     t=t+1;
end

