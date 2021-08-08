library(shiny)
library(shinyWidgets)
library(latex2exp)


shinyUI(fluidPage(
  # cHANGE APP BACKGROUND
  setBackgroundColor(
    color = "lightgrey",
    gradient = c("linear", "radial"),
    direction = c("bottom", "top", "right", "left"),
    shinydashboard = FALSE),
  
  fluidRow(
    column(12,offset=2,
           h1(id="big-heading", "CE 3105 Mechanics of Fluids Laboratory"),
           tags$style(HTML("#big-heading{color: red;}")),
           titlePanel(h1(id='big-heading'), windowTitle = 'CE3105')
           )),
    
  fluidRow(
    column(12,
           h2(id="sm-heading", "Experiment 1: Properties of Fluids - (a) Freshwater Density"),
           tags$style(HTML("#sm-heading{color: blue;}")),
          )),
  
  fluidRow(
    column(12,
           hr(),
           tags$h3('What is Density?'),
           tags$p("As fluids do not have a fixed shape, tt is not possible to define the mass of a fluid without knowing its volume.
           Density is defined as the ratio of mass of the fluid per unit volume of the fluid.  Therefore, density is a fundamental property of fluids"),
           tags$p("Density of a fluid depends upon several factors.  The temperature, pressure and impurities (or other substances) present in the fluids all affect density"),
           tags$p("As water is considered incompressible and the atmospheric pressure does not vary considerably on the surface of the earth, the density of water is a function of temperature and dissolved salts"),
           withTags(
             ul(
               li("Density generally decreases with temperature - due to volume expansion"),
               li("Water show abnormal behavior till 4 degree celsius"),
             )
           ),
           hr()
           )),

fluidRow(
    column(6,
           sliderInput("temp", 
                       "Temperature (Celsius):",
                       min = 0,
                       max = 50,
                       value =20),
           
           h4(id="outtxt",HTML(paste("Density of Water kg/m", tags$sup(3), sep = ""))),
           tags$style(HTML("outtxt{color: blue;}")),
           textOutput("out1"),),
    column(6,
           plotOutput("plt"),
    ))))
