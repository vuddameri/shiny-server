#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyWidgets)
shinyUI(fluidPage(
    # cHANGE APP BACKGROUND
    setBackgroundColor(
        color = "lightgrey",
        gradient = c("linear", "radial"),
        direction = c("bottom", "top", "right", "left"),
        shinydashboard = FALSE
    ),
    
    
    # Application title
    column(8,offset=2,
           titlePanel("CE 3105: Mechanics of Fluids Laboratory", windowTitle = 'CE3105'),
    ),
    column(12,offset=0,
           hr(),
           h2('Experiment 1: Fluid Properties',style='center'),
    ),
    
    column(12, offset = 0.5,
           HTML("Density is a fundamental property of fluids.  As fluids do not have a fixed shape, the mass of the fluid cannot be defined without
    knowing its volume.  Density is the ratio of the mass of the fluid to the volume of the fluid."),
           br(),
           hr(),
           
    ),
    fluidRow(   
        column(12,offset=0,
               sidebarPanel(
                   HTML('Explore how density of water changes with temperature'
                   ),),),
        column(12, offset = 0, 
               # Sidebar with a slider input for number of bins
               sidebarPanel(width=4,
                   sliderInput("temp", 
                               "Temperature (Celsius):",
                               min = 0,
                        max = 50,
                        value =20),
        ),
    ),

        # Show a plot of the generated distribution
    column(12,offset=0,
    sidebarPanel(div(style = "height:10px;background-color: green;"),
            h6( HTML(paste("Density of Water kg/m", tags$sup(3), sep = ""))),
            textOutput("out1"),
        ),),
    column(12,offset=0,
           hr(),),
)))
    
   





