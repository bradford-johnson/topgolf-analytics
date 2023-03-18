library(ggplot2)
library(dplyr)
library(ggforce)
library(showtext)
library(htmltools)

showtext_auto()

dat <- readr::read_csv("data/targets-2.csv")

set.seed(58)
# generate a random vector of numbers between 1 and 6
y <- runif(200, min = 0.0, max = 13)
x <- runif(200, min = 0.0, max = 6)
df <- data.frame(x,y)

# add fonts
font_add(family = "fb",
         regular = "C:/Users/Bradf/AppData/Local/Microsoft/Windows/Fonts/Font Awesome 6 Brands-Regular-400.otf")

font_add_google(name = "Ubuntu", family = "Ubuntu")
font <- "Ubuntu"

font_add_google(name = "Dosis", family = "Dosis")
# load caption
caption = paste0("<span style='font-family:fb;'>&#xf09b;</span>",
                 "<span style='font-family:sans;color:white;'>.</span>",
                 "<span style='font-family:Dosis;'>bradfordjohnson</span>")
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

my_colors<- paletteer::paletteer_c("grDevices::Reds 2", 14, direction = -1)

tg +
  stat_density2d_filled(data = df, aes(x,y), alpha = .75) +
  scale_fill_manual(values = my_colors) +
  geom_circle(data = red_target, aes(x0=x, y0=y, r=size), color = t_red) +
  
  geom_circle(data = yellow_target, aes(x0=x, y0=y, r=size), color = t_yellow) +
  
  geom_circle(data = green_target, aes(x0=x, y0=y, r=size), color = t_green) +
  
  geom_circle(data = brown_target, aes(x0=x, y0=y, r=size), color = t_brown) +
  
  geom_circle(data = blue_target, aes(x0=x, y0=y, r=size), color = t_blue) +
  
  geom_circle(data = white_target, aes(x0=x, y0=y, r=size), color = t_white) +
  
  geom_rect(aes(xmin = 1.2, xmax = 4.8, ymin = 13.5, ymax = 14),
            color = t_trench, linewidth = .3, fill = NA) +
  
  scale_x_continuous(limits = c(0,8)) +
  
  geom_text(mapping = aes(x = 7.2, y = 1), label = "25 yd",
            family = font) +
  geom_text(mapping = aes(x = 7.2, y = 3), label = "50 yd",
            family = font) +
  geom_text(mapping = aes(x = 7.2, y = 5.25), label = "90 yd",
            family = font) +
  geom_text(mapping = aes(x = 7.2, y = 7.5), label = "125 yd",
            family = font) +
  geom_text(mapping = aes(x = 7.2, y = 9.25), label = "150 yd",
            family = font) +
  geom_text(mapping = aes(x = 7.2, y = 11.50), label = "185 yd",
            family = font) +
  geom_text(mapping = aes(x = 7.2, y = 13.75), label = "215 yd",
            family = font) +
  theme_void() +
  labs(title = "Topgolf Ball Heatmap",
       subtitle = "200 random balls",
       caption = caption) +
  theme(legend.position = "none",
        plot.caption = ggtext::element_textbox_simple(color="#3D4750", halign = 0.1, size = 13),
        plot.title = element_text(family = font, hjust = .5, size = 16, vjust = -1),
        axis.text = element_blank(),
        axis.title = element_blank(),
        plot.subtitle = element_text(family = font, hjust =.5, size = 12),
        panel.background = element_rect(fill = "#F1F1F1FF", color = "#F1F1F1FF"),
        plot.background = element_rect(fill = "#F1F1F1FF", color = "#F1F1F1FF"),
        plot.margin = unit(c(2,.5,3,.5),"mm"))

ggsave("test.png", height = 3, width = 2, dpi = 300)

