
%% COEFICIENTE DE DETERMINAÇÃO NA REGRESSÃO MÚLTIPLA (R2)

function [ r2 ] = CoeficienteDetR2( y , ychap )

% Sabendo que R^2 = 1 - SQE/Syy temos:
r2 = 1 - (sum((y - ychap).^2))/(sum((y - mean(y)).^2));

end

