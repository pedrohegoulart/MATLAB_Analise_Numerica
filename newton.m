
function [yi, p, b] = newton (x, y, xi)
n=length(x); %Contagem de pontos
b=zeros(n);
b(:,1)=y(:);


for j=2:n
    for i=1:n-j+1
        b(i,j)=(b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i)); %Matriz de coeficientes calculados
    end
end

xc=1;
yi=b(1,1);

% Valor da função no ponto dado
for j=1:n-1
    xc=xc.*(xi-x(j));
    yi=yi+b(1,j+i)*xc;
end

%Formula para montagem da equação com os coeficientes anteriormentes
%encontrados
p=num2str(b(1,1));
xx=x*-1;
for j=2:n
    pontuacao='';
    if b(1,j)>=0
        pontuacao='+';
    end
    xc='';
    for i=1:j-1
        pontuacao2='';
        if xx(i)>=0
            pontuacao2 = '+';
        end
        xc = strcat(xc, '*(X',pontuacao2,num2str(xx(i)), ')');
    end
    p=strcat(p,pontuacao,num2str(b(1,j)),xc);

end