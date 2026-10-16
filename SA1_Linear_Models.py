!pip install ucimlrepo

import pandas as pd
import numpy as np
import statsmodels.formula.api as smf
import statsmodels.api as sm
import seaborn as sns
import matplotlib.pyplot as plt
from ucimlrepo import fetch_ucirepo

# Generate the CSV file directly from the UCI repository
seoul_bike_sharing_demand = fetch_ucirepo(id=560)
df_raw = seoul_bike_sharing_demand.data.original
df_raw.to_csv('SeoulBikeData.csv', index=False)
print("SeoulBikeData.csv successfully generated!\n")

# Part A: Load and clean data
df = pd.read_csv('SeoulBikeData.csv')

# Explicitly rename all 14 columns to safe, symbol-free names
df.columns = [
    'Date', 'Rented_Bike_Count', 'Hour', 'Temperature', 'Humidity',
    'Wind_speed', 'Visibility', 'Dew_point_temp', 'Solar_Radiation',
    'Rainfall', 'Snowfall', 'Seasons', 'Holiday', 'Functioning_Day'
]

# Part B: EDA (Scatterplot)
sns.scatterplot(x='Temperature', y='Rented_Bike_Count', data=df, alpha=0.3)
plt.title('Bike Demand vs Temperature')
plt.show()

# Part C: Simple Linear Regression
slr = smf.ols('Rented_Bike_Count ~ Temperature', data=df).fit()
print("--- Simple Linear Regression ---")
print(slr.summary())

# Part D, E, G: Multiple Regression with Dummy Variables & Inference
mlr = smf.ols('Rented_Bike_Count ~ Temperature + Humidity + C(Seasons)', data=df).fit()
print("\n--- Multiple Linear Regression ---")
print(mlr.summary())

# Part F: Matrix Form Demonstration (Using a small subset of 5 rows)
subset = df.head(5)
X = sm.add_constant(subset[['Temperature', 'Humidity']])
y = subset['Rented_Bike_Count']
X_mat = np.array(X)
y_mat = np.array(y)
beta_hat = np.linalg.inv(X_mat.T @ X_mat) @ X_mat.T @ y_mat
print("\n--- Matrix Beta Hat (Intercept, Temp, Humidity) ---")
print(beta_hat)

# Part H: Two-Way ANOVA & Interactions
interaction_model = smf.ols('Rented_Bike_Count ~ Temperature * C(Seasons)', data=df).fit()
print("\n--- Two-Way ANOVA ---")
print(sm.stats.anova_lm(interaction_model, typ=2))

# Part I: Diagnostics (Residual Plot)
sns.residplot(x=interaction_model.fittedvalues, y=interaction_model.resid, lowess=True)
plt.title('Residuals vs Fitted (Constant Variance Check)')
plt.show()