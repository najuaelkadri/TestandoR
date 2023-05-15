library(ggplot2)
library(tidyr)
library(deSolve)

# Definindo a equação de crescimento logístico
logistic <- function(N, r, K) {
  dN <- r * N * (1 - N / K)
  return(dN)
}

# Definindo a ODE para o crescimento de C.reinhardtii e a degradação do plástico
ode.chlamyplastic <- function(t, y, N, params) {
  with(as.list(c(y, params)), {
    # Variação da densidade da Chlamy pelo tempo
    dN <- logistic(N, r, K) * N
    # Variação na concentração de plástico pelo tempo
    dS <- -Vmax * N * y[2] / (Km + y[2])
    return(list(c(dN, dS)))
  })
}

# Definindo as condições iniciais
N0 <- 1 # Densidade inicial da Chlamy (cells/ml)
S0 <- 100 # Concentração inicial de plástico (mg/L)

# Definindo os valores dos parâmetros
r <- 0.5 # Taxa de crescimento intrínseca (por dia)
K <- 1e9 # Capacidade de carga (cells/mL)
Vmax <- 0.5 # Taxa máxima de degradação do plástico (mg/L por dia)
Km <- 1 # Constante de Michaelis-Menten (mg/L)

# Definir o tempo em vetor
times <- seq(0, 20, by = 0.01)

# Resolvendo a equação diferencial
outresult <- ode(y = c(N0, S0), times = times, 
                 func = ode.chlamyplastic, parms = c(r = r,
                                                     K = K,
                                                     Vmax = Vmax,
                                                     Km = Km),
                 N = N0)

# Fazer o gráfico dos resultados
df <- as.data.frame(outresult)
names(df) <- c("time", "N", "S")
ggplot(df, aes(x = time)) +
  geom_line(aes(y = N, color = "Chlamydomonas reinhardtii")) +
  geom_line(aes(y = S, color = "Plastic")) +
  xlab("Time (days)") +
  ylab("Density (cells/ml) or Concentration (mg/L)") +
  ggtitle("Growth of Chlamydomonas reinhardtii and Degradation of Plastic")
