tabPanel("Dashboard",
  h2("Dashboard"),

  sidebarLayout(
    sidebarPanel(
      sliderInput("db_sl_optionsQtyy",
                  "Número de elementos a mostrar",
                  min=15,
                  max=100,
                  value=7),
      selectInput("db_sl_filterType",
                  "Filtrar por",
                  choices = list(),
                  selected = 1),
      checkboxGroupInput("db_ck_first_filter",
                         "Valores disponibles",
                         choices = list(),
                         selected = 1)
      ),
    mainPanel(
      column(3,plotlyOutput("db_data_plot_project")),
      column(3,plotlyOutput("db_data_plot_diseaseType")),
      column(3,plotlyOutput("db_data_plot_sampleType")),
      column(3,plotlyOutput("db_data_plot_vitalStatus")),
      column(3,plotlyOutput("db_data_plot_gender")),
      column(3,plotlyOutput("db_data_plot_race")),
      
      DT::dataTableOutput("db_dt_primaryZone"),
      plotOutput("db_data_plot_01")
      
      
      )
    )
)
