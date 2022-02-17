#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny shinydashboardPlus shinydashboard
#' @noRd
app_server <- function( input, output, session ) {
 
  output$user <- renderUser({
    dashboardUser(
      name = "Jacci Ziebert",
      image = "www/plane_small.jpg",
      title = "Data Analyst",
      # footer = p("The footer", class = "text-center"),
      fluidRow(
        dashboardUserItem(
          width = 4,
          socialButton(
            href = "mailto:jacciziebert@gmail.com",
            icon = tags$i(
              class = "fa fa-envelope", 
              style = "color:#3d3d3d"
            )#icon("envelope")
          )
        ),
        dashboardUserItem(
          width = 4,
          socialButton(
            href = "https://www.linkedin.com/in/jacci-ziebert/",
            icon = icon("linkedin")
          )
        ),
        dashboardUserItem(
          width = 4,
          socialButton(
            href = "http://github.com/jacciz",
            icon = icon("github")
          )
        )
      )
    )
  })
}