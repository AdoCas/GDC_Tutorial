db_filterTypeOptions = list("Zona primaria"="primary_site",
                            "Proyecto"="project.project_id",
                            "Tipo de enfermedad"="disease_type")

updateSelectInput(session = getDefaultReactiveDomain(), "db_sl_filterType", choices=db_filterTypeOptions, selected=head(db_filterTypeOptions, 1))



db_data_aggregated<-cases() %>% 
  facet(c("primary_site", "project.project_id", "disease_type", "samples.sample_type")) %>% 
  aggregations()


observe({
  req(input$db_sl_optionsQtyy)
  req(input$db_sl_filterType)
  
  db_f_primarySite = head(db_data_aggregated[[input$db_sl_filterType]], input$db_sl_optionsQtyy)
  updateCheckboxGroupInput(session = getDefaultReactiveDomain(), "db_ck_first_filter", choices = db_f_primarySite$key, selected = NULL)
})


get_filtered_data <- reactive({
  req(input$db_sl_filterType)
  req(input$db_ck_first_filter)
  
  facets<-c("project.project_id","demographic.gender","demographic.vital_status", "demographic.race","samples.sample_type", "disease_type")

  if (input$db_sl_filterType == "primary_site")
  {
    res = cases() %>%
          filter(primary_site %in% input$db_ck_first_filter) %>%
          facet(facets) %>% 
          aggregations()
  }
  else if(input$db_sl_filterType == "project.project_id")
  {
    res = cases() %>%
      filter(project.project_id %in% input$db_ck_first_filter) %>%
      facet(facets) %>% 
      aggregations()
  }
  else if(input$db_sl_filterType == "disease_type")
  {
    res = cases() %>%
      filter(disease_type %in% input$db_ck_first_filter) %>%
      facet(facets) %>% 
      aggregations()
  }
  
  res
})




output$db_dt_primaryZone <- DT::renderDataTable({
  DT::datatable(db_data_aggregated$primary_site)
})


output$db_data_plot_01 <- renderPlot({
  data <- get_filtered_data()
  
  ggplot(data$project.project_id,aes(x = key, y = doc_count)) +
    geom_bar(stat='identity') +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
})


output$db_data_plot_project <- renderPlotly({
  data <- get_filtered_data()
  
  fig <- plot_ly(data$project.project_id, 
                 labels=data$project.project_id$key, 
                 values=data$project.project_id$doc_count, 
                 type="pie",
                 textposition='none',
                 insidetextfont = list(color = '#FFFFFF'),
                 hoverinfo = 'text',
                 text = ~paste(doc_count, ' ', key),
                 showlegend = FALSE) %>%
    layout(title = 'PROJECT',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  fig
  
})

output$db_data_plot_diseaseType <- renderPlotly({
  data <- get_filtered_data()
  
  fig <- plot_ly(data$disease_type, 
                 labels=data$disease_type$key, 
                 values=data$disease_type$doc_count, type="pie",
                 textinfo = 'label+percent',
                 insidetextfont = list(color = '#FFFFFF'),
                 hoverinfo = 'text',
                 textposition='none',
                 text = ~paste(doc_count, ' ', key),
                 showlegend = FALSE) %>%
    layout(title = 'DISEASE TYPE',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  fig
})

output$db_data_plot_sampleType <- renderPlotly({
  data <- get_filtered_data()

  fig <- plot_ly(data$samples.sample_type, 
                 labels=data$samples.sample_type$key, 
                 values=data$samples.sample_type$doc_count, type="pie",
                 textinfo = 'label+percent',
                 insidetextfont = list(color = '#FFFFFF'),
                 hoverinfo = 'text',
                 textposition='none',
                 text = ~paste(doc_count, ' ', key),
                 showlegend = FALSE) %>%
    layout(title = 'SAMPLE TYPE',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  fig
})

output$db_data_plot_vitalStatus <- renderPlotly({
  data <- get_filtered_data()
  
  fig <- plot_ly(data$demographic.vital_status, 
                 labels=data$demographic.vital_status$key, 
                 values=data$demographic.vital_status$doc_count, type="pie",
                 textinfo = 'label+percent',
                 insidetextfont = list(color = '#FFFFFF'),
                 hoverinfo = 'text',
                 textposition='none',
                 text = ~paste(doc_count, ' ', key),
                 showlegend = FALSE) %>%
    layout(title = 'VITAL STATUS',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  fig
})

output$db_data_plot_gender <- renderPlotly({
  data <- get_filtered_data()
  
  fig <- plot_ly(data$demographic.gender, 
                 labels=data$demographic.gender$key, 
                 values=data$demographic.gender$doc_count, type="pie",
                 textinfo = 'label+percent',
                 textposition='none',
                 insidetextfont = list(color = '#FFFFFF'),
                 hoverinfo = 'text',
                 text = ~paste(doc_count, ' ', key),
                 showlegend=FALSE) %>%
    layout(title = 'GENDER',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  fig
})

output$db_data_plot_race <- renderPlotly({
  data <- get_filtered_data()
  
  fig <- plot_ly(data$demographic.race, 
                 labels=data$demographic.race$key, 
                 values=data$demographic.race$doc_count, type="pie",
                 textinfo = 'label+percent',
                 textposition='none',
                 insidetextfont = list(color = '#FFFFFF'),
                 hoverinfo = 'text',
                 text = ~paste(doc_count, ' ', key),
                 showlegend=FALSE) %>%
    layout(title = 'RACE',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  fig
})

