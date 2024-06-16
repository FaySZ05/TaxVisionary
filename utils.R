# Load necessary libraries
library(shiny)
library(shinydashboard)
library(leaflet)
library(htmltools)
library(ggplot2)
library(forecast)
library(rmarkdown)

# Load tax data
df <- data.frame(
  Year = 2014:2023,
  Total_Tax_Revenue = c(1146.9, 1240.4, 1285, 1435, 1518.8, 1546.1, 1404.1, 1473.6, 2034.5, 1869),
  Total_Tax_Revenue_Growth = c(7.0, 8.2, 3.6, 4.6, 13.0, 13.2, 10.8, 13.29, 31.4, 8.8), 
  Non_Migas_Tax_Revenue = c(897.7, 1011.2, 1069.9, 1100.7, 1248.6, 1273.3, 1166.8, 1227.3, 1560.7, 1800.45),
  Migas_Tax_Revenue = c(87.4, 49.7, 36.1, 50.3, 64.7, 39.1, 31.8, 33.1, 75.4, 68.79)
)
tax_revenue_comparison <- data.frame(
  Year = 2014:2023,
  Non_Migas_Tax_Revenue = c(897.7, 1011.2, 1069.9, 1100.7, 1248.6, 1273.3, 1166.8, 1227.3, 1560.7, 1800.45),
  Customs_and_Excise_Revenue = c(161.7, 179.6, 179.0, 192.5, 205.5, 213.4, 205.5, 213.2, 317.7, 300.1), 
  Migas_Tax_Revenue = c(87.4, 49.7, 36.1, 50.3, 64.7, 39.1, 31.8, 33.1, 75.4, 68.79)
)

browseURL("About.html")
# Set the input and output file names
input_file <- "About.rmd"
output_file <- "About.html"

# Render the RMD file to an HTML file
rmarkdown::render(input_file, output_file = output_file, output_dir = "output", quiet = FALSE)

# Define UI for application
ui <- dashboardPage(
  dashboardHeader(
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Tax Data", tabName = "tax_data", icon = icon("chart-line")),
      menuItem("Forecast", tabName = "forecast", icon = icon("chart-area"))
    )
  )
)

# Run the Shiny app
server <- function(input, output) {}

# Run the application
shinyApp(ui = ui, server = server)
