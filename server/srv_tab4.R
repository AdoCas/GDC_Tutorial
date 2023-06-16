# List with the aggregation options used in this tab
t4_AggregationFields=c('type','data_type','state', 'data_category')

# Function responsible for update de dropdown with the aggregation options
updateSelectInput(session = getDefaultReactiveDomain(), "t4_Aggregation", choices=t4_AggregationFields, selected="type")


# Function responsible for print in the screen the results of the aggregation
observe({
  req(input$t4_Aggregation)
  
  output$t4_ResultAggregation <- renderPrint({
    library(GenomicDataCommons)
    
    res = files() %>% facet(c('type','data_type','state', 'data_category')) %>% aggregations()
    res[[input$t4_Aggregation]]
  })
})
