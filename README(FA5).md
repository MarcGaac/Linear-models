# FA 5 Linear Models

**Group Members:** [Gaac, Marc Henry C.]
**Research Question:** Does penguin body mass differ according to species and sex, and does the effect of species on body mass depend on sex?
**Dataset Description:** Data containing physical measurements of adult foraging penguins near Palmer Station, Antarctica.
**Dataset Source:** https://github.com/allisonhorst/palmerpenguins
**Variables Used:** body_mass_g (Response), species (Categorical Predictor), sex (Categorical Predictor).
**Statistical Methods:** One-Way ANOVA, Dummy-Variable Regression, Two-Way ANOVA, Full Interaction Regression.
**Brief Summary:** Body mass is significantly influenced by both species and sex. Males are heavier than females, and Gentoos are the heaviest species. However, there is no significant interaction effect; the weight difference between sexes is consistent across all species.
**Instructions to Reproduce:** Run the `FA5_Linear_Models.R` script located in the `R/` folder using R or RStudio to automatically install dependencies, load the dataset, and generate all models and figures.