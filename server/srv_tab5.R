# Function responsible for update de dropdown with the available query options
updateSelectInput(session = getDefaultReactiveDomain(), "t5_QueryType", choices=queryOptions, selected="cases")

# Function responsible for print in the screen the available fiels for the selected type
observe({
  req(input$t5_QueryType)
  myQuery = query(input$t5_QueryType)
  myFields<-default_fields(myQuery)
  updateSelectInput(session, "t5_Fields", choices=myFields, selected=head(myFields,1))  
})

# Function responsible for print in the screen the available values for the selected field
observe({
  req(input$t5_QueryType)
  req(input$t5_Fields)
  myFieldValues<-available_values(input$t5_QueryType, input$t5_Fields)
  updateSelectInput(session, "t5_FieldValues", choices=myFieldValues, selected=head(myFieldValues,1))  
})

# Function responsible for refreshing the screen data
observe({
  req(input$t5_QueryType)
  req(input$t5_Fields)
  req(input$t5_FieldValues)
  
  # Function responsible for print in the screen the function that will be executed
  output$t5_ResultQuery <- renderText({
    paste(sprintf("myQuery = query(%s) \nmyQuery = filter(myQuery,~ %s == %s) \nmyQuery %%>%% results_all()", input$t5_QueryType, input$t5_Fields, input$t5_FieldValues))
  })
  
  # Function responsible for print in the screen the same function with other format that will be executed
  output$t5_ResultQueryConcatenated <- renderText({
    paste(sprintf("query('%s') %%>%% \nfilter(%s == '%s') %%>%% \nresults_all()", input$t5_QueryType, input$t5_Fields, input$t5_FieldValues))
  })
  
  # Function responsible for print in the screen the result of the function executed
  output$t5_SelectedValuesInformation <- renderPrint({
    myQuery = query(input$t5_QueryType)
    myQuery = filter(myQuery,~ input$t5_Fields == input$t5_FieldValues)
    myQuery %>% results_all()  
  })
  
})