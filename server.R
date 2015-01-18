library(shiny)
library(datasets)
data(mtcars)
model2 <- lm(mpg ~ cyl + hp + wt, data = mtcars)
newdata <- data.frame(1, 1, 1)
names(newdata) <- c("cyl", "hp", "wt")

predictMPG <- function(cyl, hp, wt) {
  newdata[1,1] <- cyl
  newdata[1,2] <- hp
  newdata[1,3] <- wt
  p1 <- predict(model2, newdata, interval = ("prediction"))
  return(p1)
}

shinyServer(
  
  function(input, output) {
    
    output$ocyl <- renderPrint({input$cyl})
    output$ohp <- renderPrint({input$hp})
    output$owt <- renderPrint({input$wt})
    output$prediction <- renderPrint({predictMPG(as.numeric(input$cyl), input$hp, 
                                                 input$wt)[1,1]})
    output$chartMPG <- renderPlot({
      par(mfrow = c(1,2))
      plot(mtcars$hp, mtcars$mpg, xlab = "Horse Power of car", ylab = "MPG", col = "blue")
      plot(mtcars$wt, mtcars$mpg, xlab = "Weight of car", ylab = "MPG", col = "red")
    })
    
  }
  
  )