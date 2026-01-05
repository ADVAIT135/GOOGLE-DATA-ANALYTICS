# 3. Prepare Data for Exploration

This directory contains the dataset and supporting notes used in the "Prepare Data for Exploration" section of the Google Data Analytics project. The goal of this step is to get the dataset into a clean, analysis-ready shape (tidy/long format), check for missing or inconsistent values, and create a reliable CSV or table that can be used for exploration and visualization.

## Contents
- `Population-Latin-and-Caribbean-Countries-2010-2019-wide-format.xlsx`  
  Population estimates for Latin American and Caribbean countries (2010–2019) in wide format (one column per year).
- `readme.md`  
  This file — explains the folder purpose, recommended workflow, example transformation steps, and skills gained.

## Data summary (expected)
- Format: Excel workbook (wide format)
- Typical layout:
  - First column: country name (e.g., `Country`)
  - Following columns: one column per year (e.g., `2010`, `2011`, ..., `2019`)
  - Cell values: population counts or estimates
- Notes: Confirm header row and any metadata rows (some Excel exports include notes or blank rows at the top).

## Recommended preparation workflow
1. Inspect the raw file
   - Open the Excel file to confirm header row, country names, and year columns.
   - Remove or note any extra metadata or footnote rows.

2. Clean and normalize
   - Ensure the country column is consistently named (`Country`) and trimmed of whitespace.
   - Convert year columns to numeric values if they contain formatting (commas, non-numeric characters).
   - Handle missing values: decide whether to impute, ignore, or mark as `NaN`.

3. Reshape (wide → long / tidy)
   - Convert the dataset from wide format (one column per year) to long format with columns like:
     - `country`, `year`, `population`
   - This format is recommended for most exploratory analysis and plotting libraries.

4. Validate
   - Check for duplicates, unexpected nulls, out-of-range values (negative populations), and country name inconsistencies.
   - Optionally cross-check totals or sample rows against a trusted source.

5. Export
   - Save a cleaned CSV for analysis: `population_latin_caribbean_2010_2019_clean.csv`.

## Example transformation (pandas)
If you prefer Python/pandas for reshaping and cleaning, here is a minimal example:

```python
import pandas as pd

# Read Excel (adjust sheet_name if needed)
df = pd.read_excel("Population-Latin-and-Caribbean-Countries-2010-2019-wide-format.xlsx")

# Inspect header and first rows
print(df.head())

# Assume the first column is 'Country' and years are 2010-2019
# Melt from wide to long
year_cols = [col for col in df.columns if str(col).strip().isdigit()]
df_long = df.melt(id_vars=[df.columns[0]], value_vars=year_cols,
                  var_name="year", value_name="population")

# Rename first column to 'country' (if needed)
df_long = df_long.rename(columns={df_long.columns[0]: "country"})

# Clean types
df_long['year'] = df_long['year'].astype(int)
df_long['population'] = pd.to_numeric(df_long['population'], errors='coerce')

# Trim whitespace from country names
df_long['country'] = df_long['country'].astype(str).str.strip()

# Save cleaned CSV
df_long.to_csv("population_latin_caribbean_2010_2019_clean.csv", index=False)
```

## Skills gained
Completing the "Prepare Data for Exploration" step develops the following skills:

- SQL
- Data Management
- Data Import/Export
- Data Security
- Google Sheets
- Unstructured Data
- Metadata Management
- Data Quality
- Data Literacy
- Data Storage
- Data Collection
- Databases

## Software / tools
- Quick inspection: Microsoft Excel, LibreOffice Calc, or Google Sheets
- For reproducible cleaning: Python (pandas) or R (tidyr/dplyr)
- Visualization: Google Data Studio, Tableau, matplotlib/seaborn, or ggplot2

## Next steps (after preparing the data)
- Perform exploratory data analysis: trends, growth rates, top/bottom countries by year
- Create visualizations: line charts of population over time, maps (choropleths), or small multiples
- Combine with other datasets (e.g., GDP, urbanization) for richer analysis

