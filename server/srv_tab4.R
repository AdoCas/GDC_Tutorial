t4_AggregationFields=c('type','data_type','state', 'data_category')

updateSelectInput(session = getDefaultReactiveDomain(), "t4_QueryType", choices=queryOptions, selected="cases")
updateSelectInput(session = getDefaultReactiveDomain(), "t4_Aggregation", choices=t4_AggregationFields, selected="type")

observe({
  req(input$t4_QueryType)
  myQuery = query(input$t4_QueryType)
  myFields<-default_fields(myQuery)
  updateSelectInput(session, "t4_Fields", choices=myFields, selected=head(myFields,1))  
})

observe({
  req(input$t4_QueryType)
  req(input$t4_Fields)
  myFieldValues<-available_values(input$t4_QueryType, input$t4_Fields)
  updateSelectInput(session, "t4_FieldValues", choices=myFieldValues, selected=head(myFieldValues,1))  
})

observe({
  req(input$t4_QueryType)
  req(input$t4_Fields)
  req(input$t4_FieldValues)
  
  output$t4_ResultQuery <- renderText({
    paste(sprintf("myQuery = query(%s) \nmyQuery = filter(myQuery,~ %s == %s) \nmyQuery %%>%% results_all()", input$t4_QueryType, input$t4_Fields, input$t4_FieldValues))
  })
  
  output$t4_ResultQueryConcatenated <- renderText({
    paste(sprintf("query('%s') %%>%% \nfilter(%s == '%s') %%>%% \nresults_all()", input$t4_QueryType, input$t4_Fields, input$t4_FieldValues))
  })
  
  output$t4_SelectedValuesInformation <- renderPrint({
    myQuery = query(input$t4_QueryType)
    myQuery = filter(myQuery,~ input$t4_Fields == input$t4_FieldValues)
    myQuery %>% results_all()  
  })
  
})

observe({
  req(input$t4_Aggregation)
  
  output$t4_ResultAggregation <- renderPrint({
    library(GenomicDataCommons)
    
    res = files() %>% facet(c('type','data_type','state', 'data_category')) %>% aggregations()
    res[[input$t4_Aggregation]]
  })
})
