#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
# 19°17'30"N 99°13'17"O

# Define UI for application that draws a histogram
fluidPage(
  
  # Application title
  titlePanel("Convertidor de coordenadas"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h2("Coordenadas grados-minutos-segundos (GMS)"),
      h3("Longitud"),
      numericInput("longitud_gms_grados",
                   label = "Grados",
                   value = 99,
                   min = 0,
                   max = 180),
      numericInput("longitud_gms_minutos",
                   label = "Minutos",
                   value = 13,
                   min = 0,
                   max = 60),
      numericInput("longitud_gms_segundos",
                   label = "Segundos",
                   value = 17,
                   min = 0,
                   max = 60),
      radioButtons("longitud_gms_rumbo",
                   label = "Rumbo",
                   choiceNames = c("O", "E"),
                   choiceValues = c("W", "E")),
      h3("Latitud"),
      numericInput("latitud_gms_grados",
                   label = "Grados",
                   value = 19,
                   min = 0,
                   max = 90),
      numericInput("latitud_gms_minutos",
                   label = "Minutos",
                   value = 17,
                   min = 0,
                   max = 60),
      numericInput("latitud_gms_segundos",
                   label = "Segundos",
                   value = 30,
                   min = 0,
                   max = 60),
      radioButtons("latitud_gms_rumbo",
                   label = "Rumbo",
                   choices = c("N", "S")),
      hr(),
      verbatimTextOutput("salida"),
      hr(),
      leafletOutput("mapa_coordenada")
      
    )
  )
)
