library(ggplot2)
library(ggforce)

dat = read.table(text="        x           y     sizes
                 1  1 .5
                 3  1 .5
                 5  1 .5
                 2  3  .75
                 4  3  .75
                 3  5.25  1", header=TRUE)

set.seed(194)
# generate a random vector of numbers between 1 and 6
y <- runif(30, min = 0.0, max = 7)
x <- runif(30, min = 0.0, max = 7)
df <- data.frame(x,y)

ggplot(dat) + 
  geom_circle(aes(x0=x, y0=y, r=sizes)) + coord_equal() + theme_classic() +
  geom_density_2d_filled(data = df, aes(x,y), alpha = .5) +
  geom_point(data = df, aes(x,y))

