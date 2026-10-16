# APM1205: Summative Assessment 1

**Student Name:** Marc
**Course and Section:** APM1205 Linear Models (Data Analytics)
**Assessment Title:** Comprehensive Linear Modeling Analysis
**Dataset Source:** UCI Machine Learning Repository (Seoul Bike Sharing Demand)
**Research Question:** How do temperature, humidity, and seasonality interact to predict hourly bike-sharing demand in Seoul?
**Software Used:** Python

**Brief Description of the Analysis:** 
This analysis investigates the environmental and seasonal drivers of hourly bike rentals in Seoul. Using Multiple Linear Regression and Two-Way ANOVA, the model demonstrates that temperature and humidity significantly predict bike demand, while an interaction term reveals that the effect of temperature changes depending on the season. 

**Required Packages/Libraries:**
* pandas
* numpy
* statsmodels
* seaborn
* matplotlib
* ucimlrepo

**Instructions for Reproducing the Analysis:**
1. Clone this repository.
2. Ensure the required Python libraries are installed (`pip install pandas numpy statsmodels seaborn matplotlib ucimlrepo`).
3. Run the `SA1_Linear_Models.py` script located in the `code/` directory. The script will automatically fetch the dataset, generate the CSV, and output the statistical models and visualizations. 	