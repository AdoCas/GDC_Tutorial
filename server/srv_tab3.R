# Function responsible for update de dropdown with the default query options
updateSelectInput(session = getDefaultReactiveDomain(), "t3_QueryType", choices=queryOptions, selected="cases")

# Function responsible for print in the screen the result function
output$t3_QueryTypeText <- renderText({
  paste(sprintf("myQuery = query(%s) \ndefault_fields(myQuery)", input$t3_QueryType))
})

# Function responsible for print in the screen the results of the function execution
output$t3_MyQuery <- renderPrint({
  paste(sprintf("myQuery = query(%s)", input$t3_QueryType))
  myQuery = query(input$t3_QueryType)
  default_fields(myQuery)
})