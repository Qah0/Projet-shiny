library(shiny)
library(ggplot2)

function(input, output, session) {
  
  dataset <- reactive({
    co2_data <- datasets::co2  #on récupère les données de la base
    years <- time(co2_data)  # on récupère les données de temps pour pouvoir les exploiter
    data_range <- years >= input$Range[1] & years <= input$Range[2] #Intervalle des données séléctionées via le slider
    co2_data_filtered <- co2_data[data_range] #On sélectionne les données dans l'intervalle choisi
    years_filtered <- years[data_range]
    df <- data.frame(Year = years_filtered,
                     CO2 = as.numeric(co2_data_filtered))
    
  })
  
  output$summary <- renderPrint({
    summary(dataset())  
  })
  
  output$graphe <- renderPlot({
    ggplot(dataset(), aes(x = Year, y = CO2)) + 
      geom_line() +
      labs(title = "Emissions de CO2 du volcan", x = "Année", y = "Emissions de CO2") +
      theme_minimal()
  }, res = 96)
}
