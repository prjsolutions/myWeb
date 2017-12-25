library(shiny)
library(shinythemes)

# Define UI for application
ui <- fluidPage(theme = shinytheme("darkly"),
                titlePanel("Shiny Widgets"),
                
                sidebarLayout(
                  
                  sidebarPanel(
                    name <- textInput("txtin1", "Name:"),
                    checkboxInput("chbox1", "I agree.", FALSE),
                    actionButton(inputId = "go", label = "Let's Go!")
                  ),
                  mainPanel(
                    textOutput("txtout"),
                    textOutput("chbout")
                  )
                )
)

# Define the required server logic
server <- function(input, output){
  observeEvent(input$go, {
    if({input$chbox1 == TRUE}) {
      output$txtout <- renderText({
        paste("My name is", input$txtin1, "and I agree!")
      })
    }
    else {
      output$txtout <- renderText({
        paste("You must agree to the terms first!")
      })
    }
  })
}

# Run the application
shinyApp(ui = ui, server = server)