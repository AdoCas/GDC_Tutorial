tabPanel("Dashboard",
  h2("Dashboard"),
  #includeMarkdown("ui/tab2.md")
  
  sidebarLayout(
    sidebarPanel(
      selectInput("db_primary_site",
                  "Zona primaria",
                  choices = list(),
                  selected = 1)
    ),
    mainPanel(
      DT::dataTableOutput("db_dt_primaryZone"),
      plotOutput("db_data_plot_01"),
      plotOutput("db_data_plot_02")
    )
  )
)