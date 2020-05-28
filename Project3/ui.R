#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(UsingR)
ui <- basicPage(
  
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(
        'input.dataset === "emissions"',
        helpText(" A data set listing GDP, GDP per capita, and CO2 emissions for 26 countries.")
      )
    ),
    
    mainPanel(
      tabsetPanel(
        id = 'dataset',
        tabPanel("emissions", DT::dataTableOutput("mytable1"))
  
  ),
    plotOutput("plot1", click = "plot_click"),
    verbatimTextOutput("info")
    )  
  )  
)