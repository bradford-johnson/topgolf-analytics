# load packages
pacman::p_load(ggsankey,
               tidyverse)

tg <- read_csv("data/quick9.csv")

tg <- tg |>
  select(red_missed, yellow_missed, green_missed)

tg1 <- tg |>
  make_long(red_missed, yellow_missed, green_missed)

ggplot(tg1, aes(x = x,                        
                      next_x = next_x,                                     
                      node = node,
                      next_node = next_node,        
                      fill = factor(x),
                      label = node)) +
  geom_alluvial(flow.alpha = .6) +
  geom_alluvial_text(size = 3, color = "white") +
  theme_alluvial(base_size = 18)

