library(shiny)
require(datasets)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Filter data based on selections
  output$table <- renderDataTable({
    cols <- c("NAME",colnames(USJudgeRatings))
    data <- cbind(rownames(USJudgeRatings),USJudgeRatings)
    colnames(data)=cols
    
    if (input$INTG != "All"){
      data <- data[data$INTG == input$INTG,]
    }
    if (input$DILG != "All"){
      data <- data[data$DILG == input$DILG,]
    }
    if (input$FAMI != "All"){
      data <- data[data$FAMI == input$FAMI,]
    }
    data
  })
  
})

