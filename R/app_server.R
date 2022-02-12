#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic 
  output$user <- renderUser({
    dashboardUser(
      name = "Divad Nojnarg", 
      image = "https://adminlte.io/themes/AdminLTE/dist/img/user2-160x160.jpg", 
      title = "shinydashboardPlus",
      subtitle = "Author", 
      footer = p("The footer", class = "text-center"),
      fluidRow(
        dashboardUserItem(
          width = 6,
          socialButton(
            href = "https://dropbox.com",
            icon = icon("dropbox")
          )
        ),
        dashboardUserItem(
          width = 6,
          socialButton(
            href = "https://github.com",
            icon = icon("github")
          )
        )
      )
    )
  })
}
