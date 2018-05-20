function [Xregressao,Yregressao] = regressaoMultiplaManipulavel(x,funcao,grau)
%Fun��o respons�vel por realizar a regressao multipla de uma fun��o
%qualquer


t = polyfit(x,funcao,grau);
Yregressao = polyval(t,x);
Xregressao = x;


end

