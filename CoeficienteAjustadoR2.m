%% COEFICIENTE DE DETERMINAÇÃO AJUSTADO (R2aj)
function [ r2aj ] = CoeficienteAjustadoR2( y , ychap , X )

% Determinamos os valores de n , k e p.
[n , k] = size(X);
p = k + 1;

% Sabendo que R2aj = 1 - (SQE/(n-p))(Syy/(n-1)) temos:
r2aj = 1 - (sum((y - ychap).^2) / ( n - p))/(sum((y - mean(y)).^2)/( n - 1));
end
