
%%            TRABALHO DE INTELIG�NCIA COMPUTACIONAL

%   Institui��o:    Universidade Federal do Cear� - UFC, campus Sobral-CE
%   Autor(a):       Ra�ssa Ellen de Sousa
%   Matr�cula:      385135

%% DESCRI��O DO PROBLEMA

%   Dado um conjunto de dados de um aerogerador (vari�vel de entrada: velocidade do vento �m/s,
%   vari�vel de sa�da: pot�ncia gerada �kWatts), ser� determinado os modelos de regress�o
%   polinomial (graus 2, 3, 4 e 5) com par�metros estimados pelo m�todo dos m�nimos quadrados.
%   Como tamb�m ser� avaliado a qualidade de cada modelo pela m�trica R2 e R2aj.


%% CONDI��ES INICIAIS

clear all;
close all;
clc;

%% CEN�RIO

%Base de dados de um aerogerador(velocidade, pot�ncia)
    base= importdata('aerogerador.dat');

%Ser� adotado a velocidade como vari�vel x, e a pot�ncia como y.
    x = base(:,1);
    y = base(:,2);

%Gr�fico dos dados fornecidos
    figure('Name','Sistema preditor de um Aerogerador','NumberTitle','off','Renderer', 'painters', 'Position', [20 20 950 650])
    subplot(3,2,1)
    plot(x,y, 'b*');
    xlabel('Velocidade do vento ( m/s )');
    ylabel('Pot�ncia gerada (kWatts)');
    ylim([0 600]);
    title('BASE DE DADOS DE UM AEROGERADOR'); grid

%% REGRESS�O SIMPLES

% C�lculo para para estimar os par�metros desconhecidos ?0 e ?1 
% A t�cnica de estima��o a ser usada � a dos m�nimos quadrados (MQ).
    beta1 = (sum(x.*y)- mean(y)*sum(x)) /( sum(x.^2)- mean(x)*sum(x));
    beta0 = mean(y) - beta1*mean(x);

% Sabendo que y = ?0 + ?1x + ?, teremos
    yRS = beta0 + beta1*x;

%Gr�fico da reta que se aproxima dos dados
    subplot(3,2,2)
    plot(x,y, 'b*');
    hold on
    plot(x,yRS,'r-');
    ylim([0 600]);
    xlabel('Velocidade do vento ( m/s )');
    ylabel('Pot�ncia gerada (kWatts)');
    legend('Dados','Reta RS','Location','northwest');
    title('REGRESS�O SIMPLES'); grid

%% REGRESS�O M�LTIPLA

% Tomamos a mesma defini��o de antes
    x = base(:,1);
    y = base(:,2);

% ||||||||||||||||||||||GRAU 2||||||||||||||||||||||||||||||||||

% O m�todo dos m�nimos quadrados ser� usado para estimar os
% coeficientes de regress�o {?j}, j = 0, 1, ..., k.
% Dado y = X?+?, formulemos a matriz X
    tamanhoX = length(x);
    X2 = [ ones(tamanhoX,1) x x.^2];
    
