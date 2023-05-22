library(shiny)
library(ggplot2)

ui <- fluidPage(
  navbarPage(
    title = "GDC Tutorial",
    source(file.path("ui", "tab1.R"), local=TRUE)$value,
    source(file.path("ui", "tab2.R"), local=TRUE)$value,
    source(file.path("ui", "tab3.R"), local=TRUE)$value,
    source(file.path("ui", "tab4.R"), local=TRUE)$value,
    source(file.path("ui", "dashboard.R"), local=TRUE)$value
  )
)

server <- function(input, output, session) {
  source(file.path("server", "server.R"),  local = TRUE)$value
}

shinyApp(ui = ui, server = server)
