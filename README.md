# Predicting Game Ratings on Steam

The goal of this project is to determine if a game's rating (percentage of positive reviews) can be predicted using its metadata, such as price, genres, and categories.

## Technical Details

- **Language:** R
- **Libraries:** `tidyverse`, `tidymodels`, `stringr`, `textrecipes`, `ranger`
- **Framework:** `tidymodels` for tidying, modeling, and workflow management

## Methodology

1. Data Cleaning & Preprocessing
- **Dataset:** ~90,000 Steam games as of March 2025.
- **Filtering:** Removed games with no reviews or zero peak concurrent users to ensure the analysis focused on active titles.
- **Feature Engineering:** Cleaned string formatting from `genres` and `categories`. Used `step_tokenize` and `step_tfidf` to convert text-based metadata into numeric predictors.

2. Modeling Workflow
- **Splitting:** Conducted a 75/25 training/testing split with strata on the outcome variable, `pct_pos_total`.
- **Base Model:** Linear Regression.
- **Alternate Model:** Random Forest using the `ranger` engine.
- **Validation:** Used 10-fold cross-validation on the training set to estimate model performance.
- **Tuning:** Performed a grid search to optimize `mtry` and `min_n` parameters.

## Key Results

The Random Forest model outperformed the base linear regression by better capturing non-linear relationships between predictors like price and concurrent users.


| Metric | Base (Linear Regression) | Final (Random Forest) |
| :------- | :------: | -------: |
| RMSE | ~13.3 | ~12.8 |
| $R^2$ | ~0.075 | ~0.147 |

## Insights & Discussion

While the Random Forest model improved performance, the relatively low $R^2$ suggests that metadata alone only explains a small portion of the variance in user reviews. Factors such as art style, gameplay polish, and brand reputation likely play a more significant role in a game's success.
