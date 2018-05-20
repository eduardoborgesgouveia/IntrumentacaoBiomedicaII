%{
Universidade Federal de Uberlândia
Faculdade de Engenharia Elétrica
Graduação em Engenharia Biomédica
Instrumentação Biomédica II

Decrição: Deve-se utilizar o gráfico do arquivo "Onda PAi-fl1.pdf" e
gerar um gráfico similar no MatLab e levantar as harmonicas dessa onda.

Docente: Eduardo Borges Gouveia
Discente: Eduardo Lázaro Martins Naves

Autor: Eduardo Borges Gouveia
Contato: eduardoborgesgouveia@gmail.com
%}
clear;
%% Carregar o arquivo com os valores do gráfico
sinal = importdata('file - re.txt');
sinal = sinal';

%{
O arquivo carregado contém valores inseridos manualmente que representam o
ciclo de 1 segundo, logo a quantidade de dados no arquivo carregado
representa a frequência de amostragem do sinal
%}
freqAm = length(sinal);
periodoAm = 1/freqAm;

tempo = 1:length(sinal);
tempo = tempo.*periodoAm;
tempo = tempo - periodoAm;

%{
Como os valores do sinal carregado foram inseridos manualmente a onda ficou
com uma variação muito grande entre os pontos. Portanto utilizei um filtro
passa baixa para retirar as grandes variações (altas frequências) que não
deveriam existir. Dessa maneira aproximamos o formato de onda ao exemplo do
pdf "Onda PAi-fl1".
%}
filt = LowPassFilt(sinal,5,10,freqAm);

%Sinal original e sinal filtrado
figure();
plot(tempo,sinal,tempo,filt);
title('sinal original e filtrado');
legend('sinal original','sinal filtrado');
set(gca,'fontsize',13,'fontWeight','bold');
ylabel('mmHg');
xlabel('tempo [s]');
%% Série de Fourier do sinal
f = fit(tempo',filt','fourier6');

figure();
plot(f,tempo',filt');

%Coeficientes da Série de Fourier
coeffs = coeffvalues(f);
coeffsName = coeffnames(f);

%Primeira harmônica
har1 = coeffs(2)*cos(1*tempo*coeffs(end));
har2 = coeffs(3)*sin(1*tempo*coeffs(end));
%Segunda harmônica
har3 = coeffs(4)*cos(2*tempo*coeffs(end));
har4 = coeffs(5)*sin(2*tempo*coeffs(end));
%Terceira harmônica
har5 = coeffs(6)*cos(3*tempo*coeffs(end));
har6 = coeffs(7)*sin(3*tempo*coeffs(end));
%Quarta harmônica
har7 = coeffs(8)*cos(4*tempo*coeffs(end));
har8 = coeffs(9)*sin(4*tempo*coeffs(end));
%Quinta harmônica
har9 = coeffs(10)*cos(5*tempo*coeffs(end));
har10 = coeffs(11)*sin(5*tempo*coeffs(end));
%Sexta harmônica
har11 = coeffs(12)*cos(6*tempo*coeffs(end));
har12 = coeffs(13)*sin(6*tempo*coeffs(end));

%Análisando a amplitude das harmônicas: Porcentagem de cada harmônica em
%relação a fundamental

percentAmplitudeSin = zeros(6,1);
percentAmplitudeCos = zeros(6,1);

coeffs = abs(coeffs);

j = 1;
for i = 2:length(coeffs)-1
    if(mod(i,2)==1)
        percentAmplitudeSin(j) = (coeffs(i)/coeffs(3))*100;
        j = j+1;
    else
        percentAmplitudeCos(j) = (coeffs(i)/coeffs(2))*100;
    end
end

%% plotagem dos dados

figure();
subplot(1,2,1);
plot(tempo,har1,tempo,har3,tempo,har5,tempo,har7,tempo,har9,tempo,har11);
legend('1ª harmônica','2ª harmônica','3ª harmônica','4ª harmônica',...
    '5ª harmônica','6ª harmônica');
title('Harmônicas - cossenos');
set(gca,'fontsize',13,'fontWeight','bold');
ylabel('mmHg');
xlabel('tempo [s]');

subplot(1,2,2);
plot(tempo,har2,tempo,har4,tempo,har6,tempo,har8,tempo,har10,tempo,har12);
legend('1ª harmônica','2ª harmônica','3ª harmônica','4ª harmônica',...
    '5ª harmônica','6ª harmônica');
title('Harmônicas - senos');
set(gca,'fontsize',13,'fontWeight','bold');
ylabel('mmHg');
xlabel('tempo [s]');

soma = coeffs(1)+har1+har2+har3+har4+har5+har6+har7+har8+har9+har10...
    +har11+har12;

figure();
plot(tempo,filt, tempo, soma);
legend('onda original','onda reconstruída');
title('Original - reconstruída');
set(gca,'fontsize',13,'fontWeight','bold');
ylabel('mmHg');
xlabel('tempo [s]');