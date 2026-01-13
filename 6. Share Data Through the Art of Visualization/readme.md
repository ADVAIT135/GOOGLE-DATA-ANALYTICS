# GOOGLE-DATA-ANALYTICS

This repository contains exercises, datasets, notebooks, and visualizations completed as part of the Google Data Analytics Professional Certificate. Work is organized by module and includes raw and cleaned data, analysis notes, and interactive Tableau dashboards.

---

## Table of contents
- Repository purpose
- What’s included
- Module highlights
- Dataset files (Excel) — Module 1, 2, 3
- Module 2 — Tableau dashboards (interactive)
- How to reproduce analyses


---

## Repository purpose
- Keep a single place for coursework, datasets, and visualizations for the Google Data Analytics program.
- Provide quick access to the Tableau dashboards created for Module 2 and to the Excel files used in Modules 1–3.
- Help you reproduce exercises, reshape and clean data, and re-create visuals.

---

## What’s included
- Module folders with notes and exercises (1 through 6+).
- Excel data files used in the assignments (listed below).
- Links to Tableau Public dashboards created for Module 2 assignments.
- Example notebooks and README files describing workflows per module.

---

## Dataset files (Excel) — Module 1, 2, 3
The following Excel workbooks are included in the repository and were used for Module assignments. Click each file name to view/download from GitHub:

- Module 2 — Bakery Sales Jan 2026.xlsx  
  - Path: 2. Ask Questions to Make Data-Driven Decisions/Bakery Sales Jan 2026.xlsx  
  - Link: [Bakery Sales Jan 2026.xlsx](https://github.com/ADVAIT135/GOOGLE-DATA-ANALYTICS/blob/main/2.%20Ask%20Questions%20to%20Make%20Data-Driven%20Decisions/Bakery%20Sales%20Jan%202026.xlsx)  
  - Short description: Daily bakery sales and product-level details for exploratory questions and revenue analysis.

- Module 2 — Population-Latin-and-Caribbean-Countries-2010-2019.xlsx  
  - Path: 2. Ask Questions to Make Data-Driven Decisions/Population-Latin-and-Caribbean-Countries-2010-2019.xlsx  
  - Link: [Population-Latin-and-Caribbean-Countries-2010-2019.xlsx](https://github.com/ADVAIT135/GOOGLE-DATA-ANALYTICS/blob/main/2.%20Ask%20Questions%20to%20Make%20Data-Driven%20Decisions/Population-Latin-and-Caribbean-Countries-2010-2019.xlsx)  
  - Short description: Population figures by country and year for Latin American & Caribbean countries (2010–2019).

- Module 3 — Population-Latin-and-Caribbean-Countries-2010-2019-wide-format.xlsx  
  - Path: 3. Prepare Data for Exploration/Population-Latin-and-Caribbean-Countries-2010-2019-wide-format.xlsx  
  - Link: [Population-Latin-and-Caribbean-Countries-2010-2019-wide-format.xlsx](https://github.com/ADVAIT135/GOOGLE-DATA-ANALYTICS/blob/main/3.%20Prepare%20Data%20for%20Exploration/Population-Latin-and-Caribbean-Countries-2010-2019-wide-format.xlsx)  
  - Short description: Same population dataset provided in wide format (one column per year) — useful for reshape / melt exercises.

---

## Module 2 — Tableau dashboards (Module assignments)
Interactive dashboards created for Module 2. Open the links to view the visualizations on Tableau Public:

- World Happiness — Module 2  
  [World Happiness — Module 2](https://public.tableau.com/views/WorldHappiness_17683188448680/Sheet2?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

- Module 2 Exercise 2 — Tableau Dashboard  
  [Module 2 Exercise 2 — Tableau Dashboard](https://public.tableau.com/views/Module2Exercise2_17683217061700/Sheet1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

- Module 2 Exercise 3 — Tableau Dashboard  
  [Module 2 Exercise 3 — Tableau Dashboard](https://public.tableau.com/views/MODULE2Ex3/Sheet1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

Relevant module folder (visualization / Module 6):  
[6. Share Data Through the Art of Visualization](https://github.com/ADVAIT135/GOOGLE-DATA-ANALYTICS/tree/08f83373ba9486a65100f292ff6d39ae1b0a3480/6.%20Share%20Data%20Through%20the%20Art%20of%20Visualization)

---

## How to reproduce analyses and visuals
Recommended tools:
- Quick checks / small edits: Microsoft Excel or Google Sheets.
- Reproducible analysis and reshaping: Python (pandas) or R (tidyverse).
- Visuals: Tableau Desktop / Tableau Public (dashboards are published on Tableau Public).

Example quick steps (pandas) to load and reshape the wide-format population file:
```python
import pandas as pd
df = pd.read_excel("3. Prepare Data for Exploration/Population-Latin-and-Caribbean-Countries-2010-2019-wide-format.xlsx")
# Melt wide -> long
year_cols = [c for c in df.columns if str(c).strip().isdigit()]
df_long = df.melt(id_vars=[df.columns[0]], value_vars=year_cols, var_name="year", value_name="population")
df_long.rename(columns={df_long.columns[0]: "country"}, inplace=True)
df_long['population'] = pd.to_numeric(df_long['population'], errors='coerce')
```
