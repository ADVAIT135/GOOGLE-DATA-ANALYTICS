# 4. Process Data from Dirty to Clean

This folder contains datasets and example exercises focused on data cleaning and preprocessing — transforming "dirty" real-world data into analysis-ready, "clean" data. The materials are suitable for hands-on practice with typical cleaning tasks such as trimming whitespace, fixing types, handling missing or malformed values, parsing combined fields, and normalizing categorical values.

## Contents

- `automobile_data.csv`  
  - A small automobile dataset with columns such as `make`, `fuel_type`, `num_of_doors`, `engine_size`, `horsepower`, `city_mpg`, `highway_mpg`, `price`, etc.
  - Observed dirtiness examples: textual numbers (e.g., `"four"` for cylinders), trailing spaces in some cells, numeric fields represented as strings, and zero-valued `price` entries that likely indicate missing values.

- `sf_boba_tea_shop_data.csv`  
  - San Francisco / Bay Area boba shop listings with fields like `id`, `name`, `rating`, `address`, `city`, `lat-long`, `lat`, `long`.
  - Observed dirtiness examples: `lat-long` field uses a hyphen as a separator and may collide with the negative sign of longitude; addresses and city fields contain extra spaces; some rows may have inconsistent formatting.

- `readme.md` (this file — improved)  

## Objectives / Learning Goals

- Identify and document common data quality issues in small real datasets.
- Apply practical cleaning steps:
  - Normalize whitespace and capitalization.
  - Parse combined fields (e.g., `lat-long`).
  - Convert columns to appropriate dtypes (int, float, category).
  - Map textual numerals to integers (e.g., `"four"` → `4`).
  - Handle placeholder or invalid values (e.g., `0` for price).
  - Detect and remove duplicates and obvious outliers.
- Produce clean CSV outputs that are ready for analysis or modeling.

## Suggested Cleaning Steps (high-level)

1. Inspect data with `head()`, `info()`, and `describe()` to find anomalies.
2. Strip leading/trailing whitespace and normalize casing for categorical fields.
3. Parse and validate coordinates:
   - Use a robust regex to split `lat-long` into numeric `lat` and `long`.
4. Convert numeric-like strings to numeric dtypes (use `pd.to_numeric(..., errors='coerce')`).
5. Map textual words-to-numbers for columns like `num_of_cylinders` or `num_of_doors`.
6. Treat sentinel/placeholder values (e.g., `0` price) as missing (`NaN`) and decide whether to impute or drop.
7. Remove duplicates and rows with irrecoverable errors.
8. Save cleaned datasets as `*_clean.csv`.

## Example Python (pandas) Cleaning Snippets

Save these snippets into a notebook or script and adapt as needed.

- Common imports / requirements
```python
# requirements: pandas, numpy
import re
import numpy as np
import pandas as pd
```

- Basic cleaning utilities
```python
def strip_whitespace(df):
    str_cols = df.select_dtypes(include='object').columns
    for c in str_cols:
        df[c] = df[c].astype(str).str.strip()
    return df

def words_to_int(s):
    mapping = {
        'one': 1, 'two': 2, 'three': 3, 'four': 4, 'five': 5, 'six': 6,
        'seven': 7, 'eight': 8, 'nine': 9, 'ten': 10
    }
    return mapping.get(s.lower(), np.nan) if isinstance(s, str) else s
```

- Example: clean `automobile_data.csv`
```python
df = pd.read_csv('automobile_data.csv')
df = strip_whitespace(df)

# Map word-based cylinder counts to integers
if 'num_of_cylinders' in df.columns:
    df['num_of_cylinders_clean'] = df['num_of_cylinders'].map(lambda x: words_to_int(x) if isinstance(x, str) else x)

# Convert horsepower, engine_size, price to numeric (coerce errors to NaN)
for col in ['horsepower', 'engine_size', 'price', 'city_mpg', 'highway_mpg']:
    if col in df.columns:
        df[col] = pd.to_numeric(df[col], errors='coerce')

# Treat price == 0 as missing
if 'price' in df.columns:
    df.loc[df['price'] == 0, 'price'] = np.nan

# Additional normalizations
df['drive_wheels'] = df['drive_wheels'].str.strip()
df.drop_duplicates(inplace=True)

df.to_csv('automobile_data_clean.csv', index=False)
```

- Example: parse `lat-long` in `sf_boba_tea_shop_data.csv`
```python
df = pd.read_csv('sf_boba_tea_shop_data.csv')
df = strip_whitespace(df)

# Robust parsing of "lat-long" that handles negative longitudes.
# It expects a pattern like: 37.56295-122.01004 or -37.56--122.01 (less likely),
# so use regex to capture two floats separated by a single hyphen.
def parse_latlong(s):
    if not isinstance(s, str):
        return (np.nan, np.nan)
    m = re.match(r'^\s*([+-]?\d+\.\d+)\s*-\s*([+-]?\d+\.\d+)\s*$', s)
    if m:
        return float(m.group(1)), float(m.group(2))
    return (np.nan, np.nan)

if 'lat-long' in df.columns:
    parsed = df['lat-long'].apply(parse_latlong)
    df['lat_parsed'] = parsed.apply(lambda x: x[0])
    df['long_parsed'] = parsed.apply(lambda x: x[1])

# Prefer parsed lat/long columns; convert existing lat/long to numeric
for col in ['lat', 'long', 'lat_parsed', 'long_parsed']:
    if col in df.columns:
        df[col] = pd.to_numeric(df[col], errors='coerce')

# If lat_parsed exists and is valid, use it to fill lat
if 'lat_parsed' in df.columns:
    df['lat'] = df['lat'].fillna(df['lat_parsed'])
    df['long'] = df['long'].fillna(df['long_parsed'])

df.drop(columns=['lat_parsed', 'long_parsed'], inplace=True, errors='ignore')
df.to_csv('sf_boba_tea_shop_data_clean.csv', index=False)
```

## Validation & QA

- After cleaning, run:
  - `df.isna().sum()` to review remaining missingness.
  - `df.describe()` and `df['category'].value_counts()` to confirm distributions.
  - Geospatial sanity checks (latitude in [-90,90], longitude in [-180,180]).
- Create small unit tests or assertions for critical assumptions (e.g., price >= 0, valid coordinate ranges).

## Where to Go Next

- Build exploratory visualizations using the cleaned datasets.
- Use the automobile dataset to practice regression or classification (price prediction, mpg analysis).
- Use the boba shop data for mapping, clustering (by region), or analyzing ratings distribution.

