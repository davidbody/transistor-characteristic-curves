library(tidyverse)

V1_05 <- read_csv("2N3904/RigolDS0.csv", col_types = "dd??")
V1_05$V1 <- 0.5

V1_10 <- read_csv("2N3904/RigolDS1.csv", col_types = "dd??")
V1_10$V1 <- 1.0

V1_15 <- read_csv("2N3904/RigolDS2.csv", col_types = "dd??")
V1_15$V1 <- 1.5

V1_20 <- read_csv("2N3904/RigolDS3.csv", col_types = "dd??")
V1_20$V1 <- 2.0

V1_25 <- read_csv("2N3904/RigolDS4.csv", col_types = "dd??")
V1_25$V1 <- 2.5

V1_30 <- read_csv("2N3904/RigolDS5.csv", col_types = "dd??")
V1_30$V1 <- 3.0

V1_35 <- read_csv("2N3904/RigolDS6.csv", col_types = "dd??")
V1_35$V1 <- 3.5

V1_40 <- read_csv("2N3904/RigolDS7.csv", col_types = "dd??")
V1_40$V1 <- 4.0

V1_45 <- read_csv("2N3904/RigolDS8.csv", col_types = "dd??")
V1_45$V1 <- 4.5

V1_50 <- read_csv("2N3904/RigolDS9.csv", col_types = "dd??")
V1_50$V1 <- 5.0

t_df <- rbind(V1_05, V1_10, V1_15, V1_20, V1_25,
              V1_30, V1_35, V1_40, V1_45, V1_50)
t_df |>
  mutate(IB = as.factor(round((V1 / 33000)*1e6)),
         IC = ((CH1V - CH2V)/100)*1000, VCE = CH2V) |>
  ggplot(aes(VCE, IC, color = fct_reorder2(IB, VCE, IC))) +
  geom_line() +
  labs(title = "Transistor characteristic curves",
       subtitle = "2N3904",
       x = expression(paste(V[CE], " (V)")),
       y = expression(paste(I[C], " (mA)")),
       color = expression(paste(I[B], " (μA)"))) +
  theme_minimal()
