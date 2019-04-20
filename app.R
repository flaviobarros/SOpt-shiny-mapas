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

header <- dashboardHeaderPlus(title = "MONITOR",
                              titleWidth = 200
)

sidebar <- dashboardSidebar(
  width = 150,
  sidebarMenu(
    menuItem("Maps", tabName = "maps", icon = icon("globe-americas", lib = "font-awesome"))
  )
)

Boxm1 <-
  boxPlus(
    title = tags$b("States", style = 'font-family: "Georgia"'),
    closable = FALSE, 
    width = 6,
    status = "danger", 
    solidHeader = TRUE, 
    collapsible = TRUE,
    enable_dropdown = TRUE,
    dropdown_menu = dropdownItemList(map$NM_ESTADO), # What should i do here?
    leafletOutput("m1"), # What should i do here?
    footer = NULL
  )

Boxm2 <-
  boxPlus(
    title = tags$b("States", style = 'font-family: "Georgia"'),
    closable = FALSE, 
    width = 6,
    status = "danger", 
    solidHeader = TRUE, 
    collapsible = TRUE,
    enable_dropdown = TRUE,
    dropdown_menu = dropdownItemList(map$NM_ESTADO), # What should i do here?
    leafletOutput("m2"), # What should i do here?
    footer = NULL
  )

Boxm3 <-
  boxPlus(
    title = tags$b("States", style = 'font-family: "Georgia"'),
    closable = FALSE, 
    width = 6,
    status = "danger", 
    solidHeader = TRUE, 
    collapsible = TRUE,
    enable_dropdown = TRUE,
    dropdown_menu = dropdownItemList(map$NM_ESTADO), # What should i do here?
    leafletOutput("m3"), # What should i do here?
    footer = NULL
  )
body <- dashboardBody(
  tabItems(
    # Maps
    tabItem(tabName = "maps",
            fluidRow(
              Boxm2 # Maps
            )
    )
  )
)

ui <- dashboardPagePlus(header, sidebar, body)

## Server ##
server <- function(input, output) {
  
  output$m1 <- renderLeaflet({
    tmap_mode("view")
    IST <- inner_join(map, IST, by = c("NM_ESTADO" = "States"))
    IST <- IST[, c(3,1,2,4,5,6)]
    m1  <- tm_shape(IST, name = "Maps") +
      tm_polygons("I", palette = "Reds", title = "")
    tmap_leaflet(m1)
  })
  
  output$m2<-renderLeaflet({
    tmap_mode("view")
    IST1 <- inner_join(map, IST1, by = c("NM_ESTADO" = "States"))
    IST1 <- IST1[, c(3,1,2,4,5,6)]
    m2   <- tm_shape(IST1, name = "Maps") +
      tm_polygons("I", palette = "Reds", title = "")
    tmap_leaflet(m2)
  })
  
  output$m3<-renderLeaflet({
    tmap_mode("view")
    IST2 <- inner_join(map, IST2, by = c("NM_ESTADO" = "States"))
    IST2 <- IST2[, c(3,1,2,4,5,6)]
    m3   <- tm_shape(IST2, name = "Maps") +
      tm_polygons("I", palette = "Reds", title = "")
    tmap_leaflet(m3)
  })
  
}

## App ##
shinyApp(ui, server)