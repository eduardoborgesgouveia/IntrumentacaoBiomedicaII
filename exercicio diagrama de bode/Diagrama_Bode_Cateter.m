%{
Universidade Federal de Uberl�ndia
Faculdade de Engenharia El�trica
Gradua��o em Engenharia Biom�dica
Instrumenta��o Biom�dica II

Decri��o: O programa deve receber como entrada o comprimento do cateter [m]
seu raio interno [m] e o comprimento de uma bolha de ar em seu 
interior [m]. 
O programa deve fornecer a curva de resposta em frequ�ncia 
(diagrama de Bode) do sistema cateter-sensor de 
PAi a partir dos dados de entrada.
O m�dulo de elasticidade do diafragma 
do sensor � 0.49x1015 N/m5 e os demais dados necess�rios s�o aqueles 
fornecidos no exemplo 7.1 da p�gina 305 (Webster).

INPUTS:
1 - comprimento do cateter [m];
2 - raio interno do cateter [m];
3 - comprimento da bolha de ar [m].

OUTPUT:
1 - a curva de resposta em frequ�ncia do cateter-sensor.

Docente: Eduardo Borges Gouveia
Discente: Eduardo L�zaro Martins Naves

Autor: Eduardo Borges Gouveia
Contato: eduardoborgesgouveia@gmail.com
%}
clear;
%%
fprintf('Entre com os seguintes dados: \n\n');
comprimentoCateter = input('Comprimento do cateter [m]:  ');
raioCateter = input('Raio interno do cateter [m]:  ');
comprimentoBolhaAr = input('Comprimento da bolha de ar [m]: ');
i=0;





