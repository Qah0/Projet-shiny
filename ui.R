library(shiny)
library(bslib)

fluidPage(
  titlePanel("Emissions de CO2 Emissions du volcan Mauna Loa"),
  sidebarPanel(
    h3("Quantité de CO2 émise par le volcan Mauna Loa à Hawaï de 1959 à 1997"),
    sliderInput("Range", "séléction de la plage de temps (années)", 
                min = 1959, max = 1997, value = c(1959, 1970), step = 1)
  ),
  mainPanel(
    h3("Représentation de l'évolution de la quantité de CO2 émise par année"),
    verbatimTextOutput("summary"),
    plotOutput("graphe")
  )
)
