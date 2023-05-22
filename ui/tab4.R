tabPanel("Paso 4",
  h2("Filtrado de los resultados obtenidos"),
  #includeMarkdown("ui/tab4_01.md"),
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
                  includeMarkdown("ui/tab4_01.md"),
                  verbatimTextOutput("t4_ResultQuery"),
                  verbatimTextOutput("t4_SelectedValuesInformation")
                )
  )
)