library(shiny)

shinyUI(fluidPage(
  
  titlePanel(title = "Developing Data Products:  Course Project: 
             Predicting the MPG of a Car"),
  
  sidebarLayout(
    
    sidebarPanel(h3("Please enter in the information below:"),
                 radioButtons("cyl", "Enter in the number of Engine Cylinders on your car",
                              list("4", "6", "8")),
                 sliderInput("hp", "Select the desired Horse Power of your car", min = 52,
                             max = 335, value = 193, step = 20),
                 numericInput("wt", "Enter in the Weight of your car in Thousands of Lbs", 
                              3.0, min = 1.5, max = 5.5, step = 0.5),
                 submitButton("Click to submit your entries")),
    
    mainPanel(h3("Results of your entries and Predicted MPG"),
              h4("You entered the following number of Engine Cylinders:"),
              verbatimTextOutput("ocyl"),
              h4("You entered the following desired Horse Power:"),
              verbatimTextOutput("ohp"),
              h4("You entered the following Weight of your car:"),
              verbatimTextOutput("owt"),
              h4("Your predicted MPG is:"),
              verbatimTextOutput("prediction"),
              h4("Here is how MPG varies by Horse Power and Weight"),
              plotOutput("chartMPG"))
    )
  )
  )