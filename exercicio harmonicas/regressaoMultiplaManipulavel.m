function [Xregressao,Yregressao] = regressaoMultiplaManipulavel(x,funcao,grau)
%Função responsável por realizar a regressao multipla de uma função
%qualquer


t = polyfit(x,funcao,grau);
Yregressao = polyval(t,x);
Xregressao = x;


end

