# 1 — Foundations: Data, Data, Everywhere

This directory contains materials for Module 1 of the "Google Data Analytics" collection: Foundations — an introduction to what data is, why it matters, and the core concepts you'll use throughout the course.

Link to this module on GitHub:
https://github.com/ADVAIT135/GOOGLE-DATA-ANALYTICS/tree/b5621f16243c2719fc7622219455c683c00f927f/1.%20Foundations%3A%20Data%2C%20Data%2C%20Everywhere

## Module overview

This module introduces the fundamentals of data analytics:

- What data is and common data types
- Typical sources of data (surveys, logs, transactional systems, public datasets)
- The data lifecycle: collection, storage, cleaning, analysis, visualization, and communication
- Basic data quality concepts and why they matter
- Introductory tools and file formats used by data analysts

By the end of this module you should be able to:
- Explain the role of data in decision-making
- Distinguish between structured and unstructured data
- Identify common file formats and storage locations
- Open and inspect simple datasets with a notebook
- Apply basic cleaning and sanity checks

## Contents (expected)

This module is organized so you can read theory, try hands-on notebooks, and complete exercises.

- slides/ — lecture slides and PDFs
- notebooks/
  - 01-introduction.ipynb — conceptual walkthrough and short hands-on examples
  - 02-data-types-and-formats.ipynb — examples of CSV, JSON, TSV, Parquet, etc.
  - 03-data-quality-checks.ipynb — simple cleaning & validation patterns
- data/ — small sample datasets used by the notebooks (CSV/JSON)
- exercises/ — practice problems and datasets
- solutions/ — (optional) instructor solutions for exercises
- assets/ — images, diagrams, and helper scripts
- README.md — this file

If any of these folders are missing, check the repository root or the course index for alternate locations. The module is designed to be self-contained with small datasets so you can run examples locally.

## Quickstart (recommended local setup)

1. Clone the repository:
   ```bash
   git clone https://github.com/ADVAIT135/GOOGLE-DATA-ANALYTICS.git
   cd "GOOGLE-DATA-ANALYTICS/1. Foundations: Data, Data, Everywhere"
   ```

2. Create a Python virtual environment (optional but recommended):
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate   # macOS / Linux
   .venv\Scripts\activate      # Windows (PowerShell)
   ```

3. Install common packages (create a requirements.txt in repo root if one does not exist). Example:
   ```bash
   pip install --upgrade pip
   pip install jupyterlab notebook pandas numpy matplotlib seaborn
   ```

4. Start Jupyter:
   ```bash
   jupyter lab
   ```
   Open the notebooks in `notebooks/` and run the cells.

Alternative: Open notebooks in Google Colab
- Use this template to open a notebook directly in Colab:
  https://colab.research.google.com/github/ADVAIT135/GOOGLE-DATA-ANALYTICS/blob/b5621f16243c2719fc7622219455c683c00f927f/1.%20Foundations%3A%20Data%2C%20Data%2C%20Everywhere/notebooks/01-introduction.ipynb
(Replace `01-introduction.ipynb` with the notebook you want to open.)

## How to use the materials

- Read the slides for conceptual background.
- Run the notebooks to see examples and live code.
- Attempt exercises before checking solutions.
- Experiment by modifying notebook cells and using your own datasets.

Tips:
- Keep datasets small while learning to keep runtimes low.
- Use version control (git) to track changes in your notebooks. Consider tools like `nbdime` to diff notebooks effectively.

## Suggested learning path for this module

1. Read slides/overview
2. Complete notebooks in order:
   - 01-introduction.ipynb
   - 02-data-types-and-formats.ipynb
   - 03-data-quality-checks.ipynb
3. Attempt exercises and check solutions if stuck
4. Explore additional resources (links below)

## Additional resources and references

- "Data Science for Business" — Foster Provost & Tom Fawcett (concepts)
- pandas documentation — https://pandas.pydata.org/
- Jupyter documentation — https://jupyter.org/
- Google’s Data Analytics Certificate materials (course notes and exercises)

## Contributing

Contributions, corrections, and improvements are welcome.

- If you find errors in notebooks or slides, open an issue or a pull request in the main repository with a clear description.
- For exercises: keep solution files in `solutions/` and mark them clearly to avoid spoiling challenge problems for other learners.

If you want to propose major changes, please open an issue first describing the change so maintainers can review.

## License

Unless otherwise noted in the repository, content in this module is provided under the same license as the parent repository. Check the repo root for a LICENSE file.

## Contact / Maintainer

For questions about the materials in this module, open an issue in the repository or contact the maintainer listed on the project page.
