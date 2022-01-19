


%% Menu Principal de Seleção

principal = menu('Selecione a Máteria', 'Interpolação de Lagrange', 'Interpolação de Newton', 'Interpolação de Gregory-Newton', 'Quadrados Minimos','Calculo de R²','Erro de Trucamento');

%% Chama os Menus Presentes

switch principal    
    % Chama Interpolação de Lagrange
    case 1   
        disp('---------- Interpolação de Lagrange ----------------');
        x_l = input('Digite as abssissas (x): ');
        y_l = input('Digite as coordenadas (y): ');
        xi_l = input('Digite valor de xi: ');
        [C,yi] = lagrange(x_l,y_l,xi_l);
        disp('Coeficientes da função (De maior para menor Grau) = ');
        disp(C);
        disp('Valor da função no ponto dado = ');
        disp(yi);     
       
    
       
    %Chama Interpolação de Newton
    case 2
        disp('---------- Interpolação de Newton ----------------');
        x_n = input('Digite as abssissas (x): ');
        y_n = input('Digite as coordenadas (y): ');
        xi_n = input('Digite valor de xi: ');
        [yi, p, b] = newton(x_n,y_n,xi_n);
        disp('Tabela = ');
        disp(b);
        disp('Coeficientes da função (De menor para maior Grau) = ');
        disp(p);
        disp('Valor da função no ponto dado = ');
        disp(yi);
        
       
       
       
       
    %Chama Interpolação de Gregory-Newton
    case 3        
        disp('---------- Interpolação de Lagrange ----------------');    
        x_g = input('Digite as abssissas (x): ');
        y_g = input('Digite as coordenadas (y): ');
        xi_g = input('Digite valor de xi: ');
        [C1,yi1,d1, u1] = gregory(x_g,y_g,xi_g);
        disp('Tabela = ');
        disp(d1);
        disp(' ');
        disp('Valor de u = ');
        disp(u1);
        disp('Coeficientes da função (De maior para menor Grau) = ');
        disp(C1);
        disp('Valor da função no ponto dado = ');
        disp(yi1);
     
     %Chama Erro de Trucamento
     %case 4 
        %disp('---------- Erro de Trucamento ----------------');    
        %x_et = input('Digite as abssissas (x): ');
        %y_et = input('Digite as coordenadas (y): ');
        %xi_et = input('Digite valor de xi: ');
      %  syms t;
      %  equacao_et = input('Digite a equacao em funcao de (t): ');
      %  erro_t(equacao_et);%x_et,y_et,xi_et,equacao_et);
     
     %Chama Quadrados Minimos
     case 4 
        disp('---------- Quadrados Minimos ----------------');    
        x_qm = input('Digite as abssissas (x): ');
        y_qm = input('Digite as coordenadas (y): ');
        [b5,v5,t5,s5] =quadrado_m(x_qm,y_qm);
        disp('Matriz: ');
        disp(b5);
        disp('Vetor: ');
        disp(v5);
        disp('Matriz por Gauss: ');
        disp(s5);
        disp('Coeficientes do menor para maior graU: ');
        disp(t5);
        
     %Chama Calculo de R²
     case 5 
        disp('---------- Calculo de R² ----------------');    
        x_r2 = input('Digite as abssissas (x): ');
        y_r2 = input('Digite as coordenadas (y): ');
        [b6,v6,t6,s6,R,Erro] = R_2(x_r2,y_r2);
        disp('Matriz: ');
        disp(b6);
        disp('Vetor: ');
        disp(v6);
        disp('Matriz por Gauss: ');
        disp(s6);
        disp('Coeficientes do menor para maior graU: ');
        disp(t6);
        disp('Valor de R²: ');
        disp(R);
        disp('Valor do Erro: ');
        disp(Erro);
        
      %Chama Regressao Multipla
     %case 6 
     %   disp('---------- Regressao Multipla ----------------');
     %   r = input('Digite a quantidade vetores em X: ');
     %  x_rm = input('Digite as abssissas (x): ');
    %    y_rm = input('Digite as coordenadas (y): ');
    %    regressao_m(x_rm,y_rm,r);
        
        
       
end




