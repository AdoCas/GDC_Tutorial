
db_data_primarySiteWithCounter<-cases() %>% facet("primary_site") %>% aggregations()
#db_data_primarySiteWithCounter$primary_site$MergedData<-paste(db_data_primarySiteWithCounter$primary_site$doc_count, '-', db_data_primarySiteWithCounter$primary_site$key)

updateSelectInput(session = getDefaultReactiveDomain(), "db_primary_site", choices=db_data_primarySiteWithCounter$primary_site$key, selected=head(db_data_primarySiteWithCounter$primary_site$MergedData,1))


get_filtered_data <- reactive({
  res = cases() %>% facet("project.project_id,demographic.gender") %>% aggregations()
  res
})

output$db_dt_primaryZone <- DT::renderDataTable({
  DT::datatable(db_data_primarySiteWithCounter$primary_site)
})


output$db_data_plot_01 <- renderPlot({
  data <- get_filtered_data()
  
  ggplot(data$project.project_id,aes(x = key, y = doc_count)) +
    geom_bar(stat='identity') +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
})

output$db_data_plot_02 <- renderPlot({
  data <- get_filtered_data()
  
  ggplot(data$demographic.gender,aes(x = key, y = doc_count)) +
    geom_bar(stat='identity') +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
})
