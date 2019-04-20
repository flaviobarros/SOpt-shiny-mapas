## Options ##
options("scipen"=20)

## Pacotes ##
library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(shinyWidgets)
library(tmap)
library(dplyr)
library(leaflet)

## Loadind data ##
load(file = 'data/map.rda')
load(file = 'data/IST.rda')
load(file = 'data/IST1.rda')
load(file = 'data/IST2.rda')

## User Interface ##
## Cabeçalho
header <- dashboardHeaderPlus(title = "MONITOR",
                              titleWidth = 200
)

## Barra lateral
sidebar <- dashboardSidebar(
  width = 150,
  sidebarMenu(
    menuItem("Mapa1", tabName = "mapa1"),
    menuItem("Mapa2", tabName = "mapa2"),
    menuItem("Mapa2", tabName = "mapa3")
  )
)

## Caixa 1 para o mapa 1
Boxm1 <-
  boxPlus(
    title = tags$b("States", style = 'font-family: "Georgia"'),
    closable = FALSE, 
    width = 6,
    status = "danger", 
    solidHeader = TRUE, 
    collapsible = TRUE,
    enable_dropdown = TRUE,
    leafletOutput("m1"), # What should i do here?
    footer = NULL
  )

## Caixa 2 para o mapa 2
Boxm2 <-
  boxPlus(
    title = tags$b("States", style = 'font-family: "Georgia"'),
    closable = FALSE, 
    width = 6,
    status = "danger", 
    solidHeader = TRUE, 
    collapsible = TRUE,
    enable_dropdown = TRUE,
    leafletOutput("m2"), # What should i do here?
    footer = NULL
  )

## Caixa 3 para o mapa 3
Boxm3 <-
  boxPlus(
    title = tags$b("States", style = 'font-family: "Georgia"'),
    closable = FALSE, 
    width = 6,
    status = "danger", 
    solidHeader = TRUE, 
    collapsible = TRUE,
    enable_dropdown = TRUE,
    leafletOutput("m3"), # What should i do here?
    footer = NULL
  )

## Body do dashboard
body <- dashboardBody(
  tabItems(
    # Maps
    tabItem(tabName = "mapa1",
            fluidRow(
              Boxm1 # Maps
            )
    ),
    tabItem(tabName = "mapa2",
            fluidRow(
              Boxm2 # Maps
            )
    ),
    tabItem(tabName = "mapa3",
            fluidRow(
              Boxm3 # Maps
            )
    )
  )
)

ui <- dashboardPagePlus(header, sidebar, body)

## Server ##
server <- function(input, output) {
  
  output$m1 <- renderLeaflet({
    tmap_mode("view")
    IST <- inner_join(map, IST, by = c("NM_ESTADO" = "State"))
    IST <- IST[, c('NM_ESTADO', 'value', 'geometry')]
    m1  <- tm_shape(IST, name = "Maps") +
      tm_polygons(col = "value", palette = "Reds", title = "")
    tmap_leaflet(m1)
  })
  
  output$m2 <- renderLeaflet({
    tmap_mode("view")
    IST1 <- inner_join(map, IST1, by = c("NM_ESTADO" = "State"))
    IST1 <- IST1[, c('NM_ESTADO', 'value', 'geometry')]
    m2  <- tm_shape(IST1, name = "Maps") +
      tm_polygons(col = "value", palette = "Blues", title = "")
    tmap_leaflet(m2)
  })
  
  output$m3 <- renderLeaflet({
    tmap_mode("view")
    IST2 <- inner_join(map, IST2, by = c("NM_ESTADO" = "State"))
    IST2 <- IST2[, c('NM_ESTADO', 'value', 'geometry')]
    m3  <- tm_shape(IST2, name = "Maps") +
      tm_polygons(col = "value", palette = "Oranges", title = "")
    tmap_leaflet(m3)
  })
}

## App ##
shinyApp(ui, server)