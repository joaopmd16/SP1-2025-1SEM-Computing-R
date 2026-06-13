# Carregar biblioteca
library(readxl)

# Importar a base de dados (certifique-se que o arquivo .xlsx está no mesmo diretório do script)
dados <- read_excel("base_roubo_cargas_2024.xlsx")

# ============================
# Quantitativa Discreta: Ranking Estadual
# ============================

# Criar a tabela de frequência
ranking_freq <- table(dados$`Ranking Estadual`)
print(ranking_freq)

# INSIGHTS:
# 1. Estados com ranking 1 a 3 concentram a maior parte dos prejuízos, indicando foco em SP, RJ e MG.
# 2. Rankings acima de 10 ocorrem com menor frequência, sugerindo que estados fora do top 10 têm menos prejuízo.

# ============================
# Quantitativa Contínua: % Prejuízo
# ============================

# Definir intervalos para as classes (de 5 em 5)
breaks <- seq(0, max(dados$`% Prejuízo`, na.rm = TRUE) + 5, by = 5)

# Criar classes com cut()
prejuizo_classes <- cut(dados$`% Prejuízo`, breaks = breaks, right = FALSE)

# Criar a tabela de frequência
prejuizo_freq <- table(prejuizo_classes)
print(prejuizo_freq)

# INSIGHTS:
# 1. A maior parte dos sinistros está concentrada na faixa de 10% a 20% de prejuízo.
# 2. Poucos registros ultrapassam os 30%, indicando que perdas extremas são menos comuns.
