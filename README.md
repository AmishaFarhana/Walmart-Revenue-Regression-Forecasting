# 🏬 Walmart Quarterly Revenue Forecasting

Time series forecasting project analyzing Walmart’s quarterly revenue (2005–2024) to predict revenues for 2025–2026.

This study focuses on regression-based forecasting models incorporating trend and seasonality.

---

## 📊 Dataset

- Walmart quarterly revenue
- Period: Q1 2005 – Q4 2024
- Units: Millions of USD
- Objective: Forecast Q1 2025 – Q4 2026

---

## 🔍 Exploratory Analysis

Observed components:

- Strong upward long-term trend
- Clear quarterly seasonality (Q4 peaks)
- No major structural breaks
- Stable growth pattern

---

## 🧠 Regression Models Tested

Five models were developed using `tslm()`:

1. Linear Trend  
2. Quadratic Trend  
3. Seasonality Only  
4. Linear Trend + Seasonality  
5. Quadratic Trend + Seasonality  

---

## 📈 Model Evaluation

Validation window: 16 quarters  

Models evaluated using:

- RMSE  
- MAPE  
- Adjusted R²  
- Statistical significance  

Top Performing Models:

- Linear Trend + Seasonality  
- Linear Trend  
- Quadratic Trend + Seasonality  

---

## 🏆 Final Model Selection

Final choice:

**Linear Trend + Seasonality**

Reason:

- Lowest MAPE on validation set
- Strong balance between simplicity and accuracy
- Statistically significant coefficients
- Captures both structural growth and seasonal pattern

---

## 🔄 Benchmark Comparison

Compared against:

- Naïve Forecast
- Seasonal Naïve Forecast

Regression models significantly outperformed both benchmarks.

---

## 🛠 Tools Used

- R
- `forecast`
- `ggplot2`
- `stats`

---

## 📌 Key Insights

- Trend + seasonality modeling is critical for retail revenue forecasting
- Including quarterly effects significantly improves accuracy
- Minimizing percentage error (MAPE) is especially important for large-scale revenue forecasting
- Simpler models can outperform more complex ones when properly specified

---

## 🚀 Final Outcome

Generated forward-looking forecasts for Walmart’s quarterly revenue for 2025–2026 using the best-performing regression model.
