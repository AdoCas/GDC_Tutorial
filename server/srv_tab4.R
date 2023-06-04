t4_AggregationFields=c('type','data_type','state', 'data_category')

updateSelectInput(session = getDefaultReactiveDomain(), "t4_Aggregation", choices=t4_AggregationFields, selected="type")



observe({
  req(input$t4_Aggregation)
  
  output$t4_ResultAggregation <- renderPrint({
    library(GenomicDataCommons)
    
    res = files() %>% facet(c('type','data_type','state', 'data_category')) %>% aggregations()
    res[[input$t4_Aggregation]]
  })
})
