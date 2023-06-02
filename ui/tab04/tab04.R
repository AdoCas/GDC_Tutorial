tabPanel("Paso 4",
  h2("Agrupación y filtrado de los resultados obtenidos"),
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
  ),
  includeMarkdown("ui/tab04/tab04_02.md"),
  sidebarLayout(position = "left",
                sidebarPanel(
                  h2("Selección"),
                  selectInput("t4_QueryType",
                              "Entidad",
                              choices = list(),
                              selected = 1),
                  selectInput("t4_Fields",
                              "Campo",
                              choices = list(),
                              selected=1),
                  selectInput("t4_FieldValues",
                              "Valores",
                              choices = list(),
                              selected=1)
                ),
                mainPanel(
                  includeMarkdown("ui/tab04/tab04_03.md"),
                  verbatimTextOutput("t4_ResultQuery"),
                  verbatimTextOutput("t4_ResultQueryConcatenated"),
                  includeMarkdown("ui/tab04/tab04_04.md"),
                  verbatimTextOutput("t4_SelectedValuesInformation")
                )
  )
)