# Regressão Múltipla
> O objetivo é observar o comportamento do modelo de regressão polinomial usando diferentes graus.

**_Descrição:_**

Dado um conjunto de dados referente a colheita de um aerogerador (ou Sistema de
Geração Eólica), gerador elétrico que converte energia eólica em energia elétrica. Podemos
encontrar uma relação entre as variáveis da base de dados através de Regressão múltipla.
O conjunto de dados apresenta a velocidade do vento (m/s), e a potência gerada (kWatts). Logo, 
será determinado os modelos de regressão polinomial (graus 2, 3, 4 e 5) com parâmetros
estimados pelo método dos mínimos quadrados.

**_Implementação:_**

Na implementação em questão fora considerado duas principais variáveis, entrada x :
velocidade do vento (m/s), e saída y: potência gerada (kWatts). Os dados analisados podem ser
vistos na Figura abaixo:

![](DadosAerogerador.png)

O problema fora formulado como: y = Xβ + ε, o que equivale ao seguinte sistema
com n equações e k + 1 incógnitas:

![eq](https://user-images.githubusercontent.com/44507419/91243387-4b81f800-e720-11ea-9d1e-180f4666b636.png)


Usando o método dos mínimos quadrados para estimar os coeficientes de regressão
βj, j = 0, 1, ..., k. Teremos, β = (X'X)^-1X'y (RUSSEL, P. N. e S. Inteligência Artificial.
[S.l.]: Editora Campus, 2013. v. 3a edição.).

O código criado em MATLAB realiza todo esse processo com estimativa dos coeficientes
de regressão polinomial pelo método dos mínimos quadrados para os graus 2, 3, 4 e 5. As
Figuras abaixo mostram o comportamento da regressão em relação aos graus polinomiais 2 e 5,
respectivamente.

![](RegressaoMultiplaGrau2.png)

![](RegressaoMultiplaGrau5.png)


Além dos gráficos gerados ao fim da implementação, na janela de comandos do
MATLAB é fornecido uma tabela com os resultados das métricas de avaliação: Coeficiente de
Determinação (R²) e o Coeficiente de Determinação Ajustado (R²aj). Esses resultados também
podem ser vistos na Tabela abaixo.

![tb](https://user-images.githubusercontent.com/44507419/91242801-bc281500-e71e-11ea-8f5d-a0c5f65ac83f.png)

Analisando a Tabela, podemos perceber que à medida que o grau aumenta o
Coeficiente (R²) se aproxima mais de 1. Este comportamento é o esperado, uma vez que o
acréscimo de uma variável ao modelo sempre acarretará no aumento de (R²), mesmo que de
maneira singela (como as medidas do grau 4 para o grau 5).

A relação existente entre o grau e o valor de R² não ocorre com o Coeficiente
Ajustado (R²aj), que fora criado justamente para "fugir" deste comportamento. O valor de (R²aj)
só é acrescentado, se a inclusão de uma nova variável implicar em uma redução significativa
na média quadrática dos erros. Tal processo é exemplificado no problema em questão, onde o
valor de (R²aj) cresce até o quarto grau e decresce quando consideramos o quinto grau. Com isto,
concluímos que a adoção do quarto grau para o nosso modelo de dados já seria suficiente. Isto
também é notório quanto analisamos as representações gráficas fornecidas pela simulação criada.
Todos os resultados encontrados pela a aplicação foram os esperados.
