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

# Definición de la interfaz de usuario ------------------------------------
fluidPage(
  
  ## Título de la aplicación -------------------------------------------------
  titlePanel("Convertidor de coordenadas"),
  
  ## Panel de entrada de coordenadas -----------------------------------------
  wellPanel(
    # h3("Convertir estas coordenadas"),
    
    ### Selector del tipo de notación de las coordenadas de entrada -----------
    radioButtons("tipo_coordenadas_origen",
                 label = "Notación de las coordenadas de entrada",
                 choices = opciones_notacion,
                 inline = TRUE),
    
    # Panel para entrada de coordenadas en grados-minutos-segundos
    conditionalPanel("input.tipo_coordenadas_origen == 'gms'",
                     strong("Longitud"),
                     fluidRow(
                       column(2,
                              numericInput("longitud_gms_grados",
                                           label = NULL,
                                           value = 99,
                                           min = 0,
                                           max = 180)),
                       column(1, "°"),
                       column(2,
                              numericInput("longitud_gms_minutos",
                                           label = NULL,
                                           value = 13,
                                           min = 0,
                                           max = 60)),
                       column(1, "'"),
                       column(2,
                              numericInput("longitud_gms_segundos",
                                           label = NULL,
                                           value = 17,
                                           min = 0,
                                           max = 60)),
                       column(1, "\""),
                       column(2,
                              radioButtons("longitud_gms_rumbo",
                                           label = NULL,
                                           choiceNames = c("O", "E"),
                                           choiceValues = c("W", "E"),
                                           inline = TRUE))
                     ),
                     strong("Latitud"),
                     fluidRow(
                       column(2,
                              numericInput("latitud_gms_grados",
                                           label = NULL,
                                           value = 19,
                                           min = 0,
                                           max = 90)),
                       column(1, "°"),
                       column(2,
                              numericInput("latitud_gms_minutos",
                                           label = NULL,
                                           value = 17,
                                           min = 0,
                                           max = 60)),
                       column(1, "'"),
                       column(2,
                              numericInput("latitud_gms_segundos",
                                           label = NULL,
                                           value = 30,
                                           min = 0,
                                           max = 60)),
                       column(1, "\""),
                       column(2,
                              radioButtons("latitud_gms_rumbo",
                                           label = NULL,
                                           choices = c("N", "S"),
                                           inline = TRUE))
                     )
                     
    ),
    
    # Panel para entrada de coordenadas en grados decimales
    conditionalPanel("input.tipo_coordenadas_origen == 'gd'",
                     "Selector de coordenadas GD"),
    
    # Panel para entrada de coordenadas proyectadas en UTM
    conditionalPanel("input.tipo_coordenadas_origen == 'utm'",
                     "Selector de coordenadas UTM")
    
  ),
  
  wellPanel(
    
    ### Selector del tipo de notación de las coordenadas de salida --------------
    uiOutput("tipo_coordenadas_salida"),
    
    # Panel para salida de coordenadas en grados-minutos-segundos
    conditionalPanel("input.tipo_coordenadas_salida == 'gms'",
                     "Coordenadas GMS"),
    
    # Panel para salida de coordenadas en grados decimales
    conditionalPanel("input.tipo_coordenadas_salida == 'gd'",
                     "Coordenadas GD"),
    
    # Panel para salida de coordenadas proyectadas en UTM
    conditionalPanel("input.tipo_coordenadas_salida == 'utm'",
                     "Coordenadas UTM")
    
  )
  
  # Sidebar with a slider input for number of bins
  # sidebarLayout(
  #   sidebarPanel(
  #   ),
  #   
  #   # Show a plot of the generated distribution
  #   mainPanel(
  #     h2("Coordenadas grados-minutos-segundos (GMS)"),
  
  #     hr(),
  #     verbatimTextOutput("salida"),
  #     hr(),
  #     leafletOutput("mapa_coordenada")
  #     
  #   )
  # )
)
