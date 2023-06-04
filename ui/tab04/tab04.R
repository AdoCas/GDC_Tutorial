tabPanel("Paso 4",
  h2("Agrupación de los resultados obtenidos"),
  includeMarkdown("ui/tab04/tab04_01.md"),
  sidebarLayout(position = "left",
                sidebarPanel(
                  h2("Selección"),
                  selectInput("t4_Aggregation",
                              "Campo",
                              choices = list('type', 'data_type', 'state', 'data_category'),
                              selected = 1),
                ),
                mainPanel(
                  verbatimTextOutput("t4_ResultAggregation"),
                )
  )
)