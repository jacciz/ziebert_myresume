#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny resume
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic 
    resume_page(
      app_title = "Jacci Ziebert",
      nav = resume_navbar(
        image = "www/plane.jpg",
        refs = c(
          "about" = "About",
          "experience" = "Experience",
          'projects' = "Personal projects",
          "education" = "Education",
          "interests" = "Interests",
          "awards" = "Awards"
        ),
        color = "orange"
      ),
      body = resume_body(
        # About
        resume_section(
          id = "about",
          h2('Jacci Ziebert'),
          h3('Madison, WI jacciziebert@gmail.com'),
          span("I work as a data analyst in the public sector. I got my Master's in transportation planning
                     and have worked at my state's Department of Transportation for 5 years.
                     
               In my positions, I like to look for ways to streamline manual tasks, make dashboards, 
               and to translate our data to a user-friendly visual for the general public. I use R notebooks 
               to do most of my analysis and data viz. I also have a background in GIS.")
        ),
        # experience
        resume_section(
          id = "experience",
          h4('experience'),
          span("Working as an analyst for nearly 3 years, I learned R")
          # tags$div(HTML("<iframe height=600 width=100% frameborder=no src=http://jacciz.shinyapps.io/Shiny_Crashes> </iframe>"))
        ),
        # projects
        resume_section(
          id = "projects",
          h4('Personal projects'),
          tagList(tags$span(
            HTML(
              "<h6>A Wisconsin Crash Statistics Dashboard built with R Shiny, leaflet, plotly under a golem framework.</h4>
            <img src=www/crash_dashboard.png style=height:400px;display:inline-block;>")))
        ),
        # education
        resume_section(
          id = "education",
          h4('education'),
          tagList(tags$span(
            HTML(
              "<span>University of Wisconsin – Madison<br>
              Master of Urban and Regional Planning<br>
              Certificate in Transportation Management and Policy</span>"))
        )
        ),
        # interests
        resume_section(
          id = "interests",
          h4('interests'),
          plotOutput("interests")
        ),
        # awards
        resume_section(
          id = "awards",
          h4('awards'),
          plotOutput("awards")
        )
      )
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'myresume'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

