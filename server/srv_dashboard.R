# File to store the code for the Dashboard section

# List with the filter type options to apply in the Dashboard
db_filterTypeOptions = list("Zona primaria"="primary_site",
                            "Proyecto"="project.project_id",
                            "Tipo de enfermedad"="disease_type")

# Function responsible for update de dropdown with the filter type options
updateSelectInput(session = getDefaultReactiveDomain(), "db_sl_filterType", choices=db_filterTypeOptions, selected=head(db_filterTypeOptions, 1))

# Load the data that will be used for filter the results.
db_data_aggregated<-cases() %>% 
  facet(c("primary_site", "project.project_id", "disease_type", "samples.sample_type")) %>% 
  aggregations()


# Function responsible for showing the selected number of values to filter.
observe({
  req(input$db_sl_optionsQtyy)
  req(input$db_sl_filterType)
  
  db_f_primarySite = head(db_data_aggregated[[input$db_sl_filterType]], input$db_sl_optionsQtyy)
  updateCheckboxGroupInput(session = getDefaultReactiveDomain(), "db_ck_first_filter", choices = db_f_primarySite$key, selected = NULL)
})


# Function resposible for filter the data that will be shown in the Dashboard depending on the filter type selected
get_filtered_data <- reactive({
  req(input$db_sl_filterType)
  req(input$db_ck_first_filter)
  
  facets<-c("project.project_id","demographic.gender","demographic.vital_status", "demographic.race","samples.sample_type", "disease_type", "demographic.year_of_birth")

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


# Function responsible for render the data table shown in the Dashboard
output$db_dt_primaryZone <- DT::renderDataTable({
  req(input$db_sl_filterType)
  
  db_f_primarySite = db_data_aggregated[[input$db_sl_filterType]]
  setcolorder(db_f_primarySite, c("key", "doc_count"))
  DT::datatable(db_f_primarySite, 
                selection = "none",
                colnames = c("Elemento seleccionado", "Número de casos"))
})

# Function responsible for render the pie chart shown in the Dashboard with the Project information
output$db_data_plot_project <- renderPlotly({
  data <- get_filtered_data()
  
  fig <- plot_ly(data$project.project_id, 
                 labels=data$project.project_id$key, 
                 values=data$project.project_id$doc_count, 
                 type="pie",
                 textposition='inside',
                 textinfo = 'percent',
                 insidetextfont = list(color = '#FFFFFF'),
                 hoverinfo = 'text',
                 text = ~paste(doc_count, ' ', key),
                 showlegend = FALSE) %>%
    layout(title = 'PROYECTO',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  fig
  
})

# Function responsible for render the pie chart shown in the Dashboard with the Disease Type information
output$db_data_plot_diseaseType <- renderPlotly({
  data <- get_filtered_data()
  
  fig <- plot_ly(data$disease_type, 
                 labels=data$disease_type$key, 
                 values=data$disease_type$doc_count, type="pie",
                 textinfo = 'percent',
                 insidetextfont = list(color = '#FFFFFF'),
                 hoverinfo = 'text',
                 textposition='inside',
                 text = ~paste(doc_count, ' ', key),
                 showlegend = FALSE) %>%
    layout(title = 'TIPO DE ENFERMEDAD',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  fig
})

# Function responsible for render the pie chart shown in the Dashboard with the Sample Type information
output$db_data_plot_sampleType <- renderPlotly({
  data <- get_filtered_data()

  fig <- plot_ly(data$samples.sample_type, 
                 labels=data$samples.sample_type$key, 
                 values=data$samples.sample_type$doc_count, type="pie",
                 textinfo = 'percent',
                 insidetextfont = list(color = '#FFFFFF'),
                 hoverinfo = 'text',
                 textposition='inside',
                 text = ~paste(doc_count, ' ', key),
                 showlegend = FALSE) %>%
    layout(title = 'TIPO DE MUESTRA',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  fig
})

# Function responsible for render the pie chart shown in the Dashboard with the Vital Status information
output$db_data_plot_vitalStatus <- renderPlotly({
  data <- get_filtered_data()
  
  fig <- plot_ly(data$demographic.vital_status, 
                 labels=data$demographic.vital_status$key, 
                 values=data$demographic.vital_status$doc_count, type="pie",
                 textinfo = 'percent',
                 insidetextfont = list(color = '#FFFFFF'),
                 hoverinfo = 'text',
                 textposition='inside',
                 text = ~paste(doc_count, ' ', key),
                 showlegend = FALSE) %>%
    layout(title = 'ESTADO VITAL',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  fig
})

# Function responsible for render the pie chart shown in the Dashboard with the Gender information
output$db_data_plot_gender <- renderPlotly({
  data <- get_filtered_data()
  
  fig <- plot_ly(data$demographic.gender, 
                 labels=data$demographic.gender$key, 
                 values=data$demographic.gender$doc_count, type="pie",
                 textinfo = 'percent',
                 textposition='inside',
                 insidetextfont = list(color = '#FFFFFF'),
                 hoverinfo = 'text',
                 text = ~paste(doc_count, ' ', key),
                 showlegend=FALSE) %>%
    layout(title = 'GÉNERO',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  fig
})

# Function responsible for render the pie chart shown in the Dashboard with the Race information
output$db_data_plot_race <- renderPlotly({
  data <- get_filtered_data()
  
  fig <- plot_ly(data$demographic.race, 
                 labels=data$demographic.race$key, 
                 values=data$demographic.race$doc_count, type="pie",
                 textinfo = 'percent',
                 textposition='inside',
                 insidetextfont = list(color = '#FFFFFF'),
                 hoverinfo = 'text',
                 text = ~paste(doc_count, ' ', key),
                 showlegend=FALSE) %>%
    layout(title = 'RAZA',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  fig
})

