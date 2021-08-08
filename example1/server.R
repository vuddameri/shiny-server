#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(latex2exp)
library(shiny)
dens <- function(t)
{
    rhoo <- 999.83592
    A <- 16.945176 * t
    B <- -7.9870401E-3 * t^2
    C <- -46.170461E-6 * t^3
    D <- 105.56302E-9 * t^4
    E <- -280.54253E-12 *t^5
    eF <- 1 + 16.897850E-3*t 
    rhot <- (rhoo + A + B + C + D + E)/eF
    zz <- cbind(A, B, C, D, E, eF, rhot)
    return(rhot)
}

# Define server logic required to draw a histogram
function(input, output) {
        # generate temperatures
        t    <- reactive({input$temp})
        output$out1 <- renderPrint({dens(t())})
        
        tempe <- seq(0,50,0.25)
        densx <- dens(tempe)
        densy <- reactive({dens(t())})
        output$plt <- renderPlot(
            {
                        par(mgp=c(2.5,1,0))
                        xlabx <- TeX('Temperature $^oC$')
                        ylaby <- TeX('Density of Water $kg/m^3$')
                        plot(tempe,densx,xlab=xlabx,ylab=ylaby,col='blue')
                        points(t(),densy(),col='red',pch=20,cex=3)
                        grid()
                        title('Density of Freshwater')})
}
