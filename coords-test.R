library(ggplot2)
library(ggforce)

dat = read.table(text="        x           y     sizes
  34.856800  -82.260998 .021
                 34.857002  -82.260976 .021
                 34.857196  -82.260912 .021
                 34.857079  -82.260696 .013", header=TRUE)

ggplot(dat, aes(x0=x, y0=y, r=sizes)) + 
  geom_circle() + coord_equal() + theme_classic()
