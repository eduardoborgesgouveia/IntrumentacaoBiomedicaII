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
%% Input de dados
fprintf('Entre com os seguintes dados: \n\n');
cumprimentoCateter = input('Comprimento do cateter [m]:  ');
raioCateter = input('Raio interno do cateter [m]:  ');
cumprimentoBolhaAr = input('Comprimento da bolha de ar [m]: ');

%% Calculations

%constantes
Ed = 0.49*10^15;
Cd = 1/Ed;

%C�lculo da frequencia natural sem a bolha
frequenciaNaturalSemBolha = (raioCateter/2)*((1/(pi*cumprimentoCateter))*...
    ((0.49*10^15)/(1*10^3)))^(1/2);

%C�lculo da raz�o de amortecimento sem a bolha
razaoAmortecimentoSemBolha = ((4*0.001)/(raioCateter^3))*((1/pi)*(1/...
    ((1*10^3)*(0.49*10^15))))^(1/2);

%C�lculo da frequencia natural com a bolha
Cb = (((pi*(raioCateter^2)*cumprimentoBolhaAr))/1000)/(98.5);

frequenciaNaturalComBolha = frequenciaNaturalSemBolha*(sqrt(Cd/Cb));

%C�lculo da raz�o de amortecimento com a bolha
Ct = Cd + Cb;

razaoAmortecimentoComBolha = razaoAmortecimentoSemBolha*(sqrt(Ct/Cd));

%% Sistema

%{
   Data format:
     For SISO models, NUM and DEN are row vectors listing the numerator
     and denominator coefficients in descending powers of s,p,z,q.
     For example,
        sys = tf([1 2],[1 0 10])
     specifies the transfer function (s+2)/(s^2+10)

       considerando nosso sistema de segunda ordem:
            (s + Wn^2)/(s^2 + 2*amort*Wn + Wn^2)
%}

SistemaSemBolha = tf([1 frequenciaNaturalSemBolha^2],[1 ...
    2*razaoAmortecimentoSemBolha*frequenciaNaturalSemBolha ...
    frequenciaNaturalSemBolha^2]);

SistemaComBolha = tf([1 frequenciaNaturalComBolha^2],[1 ...
    2*razaoAmortecimentoComBolha*frequenciaNaturalComBolha ...
    frequenciaNaturalComBolha^2]);
    
%% Plotagem

bode(SistemaSemBolha,SistemaComBolha);
set(cstprefs.tbxprefs, 'FrequencyUnits', 'Hz');
legend('Resposta do sistema sem bolha', 'Resposta do sistema com bolha');
