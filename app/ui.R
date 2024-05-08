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
                       column(3,
                              autonumericInput("longitud_gms_grados",
                                               label = NULL,
                                               value = 99,
                                               currencySymbol = "°",
                                               currencySymbolPlacement = "s",
                                               decimalPlaces = 0,
                                               minimumValue = 0,
                                               maximumValue = 180)),
                       column(3,
                              autonumericInput("longitud_gms_minutos",
                                               label = NULL,
                                               value = 13,
                                               currencySymbol = "'",
                                               currencySymbolPlacement = "s",
                                               decimalPlaces = 0,
                                               minimumValue = 0,
                                               maximumValue = 60)),
                       column(3,
                              autonumericInput("longitud_gms_segundos",
                                               label = NULL,
                                               value = 17,
                                               currencySymbol = '"',
                                               currencySymbolPlacement = "s",
                                               decimalPlaces = 2,
                                               min = 0,
                                               max = 60)),
                       column(3,
                              selectInput("longitud_gms_rumbo",
                                          label = NULL,
                                          choices = list("O/W" = "W",
                                                         "E" = "E"))
                       )
                     ),
                     strong("Latitud"),
                     fluidRow(
                       column(3,
                              autonumericInput("latitud_gms_grados",
                                               label = NULL,
                                               value = 19,
                                               currencySymbol = "°",
                                               currencySymbolPlacement = "s",
                                               decimalPlaces = 0,
                                               minimumValue = 0,
                                               maximumValue = 90)),
                       column(3,
                              autonumericInput("latitud_gms_minutos",
                                               label = NULL,
                                               value = 17,
                                               currencySymbol = "'",
                                               currencySymbolPlacement = "s",
                                               decimalPlaces = 0,
                                               min = 0,
                                               max = 60)),
                       column(3,
                              autonumericInput("latitud_gms_segundos",
                                               label = NULL,
                                               value = 30,
                                               currencySymbol = '"',
                                               currencySymbolPlacement = "s",
                                               decimalPlaces = 2,
                                               minimumValue = 0,
                                               maximumValue = 60)),
                       column(3,
                              selectInput("latitud_gms_rumbo",
                                          label = NULL,
                                          choices = c("N", "S"))
                       )
                     )
                     
    ),
    
    # Panel para entrada de coordenadas en grados decimales
    # 19.2916666666667, -99.2213888888889
    conditionalPanel("input.tipo_coordenadas_origen == 'gd'",
                     fluidRow(
                       column(6,
                              autonumericInput("longitud_gd",
                                               label = "Longitud",
                                               value = -99.22139,
                                               decimalPlaces = 5,
                                               minimumValue = -180,
                                               maximumValue = 180)),
                       column(6,
                              autonumericInput("latitud_gd",
                                               label = "Latitud",
                                               value = -19.29167,
                                               decimalPlaces = 5,
                                               minimumValue = -90,
                                               maximumValue = 90))
                     )
    ),
    
    # Panel para entrada de coordenadas proyectadas en UTM
    conditionalPanel("input.tipo_coordenadas_origen == 'utm'",
                     fluidRow(
                       column(4, 
                              autonumericInput("x_utm",
                                               label = "X",
                                               value = 445000,
                                               currencySymbol = "m",
                                               currencySymbolPlacement = "s",
                                               decimalPlaces = 2,
                                               minimumValue = 0)),
                       column(4, 
                              autonumericInput("y_utm",
                                               label = "Y",
                                               value = 445000,
                                               currencySymbol = "m",
                                               currencySymbolPlacement = "s",
                                               decimalPlaces = 2,
                                               minimumValue = 0)),
                       column(4, 
                              selectInput("zona_utm",
                                          label = "Zona",
                                          choices = c("13N", "14N"))
                       )
                     )
    )
    
  ),
  
  wellPanel(
    
    ### Selector del tipo de notación de las coordenadas de salida --------------
    uiOutput("tipo_coordenadas_salida"),
    
    verbatimTextOutput("salida"),
    
    # Panel para salida de coordenadas en grados-minutos-segundos
    conditionalPanel("input.tipo_coordenadas_salida == 'gms'",
                     "Coordenadas GMS"),
    
    # Panel para salida de coordenadas en grados decimales
    conditionalPanel("input.tipo_coordenadas_salida == 'gd'",
                     "Coordenadas GD"),
    
    # Panel para salida de coordenadas proyectadas en UTM
    conditionalPanel("input.tipo_coordenadas_salida == 'utm'",
                     "Coordenadas UTM")
    
  ),
  
  wellPanel(
    
    strong("Ubicación de la coordenada"),
    p(),
    leafletOutput("mapa_coordenada")
    
  )
  
)
