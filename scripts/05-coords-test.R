library(ggplot2)
library(dplyr)
library(ggforce)

dat <- readr::read_csv("data/targets-2.csv")

set.seed(10)
# generate a random vector of numbers between 1 and 6
y <- runif(100, min = 0.0, max = 15)
x <- runif(100, min = 0.0, max = 6)
df <- data.frame(x,y)

# target colors
t_red <- "#F00016"

red_target <- dat %>%
    filter(color == "red")

t_yellow <- "#FFBB00"

  yellow_target <- dat %>%
    filter(color == "yellow")
  
t_green <- "#27B028"

  green_target <- dat %>%
    filter(color == "green")
  
t_brown <- "#BF5107"

  brown_target <- dat %>%
    filter(color == "brown")
  
t_blue <- "#006EB4"

  blue_target <- dat %>%
    filter(color == "blue")

t_white <- "#BDC1C0"

  white_target <- dat %>%
    filter(color == "white")
  
t_trench <- "#141615"

tg <- ggplot() + 
  geom_circle(data = red_target, aes(x0=x, y0=y, r=size), color = t_red,
              fill = t_red) +
  
  geom_circle(data = yellow_target, aes(x0=x, y0=y, r=size), color = t_yellow,
              fill = t_yellow) +
  
  geom_circle(data = green_target, aes(x0=x, y0=y, r=size), color = t_green,
              fill = t_green) +
  
  geom_circle(data = brown_target, aes(x0=x, y0=y, r=size), color = t_brown,
              fill = t_brown) +
  
  geom_circle(data = blue_target, aes(x0=x, y0=y, r=size), color = t_blue,
              fill = t_blue) +
  
  geom_circle(data = white_target, aes(x0=x, y0=y, r=size), color = t_white,
              fill = t_white) +
  
  geom_rect(aes(xmin = 1.2, xmax = 4.8, ymin = 13.5, ymax = 14), fill = t_trench,
            color = t_trench, linewidth = .3) +
  coord_equal() +
  theme_classic()

tg +
  geom_point(data = df, aes(x, y))

my_colors<- paletteer::paletteer_c("ggthemes::Green", 14)

tg +
  stat_density2d_filled(data = df, aes(x,y), alpha = .75) +
  theme_void() +
  scale_fill_manual(values = my_colors)


# tg +
#   stat_bin_hex(data = df, aes(x,y), bins = 12, alpha = .6)