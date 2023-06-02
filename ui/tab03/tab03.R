tabPanel("Paso 3",
  h1("Uso de la función GDC Query"),
  includeMarkdown("ui/tab03/tab03_01.md"),
  sidebarLayout(position = "left",
                sidebarPanel(
                  h2("Entidades"),
                  selectInput("t3_QueryType",
                              "Tipo",
                              choices = list(),
                              selected = 1)
                ),
                mainPanel(
                  includeMarkdown("ui/tab03/tab03_02.md"),
                  verbatimTextOutput("t3_QueryTypeText"),
                  verbatimTextOutput("t3_MyQuery")
                )
  )
)