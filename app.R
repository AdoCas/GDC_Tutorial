library(shiny)
library(ggplot2)
library(markdown)
library(plotly)


ui <- fluidPage(
  navbarPage(
    title = "GDC Tutorial",
    source(file.path("ui/tab01", "tab01.R"), local=TRUE)$value,
    source(file.path("ui/tab02", "tab02.R"), local=TRUE)$value,
    source(file.path("ui/tab03", "tab03.R"), local=TRUE)$value,
    source(file.path("ui/tab04", "tab04.R"), local=TRUE)$value,
    source(file.path("ui/tab05", "tab05.R"), local=TRUE)$value,
    source(file.path("ui/tab06", "tab06.R"), local=TRUE)$value,
    source(file.path("ui/tab07", "tab07.R"), local=TRUE)$value,
    source(file.path("ui/tab08", "tab08.R"), local=TRUE)$value,
    source(file.path("ui", "dashboard.R"), local=TRUE)$value
  )
)

server <- function(input, output, session) {
  source(file.path("server", "server.R"),  local = TRUE)$value
}

shinyApp(ui = ui, server = server)
