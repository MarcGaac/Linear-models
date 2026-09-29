# Install and load ggplot2
if(!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

# Load dataset
data(diamonds)

# CRITICAL FIX for Dummy Variables:
# Convert 'cut' to an unordered factor and set 'Ideal' as the reference category
diamonds$cut <- factor(diamonds$cut, ordered = FALSE)
diamonds$cut <- relevel(diamonds$cut, ref = "Ideal")

# Part A: Examine the data
print(paste("Observations:", nrow(diamonds), "Variables:", ncol(diamonds)))
str(diamonds)
summary(diamonds)

# Part C: Additive model
model1 <- lm(price ~ carat + cut, data = diamonds)
summary(model1)

# Part D: Interaction model
model2 <- lm(price ~ carat * cut, data = diamonds)
summary(model2)

# Compare models using incremental F-test/ANOVA
anova(model1, model2)

# Part E: Visualization
ggplot(diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point(alpha = 0.3) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Diamond Price versus Carat by Cut",
    x = "Carat",
    y = "Price (US Dollars)"
  )
