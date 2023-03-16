# load packages
pacman::p_load(ggsankey,
               tidyverse)

tg <- read_csv("data/quick9.csv")

tg <- tg |>
  select(red_missed, yellow_missed, green_missed)

tg1 <- tg |>
  make_long(red_missed, yellow_missed, green_missed)

pl <- ggplot(tg1, aes(x = x,                        
                     next_x = next_x,                                     
                     node = node,
                     next_node = next_node,        
                     fill = factor(x),
                     label = node)) +
  geom_sankey(flow.alpha = 0.5,          #This Creates the transparency of your node 
                      node.color = "black",
                      show.legend = TRUE,
              flow.fill = "gray60")  

pl +
  labs(title = "test",
       fill = "Nodes") +
  geom_sankey_text(size = 4, 
                   color = "black",
                   type = "sankey") +# This specifies the Label format for each node
scale_fill_manual(values = c("red", "yellow", "green"))
