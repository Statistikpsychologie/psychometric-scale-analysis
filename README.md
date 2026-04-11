# psychometric-scale-analysis

# Project Overview
This project was conducted for didactic purposes and focuses on the analysis of psychological measurement scales. The dataset used in this project was artificially generated using ChatGPT, and the README text was partially supported by ChatGPT as well.
The main goal of this project is to explore the psychometric properties of several constructs, with a particular focus on reliability and factor structure.

The analysis is focused on:
data cleaning
examination of the reliability (Cronbach’s Alpha)
building and evaluation of scale values
exploratory factor analysis
confirmation factor analysis

# Data description
The data set consists of multiple items measuring the following constructs:

Stress
Trait Anxiety
State Anxiety
Wellbeing

During data cleaning, it was observed that the variables appear to be standardized, which explains the presence of negative values across several scales. No missing values (NA) or extreme outliers were detected.

# Methods
Reliability Analysis

Internal consistency was assessed using Cronbach’s alpha. All scales showed high reliability, indicating strong internal consistency among the items.

Exploratory Factor Analysis (EFA)
Exploratory factor analyses were conducted to examine the underlying structure of the scales. Parallel analysis was used to determine the appropriate number of factors.

Results indicated:
A unidimensional structure for the stress scale
A multidimensional structure for the anxiety scale
Confirmatory Factor Analysis (CFA)

Confirmatory factor analyses were performed to test competing models:
Stress: one-factor model
Anxiety: one-factor vs. two-factor model (trait vs. state)

Model fit was evaluated using standard fit indices (CFI, TLI, RMSEA, SRMR).

# Results
Stress Scale

The stress scale showed excellent internal consistency (Cronbach’s α = .92). Corrected item-total correlations were consistently high, indicating strong homogeneity among the items. However, the high average inter-item correlation suggests potential redundancy, meaning that the items may capture very similar aspects of the construct.
Confirmatory factor analysis supported a unidimensional structure of the stress scale. The model demonstrated excellent fit (χ²(2) = 1.04, p = .593; CFI = 1.00; TLI = 1.00; RMSEA = 0.00; SRMR = 0.005). All items loaded strongly on the latent factor (λ = .83 – .87), indicating high measurement quality.


Anxiety Scale

The anxiety scales (trait and state) also showed high internal consistency (Cronbach's α = .88) for both sub scales.
Parallel analysis was used to determine the optimal number of factors. The results suggested a two-factor solution for the anxiety scale.

A one-factor model demonstrated poor fit, whereas a two-factor model (trait vs. state anxiety) showed excellent fit (χ²(8) = 8.03, p = .431; CFI = 1.00; TLI = 1.00; RMSEA = 0.003; SRMR = 0.013).
A chi-square difference test indicated that the two-factor model fits the data significantly better than the one-factor model (Δχ²(1) = 100.03, p < .001), providing strong evidence for a two-dimensional structure. 

All items loaded strongly on their respective factors (λ = .83 – .86). The two factors were highly correlated (r = .82), suggesting that they are closely related but still distinguishable constructs.
A bifactor model could not be reliably estimated, likely due to the limited number of items per subscale and the high correlation between factors. Therefore, the two-factor model is considered the most appropriate representation of the data.

# Discussion
The results suggest that stress can be treated as a single construct, while anxiety is better represented as a two-dimensional construct consisting of trait and state components.
Although the factors were strongly correlated, a bifactor model could not be reliably estimated, likely due to the limited number of items per subscale.

Note on Wellbeing Scale
The wellbeing scale was included in the analysis and is fully implemented in the code. However, it is not discussed in detail in this README, as the key methodological steps (reliability analysis, exploratory and confirmatory factor analysis) have already been demonstrated using the stress and anxiety scales. This decision was made for didactic clarity and to avoid redundancy.

# Limitations
The dataset was artificially generated and does not reflect real-world data
Limited number of items per construct
Bifactor model could not be identified

# Conclusion
This project demonstrates the application of reliability analysis, exploratory factor analysis, and confirmatory factor analysis in a didactic context. The findings highlight the importance of testing competing models when evaluating psychological constructs.
