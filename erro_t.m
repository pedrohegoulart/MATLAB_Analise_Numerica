function erro_t(equacao)%x,y,xi,equacao)
    syms t;
    d1 = diff(equacao);
    d2 = diff(d1);
    parte1 = strcat(string(d1));
    parte2 = strcat(string(d2));
    fprintf('%s   ---  %s',parte1, parte2);
end