# ==========================================
# FA 5 LINEAR MODELS - Palmer Penguins
# ==========================================

# Install ggplot2 if not present
if(!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

# 1. Import Data directly from the source URL
url <- "https://raw.githubusercontent.com/allisonhorst/palmerpenguins/main/inst/extdata/penguins.csv"
penguins <- read.csv(url)

# 2. Part A: Data Preparation
# Remove observations with missing values in body_mass_g, species, and sex
penguins_clean <- subset(
  penguins,
  !is.na(body_mass_g) & !is.na(species) & !is.na(sex)
)

# Convert species and sex to factors
penguins_clean$species <- factor(penguins_clean$species)
penguins_clean$sex <- factor(penguins_clean$sex)

# Report final sample size
cat("Final sample size:", nrow(penguins_clean), "\n\n")

# 3. Part B: Exploratory Data Analysis
# Overall Descriptive Stats
cat("--- Overall Body Mass Stats ---\n")
summary(penguins_clean$body_mass_g)
cat("Standard Deviation:", sd(penguins_clean$body_mass_g), "\n\n")

# Means by category
cat("--- Mean Body Mass by Species ---\n")
aggregate(body_mass_g ~ species, data = penguins_clean, FUN = mean)

cat("\n--- Mean Body Mass by Sex ---\n")
aggregate(body_mass_g ~ sex, data = penguins_clean, FUN = mean)

cat("\n--- Mean Body Mass by Species & Sex ---\n")
aggregate(body_mass_g ~ species + sex, data = penguins_clean, FUN = mean)

# Visualization: Boxplot of body mass by species grouped by sex
p <- ggplot(penguins_clean, aes(x = species, y = body_mass_g, fill = sex)) +
  geom_boxplot() +
  labs(title = "Penguin Body Mass by Species and Sex",
       x = "Species", y = "Body Mass (g)") +
  theme_minimal()
print(p)

# 4. Part C: One-Way ANOVA
cat("\n--- Part C: One-Way ANOVA ---\n")
oneway_model <- aov(body_mass_g ~ species, data = penguins_clean)
summary(oneway_model)

# 5. Part D: Dummy-Variable Regression
cat("\n--- Part D: Dummy-Variable Regression ---\n")
dummy_model <- lm(body_mass_g ~ species, data = penguins_clean)
summary(dummy_model)

# 6. Part E: Two-Way ANOVA with Interaction
cat("\n--- Part E: Two-Way ANOVA ---\n")
twoway_model <- aov(body_mass_g ~ species * sex, data = penguins_clean)
summary(twoway_model)

# 7. Part G: Full Regression Model
cat("\n--- Part G: Full Regression Model ---\n")
full_model <- lm(body_mass_g ~ species * sex, data = penguins_clean)
summary(full_model)
anova(full_model)

# 8. Part F: Interaction Plot
interaction.plot(
  x.factor = penguins_clean$species,
  trace.factor = penguins_clean$sex,
  response = penguins_clean$body_mass_g,
  fun = mean,
  type = "b",
  xlab = "Penguin Species",
  ylab = "Mean Body Mass (g)",
  trace.label = "Sex",
  col = c("red", "blue"),
  lty = 1:2,
  pch = 16
)
