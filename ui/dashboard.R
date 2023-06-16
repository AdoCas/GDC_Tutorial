tabPanel("Dashboard",
  h2("Dashboard - Casos disponibles"),

  sidebarLayout(
    sidebarPanel(
      selectInput("db_sl_filterType",
                  "Filtrar por",
                  choices = list(),
                  selected = 1),
      sliderInput("db_sl_optionsQtyy",
                  "Número de elementos a mostrar",
                  min=15,
                  max=100,
                  value=7),
      checkboxGroupInput("db_ck_first_filter",
                         "Valores disponibles",
                         choices = list(),
                         selected = 1)
      ),
    mainPanel(
      h2("Elementos encontrados"),
      DT::dataTableOutput("db_dt_primaryZone"),
      
      h2("Gráficas estadísticas"),
      column(4,plotlyOutput("db_data_plot_project")),
      column(4,plotlyOutput("db_data_plot_diseaseType")),
      column(4,plotlyOutput("db_data_plot_sampleType")),
      column(4,plotlyOutput("db_data_plot_vitalStatus")),
      column(4,plotlyOutput("db_data_plot_gender")),
      column(4,plotlyOutput("db_data_plot_race"))
      )
    )
)
