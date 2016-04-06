library(shiny)
shinyUI(
  pageWithSidebar(
  # Application Title
  headerPanel('Weight Loss Predictor'),
  sidebarPanel(
    numericInput('days', 'Days on Program', 1, min = 0, max = 200, step = 1),
    submitButton('Submit')
  ),
  mainPanel(
    h3('Days on Weight Loss Program'),
    verbatimTextOutput("inputValue1"),
    h3('Expected Weight Loss'),
    verbatimTextOutput("prediction"),
    plotOutput('wtplot')
  )
 )
)