updateSelectInput(session = getDefaultReactiveDomain(), "t3_QueryType", choices=queryOptions, selected="cases")

output$t3_QueryTypeText <- renderText({
  paste(sprintf("myQuery = query(%s) \ndefault_fields(myQuery)", input$t3_QueryType))
})

output$t3_MyQuery <- renderPrint({
  paste(sprintf("myQuery = query(%s)", input$t3_QueryType))
  myQuery = query(input$t3_QueryType)
  default_fields(myQuery)
})