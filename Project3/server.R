#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
# geom_smooth(aes(x=GDP, y=CO2, color=CO2))

library(shiny)
library(gridExtra)

data=(head(emissions, 26))
server <- function(input, output) {
    output$plot1 <- renderPlot({
        g1 <- ggplot(emissions, aes(x=GDP, y=CO2, color=CO2)) + geom_point(size=3.5) + labs(title="CO2 vs GDP") + geom_rug(col="steelblue",alpha=0.1, size=1.5) + geom_smooth(stat = 'smooth', color = 'Green', method = 'loess', formula = y ~ x) + 
            geom_text(
                label=rownames(data), 
                #hjust = 1.19, nudge_x = 0.25, 
                vjust = 1.4, nudge_y = 0.5,colour = "darkred",
                check_overlap = T
        
            ) 
       g1
        
    })
    
    
    # sorted columns are colored now because CSS are attached to them
    output$mytable1 <- DT::renderDataTable({
        DT::datatable(emissions, options = list(orderClasses = TRUE))
    })
    
    
    
    output$info <- renderPrint({
        # With ggplot2, no need to tell it what the x and y variables are.
        # threshold: set max distance, in pixels
        # maxpoints: maximum number of rows to return
        # addDist: add column with distance, in pixels
        nearPoints(emissions, input$plot_click, threshold = 10, maxpoints = 1)
    })
}