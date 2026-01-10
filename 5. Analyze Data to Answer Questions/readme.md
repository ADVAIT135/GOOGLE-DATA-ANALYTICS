# Analyze Data to Answer Questions

This folder contains datasets and supporting files for the "Analyze Data to Answer Questions" module of the Google Data Analytics Course. The materials here are intended for practicing exploratory data analysis (EDA), data cleaning, and answering real-world questions using CSV datasets.

## Contents 
- `readme.md` — (this file) detailed overview and usage notes.
- `Movie-Data.csv` — movie metadata including title, release date, genre, directors, cast, budget, and revenue.
- `big_queue_1.csv` — county-level birth statistics (sample rows).
- `big_queue_2.csv`, `big_queue_2_1.csv`, `big_queue_2_3.csv`, `big_queue_4.csv`, `big_queue_5.csv`, `big_queue_6.csv` — additional CSVs with birth statistics and weather-like station data.  
  - `big_queue_2_1.csv` appears to be station weather data (stn, date, temperature, wind_speed, precipitation).
  - Other `big_queue_*.csv` files contain county birth statistics (Year, County_of_Residence, FIPS, Births, Ave_Age_of_Mother, Ave_Birth_Weight_gms, Ave_Pre_pregnancy_BMI, Ave_Number_of_Prenatal_Wks, etc.)


## Data summary

- Movie dataset (Movie-Data.csv)
  - Columns: Movie Title, Release Date, Wikipedia URL, Genre, Director (1), Director (2), Cast (1..5), Budget, Revenue.
  - Useful for analyses like genre performance, ROI (revenue vs. budget), top actors/directors by revenue, release-year trends.

- Birth statistics datasets (big_queue_*.csv)
  - Typical columns: Year (date), County_of_Residence, County_of_Residence_FIPS, Births, Ave_Age_of_Mother, Ave_OE_Gestational_Age_Wks, Ave_LMP_Gestational_Age_Wks, Ave_Birth_Weight_gms, Ave_Pre_pregnancy_BMI, Ave_Number_of_Prenatal_Wks.
  - Useful for demographic trend analysis, county comparisons, maternal health indicators, time-series comparisons (2016–2018 sample rows present).

- Weather-like dataset (big_queue_2_1.csv)
  - Columns: stn, date, temperature, wind_speed, precipitation.
  - Useful to correlate weather with other metrics or practice time-series EDA.

## Quick start

Requirements:
- Python 3.8+
- pandas, matplotlib / seaborn (for visualization), jupyterlab or notebook (optional)

Examples:

- Load a CSV with pandas:
```python
import pandas as pd

movies = pd.read_csv("Movie-Data.csv")
births = pd.read_csv("big_queue_1.csv")
weather = pd.read_csv("big_queue_2_1.csv")
```

- Basic checks:
```python
print(movies.info())
print(movies.head())

print(births.describe())
print(weather['temperature'].mean())
```

- Sample analysis ideas:
  - Compute ROI for movies: (Revenue - Budget) / Budget.
  - Top 10 genres by total revenue or average ROI.
  - County-level birth trends across years (total births, average maternal age).
  - Correlate Ave_Pre_pregnancy_BMI with Ave_Birth_Weight_gms.
  - Time-series plots of temperature or precipitation for stations.

## Suggested analyses / questions to answer
- Which movie genres are most profitable (absolute and ROI)?
- How do budget and revenue correlate across movies? Are there outliers?
- Which counties show increasing/decreasing birth counts between 2016–2018?
- Are there patterns between average maternal age and birth weight?
- Can weather station data detect anomalies or seasonal patterns in temperature/precipitation?

## Reproducibility / recommended project structure
If you plan to expand this folder into an analysis project, consider:
- notebooks/
  - 01-EDA-movies.ipynb
  - 02-EDA-births.ipynb
  - 03-weather-analysis.ipynb
- scripts/
  - load_clean.py
  - analysis_helpers.py
- data/
  - raw/ (store these CSVs unchanged)
  - processed/ (cleaned/merged outputs)
- outputs/
  - figures/
  - tables/

Document data cleaning steps (missing values, date parsing, currency parsing for budgets/revenue).

## Data cleaning hints
- Budget / Revenue fields in `Movie-Data.csv` include currency formatting (e.g., "$15,000,000.00") — remove `$` and commas and convert to numeric.
- `Release Date` formats may vary; parse with `pd.to_datetime(..., dayfirst=False)` carefully.
- County files use `Year` formatted as a date string like `2018-01-01` — convert to `datetime` and/or extract year.
- Standardize county names and FIPS if you plan to join across files.
