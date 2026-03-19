# Load necessary libraries
library(ggplot2)
library(mapdata)
library(dplyr)

# (a) Load US state data and filter for California
states_data <- map_data("state")
california <- states_data %>% 
  filter(region == "california")
# (b) Load the wind turbine data
load("C:/Users/RJG11/Downloads/wind_turbines.rda")
wind_ca <- wind_turbines %>% 
  filter(t_state == "CA")
# (c) & (d) Visualize California and overlay wind turbine locations
ggplot() +
  geom_polygon(data = california, 
               aes(x = long, y = lat, group = group), 
               fill = "darkblue", 
               color = "lightgray") +
  geom_point(data = wind_ca, 
             aes(x = xlong, y = ylat),
             color = "orange", 
             alpha = 0.5, 
             size = 1) +
  guides(fill = "none") + 
  theme_minimal() +
  labs(title = "Wind Turbine locations CA",
       x = "Longitude",
       y = "Latitude")