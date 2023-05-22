library("GenomicDataCommons")

# Common

queryOptions=list("cases"="cases",
                  "files"="files",
                  "projects"="projects",
                  "annotations"="annotations",
                  "ssms"="ssms",
                  "ssm_occurrences"="ssm_occurrences",
                  "cnvs"="cnvs",
                  "cnv_occurrences"="cnv_occurrences",
                  "genes"="genes")
  
# TAB 3

updateSelectInput(session = getDefaultReactiveDomain(), "t3_QueryType", choices=queryOptions, selected="cases")

output$t3_QueryTypeText <- renderText({
  paste(sprintf("myQuery = query(%s) \ndefault_fields(myQuery)", input$t3_QueryType))
})

output$t3_MyQuery <- renderPrint({
  paste(sprintf("myQuery = query(%s)", input$t3_QueryType))
  myQuery = query(input$t3_QueryType)
  default_fields(myQuery)
})

# TAB 4

updateSelectInput(session = getDefaultReactiveDomain(), "t4_QueryType", choices=queryOptions, selected="cases")

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
  
  output$t4_SelectedValuesInformation <- renderPrint({
    myQuery = query(input$t4_QueryType)
    myQuery = filter(myQuery,~ input$t4_Fields == input$t4_FieldValues)
    myQuery %>% results_all()  
  })
  
})








