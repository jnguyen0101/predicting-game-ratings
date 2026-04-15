library(tidyverse)
library(tidymodels)

test_results <- augment(final_fit)

# Let's pick 10 random games from the test set
scoreboard <- test_results |>
  select(name, price, actual = pct_pos_total, predicted = .pred) |>
  mutate(error = actual - predicted) |>
  slice_sample(n = 10)

print("--- Sample Predictions vs. Actual Ratings ---")
print(scoreboard)

# Create a scatter plot showing how close the points are to the 'perfect' line
ggplot(test_results, aes(x = pct_pos_total, y = .pred)) +
  geom_point(alpha = 0.2, color = "steelblue") +
  geom_abline(lty = 2, color = "darkred") +
  labs(
    title = "Actual vs. Predicted Positive Review %",
    subtitle = paste("Random Forest Test R-squared:", round(0.1468, 4)), # cite: 215
    x = "Actual Rating (%)",
    y = "Predicted Rating (%)"
  ) +
  theme_minimal()