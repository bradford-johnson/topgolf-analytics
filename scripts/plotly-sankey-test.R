library(plotly)

fig <- plot_ly(
  type = "sankey",
  orientation = "h",
  
  node = list(
    label = c("R1", "R2", "R3", "R4", "Y1", "Y2", "Y3", "Y4", "G1", "G2", "G3", "G4"),
    color = c("red", "red", "red", "red", "yellow", "yellow", "yellow", "yellow", "green", "green", "green", "green"),
    pad = 15,
    thickness = 20,
    line = list(
      color = "black",
      width = 0.5
    )
  ),
  
  link = list(
    source = c(0,1,2,3,4,5,6,7),
    target = c(4,5,6,7,8,9,10,11),
    value =  c(1,1,1,1,1,1,1,1)
  )
)
fig <- fig %>% layout(
  title = "Basic Sankey Diagram",
  font = list(
    size = 10
  )
)

fig

