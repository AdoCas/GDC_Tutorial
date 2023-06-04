updateSelectInput(session = getDefaultReactiveDomain(), "t5_QueryType", choices=queryOptions, selected="cases")

observe({
  req(input$t5_QueryType)
  myQuery = query(input$t5_QueryType)
  myFields<-default_fields(myQuery)
  updateSelectInput(session, "t5_Fields", choices=myFields, selected=head(myFields,1))  
})

observe({
  req(input$t5_QueryType)
  req(input$t5_Fields)
  myFieldValues<-available_values(input$t5_QueryType, input$t5_Fields)
  updateSelectInput(session, "t5_FieldValues", choices=myFieldValues, selected=head(myFieldValues,1))  
})

observe({
  req(input$t5_QueryType)
  req(input$t5_Fields)
  req(input$t5_FieldValues)
  
  output$t5_ResultQuery <- renderText({
    paste(sprintf("myQuery = query(%s) \nmyQuery = filter(myQuery,~ %s == %s) \nmyQuery %%>%% results_all()", input$t5_QueryType, input$t5_Fields, input$t5_FieldValues))
  })
  
  output$t5_ResultQueryConcatenated <- renderText({
    paste(sprintf("query('%s') %%>%% \nfilter(%s == '%s') %%>%% \nresults_all()", input$t5_QueryType, input$t5_Fields, input$t5_FieldValues))
  })
  
  output$t5_SelectedValuesInformation <- renderPrint({
    myQuery = query(input$t5_QueryType)
    myQuery = filter(myQuery,~ input$t5_Fields == input$t5_FieldValues)
    myQuery %>% results_all()  
  })
  
})