# Load necessary libraries
library(dplyr)
library(tidyr)
library(plotly)

# Sample Data - replace this with your actual correlation data
correlation_data <- data.frame(
  Month = rep(month.name, each = 4),
  Correlation = runif(48, -1, 1),
  Significance = rep(c("Significant", "Non-Significant"), times = 24),
  Type = rep(c("Positive", "Negative"), each = 2, times = 12)
)

# Prepare data for sunburst chart
sunburst_data <- correlation_data %>%
  group_by(Month, Significance, Type) %>%
  summarise(Count = n(), .groups = 'drop')

# Create sunburst chart
sunburst_chart <- plot_ly(
  sunburst_data,
  labels = ~Month,
  parents = ~Significance,
  values = ~Count,
  type = 'sunburst'
)

# Show the chart
sunburst_chart
