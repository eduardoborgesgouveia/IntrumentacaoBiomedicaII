%{
Universidade Federal de Uberlândia
Faculdade de Engenharia Elétrica
Graduação em Engenharia Biomédica
Instrumentação Biomédica II

Decrição: O programa deve receber como entrada o comprimento do cateter [m]
seu raio interno [m] e o comprimento de uma bolha de ar em seu 
interior [m]. 
O programa deve fornecer a curva de resposta em frequência 
(diagrama de Bode) do sistema cateter-sensor de 
PAi a partir dos dados de entrada.
O módulo de elasticidade do diafragma 
do sensor é 0.49x1015 N/m5 e os demais dados necessários são aqueles 
fornecidos no exemplo 7.1 da página 305 (Webster).

INPUTS:
1 - comprimento do cateter [m];
2 - raio interno do cateter [m];
3 - comprimento da bolha de ar [m].

OUTPUT:
1 - a curva de resposta em frequência do cateter-sensor.

Docente: Eduardo Borges Gouveia
Discente: Eduardo Lázaro Martins Naves

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





