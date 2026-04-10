#----load data and packages ----
# load packages
library(readr)
library(psych)
library(lavaan)

# load data
data <- read_csv("data.csv")


#----clean Data----
str(data)
summary(data)
colSums(is.na(data))
colSums(data > 4, na.rm = TRUE)
colSums(data < -4, na.rm = TRUE)

#----Reliability----
# stress scale
stress<- data[,c("stress_1", "stress_2", "stress_3", "stress_4")]
alpha(stress)
data$stress_mean <- rowMeans(stress)

#anxiety total scale
anxiety <- data[,c("anxiety_trait_1", "anxiety_trait_2", "anxiety_trait_3", "anxiety_state_1", "anxiety_state_2", "anxiety_state_3")]
alpha(anxiety)
data$anxiety_mean <- rowMeans(anxiety)

#anxiety trait scale
anxiety_trait <- data[,c("anxiety_trait_1", "anxiety_trait_2", "anxiety_trait_3")]
alpha(anxiety_trait)                      
data$anxiety_trait_mean <-rowMeans(anxiety_trait)

#anxiety state mean
anxiety_state <- data[,c("anxiety_state_1", "anxiety_state_2", "anxiety_state_3")]
alpha(anxiety_state)                      
data$anxiety_state_mean <-rowMeans(anxiety_state)

#Wellbeing
wellbeing <- data[,c("wellbeing_1", "wellbeing_2", "wellbeing_3", "wellbeing_4")]
alpha(wellbeing)                      
data$wellbeing_mean <-rowMeans(wellbeing)

#----efa----
#stress scale
fa.parallel(stress, fa = "fa")
fa(stress, nfactors = 1, rotate = "oblimin")

#anxiety
fa.parallel(anxiety, fa = "fa")
fa(anxiety, nfactors = 2, rotate = "oblimin")

#wellbeing
fa.parallel(wellbeing, fa = "fa")
fa(wellbeing, nfactors = 1, rotate = "oblimin")

#----cfa----
#stress scale
stress_model <- 'stress =~ stress_1 + stress_2 + stress_3 + stress_4'
fit_stress <- cfa(stress_model, data = data)
summary(fit_stress, fit.measures = TRUE, standardized = TRUE)

#anxiety 1 or 2 factors
#1 factor
anxiety_model_1f <- 'anxiety =~ anxiety_trait_1 + anxiety_trait_2 + anxiety_trait_3 + anxiety_state_1 + anxiety_state_2 + anxiety_state_3'
fit_anxiety_model_1f <- cfa(anxiety_model_1f, data = data)
summary(fit_anxiety_model_1f,fit.measures = TRUE, standardized = TRUE )

#2 factors
anxiety_model_2f <- '
trait =~ anxiety_trait_1 + anxiety_trait_2 + anxiety_trait_3
state =~ anxiety_state_1 + anxiety_state_2 + anxiety_state_3
'
fit_anxiety_model_2f <- cfa(anxiety_model_2f, data = data)
summary(fit_anxiety_model_2f,fit.measures = TRUE, standardized = TRUE )

anova(fit_anxiety_model_1f, fit_anxiety_model_2f)

#wellbeing scale
wellbeing_model <- 'wellbeing_ =~ wellbeing_1 + wellbeing_2 + wellbeing_3 + wellbeing_4'
fit_wellbeing <- cfa(wellbeing_model, data = data)
summary(fit_wellbeing, fit.measures = TRUE, standardized = TRUE)

#----bifaktormodel anxiety----
# Bifactor model (not identified with current data)
# → see README for discussion
bifactor_model <- '
# General factor
g =~ anxiety_trait_1 + anxiety_trait_2 + anxiety_trait_3 +
     anxiety_state_1 + anxiety_state_2 + anxiety_state_3

# Specific factors
trait =~ anxiety_trait_1 + anxiety_trait_2 + anxiety_trait_3
state =~ anxiety_state_1 + anxiety_state_2 + anxiety_state_3

# Orthogonalität 
g ~~ 0*trait
g ~~ 0*state
trait ~~ 0*state
'
fit_bi <- cfa(bifactor_model, data = data)
summary(fit_bi, fit.measures = TRUE, standardized = TRUE)