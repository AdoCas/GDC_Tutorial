tabPanel("Paso 5",
         h2("Filtrado de los resultados obtenidos"),
         includeMarkdown("ui/tab05/tab05_01.md"),
         sidebarLayout(position = "left",
                       sidebarPanel(
                         h2("Selección"),
                         selectInput("t5_QueryType",
                                     "Entidad",
                                     choices = list(),
                                     selected = 1),
                         selectInput("t5_Fields",
                                     "Campo",
                                     choices = list(),
                                     selected=1),
                         selectInput("t5_FieldValues",
                                     "Valores",
                                     choices = list(),
                                     selected=1)
                       ),
                       mainPanel(
                         includeMarkdown("ui/tab05/tab05_02.md"),
                         verbatimTextOutput("t5_ResultQuery"),
                         verbatimTextOutput("t5_ResultQueryConcatenated"),
                         includeMarkdown("ui/tab05/tab05_03.md"),
                         verbatimTextOutput("t5_SelectedValuesInformation")
                       )
         )
)