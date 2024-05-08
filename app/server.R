#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {
  
  gms_a_decimal <- function(grados, minutos, segundos, rumbo) {
    
    str_c(grados, "d", minutos, "'", segundos, '"', rumbo) %>% 
      char2dms() %>% 
      as.numeric() %>% 
      return()
    
  }
  
  longitud <- reactive(
    gms_a_decimal(input$longitud_gms_grados,
                  input$longitud_gms_minutos,
                  input$longitud_gms_segundos,
                  input$longitud_gms_rumbo)
  )
  
  latitud <- reactive(
    gms_a_decimal(input$latitud_gms_grados,
                  input$latitud_gms_minutos,
                  input$latitud_gms_segundos,
                  input$latitud_gms_rumbo)
  )
  
  
  output$tipo_coordenadas_salida <- renderUI({
    
    opciones_salida <- opciones_notacion[!opciones_notacion == input$tipo_coordenadas_origen]
    
    radioButtons("tipo_coordenadas_salida",
                 label = "Notación de las coordenadas deseadas",
                 choices = opciones_salida,
                 inline = TRUE)
    
  })
  
  output$mapa_coordenada <- renderLeaflet(
    
      leaflet() %>% 
      addProviderTiles(provider = "CartoDB.Positron") %>% 
      addMarkers(lng = longitud(),
                 lat = latitud())
    
  )
  
  output$salida <- renderText(
    str_c(latitud(),
          ", ",
          longitud())
    
  )
  
  
}