% A estimativa de quadrados m�nimos de ? � dada por:
% ?= (X'X)^-1X'y
    beta2 = (X2'*X2)^(-1)*X2'*y;

% yi = ?0 + ?1xi1 + ?2xi2+...+?kxik+?i,
    yRM2 = beta2(1)+ beta2(2)*x + beta2(3)*x.^2 ;

%Gr�fico com Regress�o m�ltipla de grau 2
    subplot(3,2,3)
    plot(x,y, '*');grid
    hold on
    plot(x,yRM2,'r-');
    ylim([0 600]);
    title('REGRESS�O M�LTIPLA DE GRAU 2');
    legend('Dados','Reta RM','Location','northwest');
    xlabel('Velocidade do vento ( m/s )');
    ylabel('Pot�ncia gerada ( kWatts)');

% ||||||||||||||||||||||GRAU 3||||||||||||||||||||||||||||||||||

% � realizado o mesmo processo anterior.
    tamanhoX = length(x);
    X3 = [ ones(tamanhoX,1) x x.^2 x.^3];
    
% A estimativa de quadrados m�nimos de ? � dada por:
% ?= (X'X)^-1X'y
    beta3 = (X3'*X3)^(-1)*X3'*y;

% yi = ?0 + ?1xi1 + ?2xi2+...+?kxik+?i,
    yRM3 = beta3(1)+ beta3(2)*x + beta3(3)*x.^2 + beta3(4)*x.^3;

%Gr�fico com Regress�o m�ltipla de grau 3
    subplot(3,2,4)
    plot(x,y, '*');grid
    hold on
    plot(x,yRM3,'r-');
    ylim([0 600]);
    title('REGRESS�O M�LTIPLA DE GRAU 3');
    legend('Dados','Reta RM','Location','northwest');
    xlabel('Velocidade do vento ( m/s )');
    ylabel('Pot�ncia gerada ( kWatts)');
    
% ||||||||||||||||||||||GRAU 4||||||||||||||||||||||||||||||||||

% � realizado o mesmo processo anterior.
    tamanhoX = length(x);
    X4 = [ ones(tamanhoX,1) x x.^2 x.^3 x.^4];
    
% A estimativa de quadrados m�nimos de ? � dada por:
% ?= (X'X)^-1X'y
    beta4 = (X4'*X4)^(-1)*X4'*y;

% yi = ?0 + ?1xi1 + ?2xi2+...+?kxik+?i,
    yRM4 = beta4(1)+ beta4(2)*x + beta4(3)*x.^2 + beta4(4)*x.^3 + beta4(5)*x.^4;

%Gr�fico com Regress�o m�ltipla de grau 4
    subplot(3,2,5)
    plot(x,y, '*');grid
    hold on
    plot(x,yRM4,'r-');
    ylim([0 600]);
    title('REGRESS�O M�LTIPLA DE GRAU 4');
    legend('Dados','Reta RM','Location','northwest');
    xlabel('Velocidade do vento ( m/s )');
    ylabel('Pot�ncia gerada ( kWatts)');
    
% ||||||||||||||||||||||GRAU 5||||||||||||||||||||||||||||||||||

% � realizado o mesmo processo anterior.
    tamanhoX = length(x);
    X5 = [ ones(tamanhoX,1) x x.^2 x.^3 x.^4 x.^5];
    
% A estimativa de quadrados m�nimos de ? � dada por:
% ?= (X'X)^-1X'y
    beta5 = (X5'*X5)^(-1)*X5'*y;

% yi = ?0 + ?1xi1 + ?2xi2+...+?kxik+?i,
    yRM5 = beta5(1)+ beta5(2)*x + beta5(3)*x.^2 + beta5(4)*x.^3 + beta5(5)*x.^4 + beta5(6)*x.^5;

%Gr�fico com Regress�o m�ltipla de grau 5
    subplot(3,2,6)
    plot(x,y, '*');grid
    hold on
    plot(x,yRM4,'r-');
    ylim([0 600]);
    title('REGRESS�O M�LTIPLA DE GRAU 5');
    legend('Dados','Reta RM','Location','northwest');
    xlabel('Velocidade do vento ( m/s )');
    ylabel('Pot�ncia gerada ( kWatts)');
    
%% AVALIA��O (M�TRICAS)

% COEFICIENTE DE DETERMINA��O (R2)

R2_2 = CoeficienteDetR2( y , yRM2 );
R2_3 = CoeficienteDetR2( y , yRM3 );
R2_4 = CoeficienteDetR2( y , yRM4 );
R2_5 = CoeficienteDetR2( y , yRM5 );

% COEFICIENTE DE DETERMINA��O AJUSTADO (R2aj)

R2aj_2 = CoeficienteAjustadoR2( y , yRM2 , X2 );
R2aj_3 = CoeficienteAjustadoR2( y , yRM3 , X3 );
R2aj_4 = CoeficienteAjustadoR2( y , yRM4 , X4 );
R2aj_5 = CoeficienteAjustadoR2( y , yRM5 , X5 );

%% INFORMA��ES

formato = '\n\t\t\t\tREGRESS�O M�LTIPLA\n\nDADOS DE UM AEROGERADO\n\nDescri��o: Dado um conjunto de dados de um aerogerador (vari�vel de entrada: velocidade\ndo vento �m/s, vari�vel de sa�da: pot�ncia gerada �kWatts), ser� determinado os modelos\nde regress�o polinomial com par�metros estimados pelo m�todo dos m�nimos quadrados.\n\nAvalia��o da qualidade de cada modelo pelas m�tricas R2(Coeficiente de determina��o) e\nR2aj(Coeficiente de determina��o ajustado)\n\n ';
fprintf(formato);

TabelaDados = '\n-------------------------------------------------------------\n\t\t\t\t\tREGRESS�O M�LTIPLA\n-------------------------------------------------------------\n\tGrau\t\t\tR2\t\t\t\t\t\tR2aj\n-------------------------------------------------------------\n\t2\t\t\t\t%.6f\t\t\t\t%.6f\n\t3\t\t\t\t%.6f\t\t\t\t%.6f\n\t4\t\t\t\t%.6f\t\t\t\t%.6f\n\t5\t\t\t\t%.6f\t\t\t\t%.6f\n-------------------------------------------------------------\n\n\n';
fprintf(TabelaDados,R2_2,R2aj_2,R2_3,R2aj_3,R2_4,R2aj_4,R2_5,R2aj_5);

%% LIMPAR DADOS

% Apagar dados irrelevantes para as consultas
clear formato; clear TabelaDados ; clear tamanhoX;

    
%% Ra�ssa Ellen de Sousa - 385135
