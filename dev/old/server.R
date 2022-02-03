#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$about <- renderPlot({
        plot(iris)
    })
    output$experience <- renderPlot({
        plot(mtcars)
    })
    output$education <- renderPlot({
        plot(airquality)
    })
    output$interests <- renderPlot({
        plot(AirPassengers)
    })
    output$awards <- renderPlot({
        plot(anscombe)
    })

})
