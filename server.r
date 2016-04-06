
library(shiny)
library(MASS)

shinyServer(
  function(input, output) {

#plot(Weight~Days, data=wtloss, pch = 19)
fit <- lm(Weight~Days, data=wtloss)

#abline(coef(fit), col="blue")

samples <- c(1:200)
samples <- as.data.frame(samples)
names(samples)[1]<-paste("Days")
values <- predict(fit, newdata=samples, type = "response")
valuesdf <- as.data.frame(values)

loss <- function(day) valuesdf[1,1]-valuesdf[day,1]


    output$inputValue1 <- renderPrint({input$days})
    output$prediction <- renderPrint(
      {loss(input$days)})
    output$wtplot <- renderPlot({plot(
      Weight~Days, 
      data=wtloss, 
      pch = 19, 
      col= "red",
      ylab="Weight (in kg)", 
      xlab = "Days on Weight Loss Program",
      main= "Weight in Kilograms by Day")
      abline(coef(fit), col="blue")})

  }
)


