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
          'dash_projects' = "Data Viz & Web apps",
          'coding_projects' = "Coding projects",
          "education" = "Education",
          "interests" = "Interests",
          "awards" = "Awards"
          # tags$span(
          #   HTML(
          #     '<i class="fa fa-first-aid" style = "color:#428BCA;"></i><p style="display:inline-block;">&ensp;Injury&emsp;&emsp;&nbsp;</p>'
          #   )
          # )
          
        ),
        color = "orange"
      ),
      body = resume_body(
        # About
        resume_section(
          id = "about",
          h2("Hi, I'm Jacci Ziebert"),
          h3('Madison, WI jacciziebert@gmail.com'),
          span(
            "I am a data analyst and transportation enthusiast. I started my career at the Wisconsin Department of Transportation doing travel forecasting. Learning Excel and macros, I improved our forecasting worksheets. My next position as a highway safety analyst I stepped up my programming game. I took a graduate-level programming course and sparked a passion for R.

I'm always striving to increase my skill set and I hope to make maps more visually appealing while showing concise information.

          Fast forward a few years
I like to look for ways to streamline manual tasks, make dashboards, and to translate our data to a user-friendly visual for the general public. I use R notebooks to do my analysis and data viz. I also have a background in GIS.

I spend my free time as a strategy board game enthusiast, a cyclist, a kitchen experimenter, a bike tourer, a coffee roaster, and a solo traveler. I'm always on the lookout for a good pour-over coffee."
          )
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
          id = "dash_projects",
          h4('Data Viz & Dashboards'),
          tagList(tags$span(
            HTML(
              "<p>A Wisconsin Crash Statistics Dashboard built with R Shiny, leaflet, plotly under a golem framework. Switching to golem, I found that the app became extremely slow. Through performance testing, I found the bottleneck was tied to simply loading the data. I found SQLite to be an optimal solution as it is saved locally inside the package while the data is stagnant. View it <a href='https://jacciz.shinyapps.io/Shiny_Crashes/'>here</a>.</p> <img src=www/crash_dashboard.png style=height:600px;display:inline-block;>"))),
          tagList(tags$span(
            HTML(
              "<p>I developed an R package to import and analyze our crash data inside an R environment. It came to a point where I was constantly sourcing the same series scripts. It was logical to make these scripts into an R package. Furthermore, the package has functions that query certain crash flags. This way I don't have to look up the query of each crash flag; it's just written inside the function. View the code <a href='https://jacciz.shinyapps.io/Shiny_Crashes/'>here</a>.</p> <img src=www/crash_dashboard.png style=height:600px;display:inline-block;>"))),
          tagList(tags$span(
            HTML(
              "<p>I wrote a parameterized R Markdown to fully automate and create crash data summaries of 72 counties. In the past, each county was done by hand using Word. View Dane County's Safety Summary <a href='tiny.cc/46unuz'>here</a>.</p> View it <a href='https://jacciz.shinyapps.io/Shiny_Crashes/'>here</a>.</p> <img src=www/crash_dashboard.png style=height:600px;display:inline-block;>"))),
          tagList(tags$span(
            HTML(
              "<p>An ameateur coffee roaster, I made this dashboard to visualize my roasts. The tricky part was adding the RoR (rate of return) curves onto the graph as this is calculated via an algorethm written in Python inside Artisan software. I found this piece of code and rewrote part of it so it would work for my app. Next I used the reticulate package so the app can read Python code. </p> <img src=www/crash_dashboard.png style=height:400px;display:inline-block;>")))
        ),
        # personal projects
        resume_section(
          id = "coding_projects",
          h4('Coding Projects'),
          tagList(tags$span(
            HTML(
              "<p>Working inside an R environemnt, I made an R package for data analysis for our crash databases. The crash form was changed in 2017, so this is able to import old and new data into a single dataframe.</p> <a href='https://github.com/jacciz/wisdotcrashdatabase/blob/master/wisdotcrashdatabase_1.00.pdf'>here.</a>")))
        ),
        # education
        resume_section(id = "education",
                       h4('education'),
                       tagList(tags$span(
                         HTML(
                           "<span>University of Wisconsin – Madison<br>
              Master of Urban and Regional Planning<br>
              Certificate in Transportation Management and Policy</span>"
                         )
                       ))), 
        # interests
        resume_section(
          id = "interests",
          h4('interests'),
          p(
            "Adventure is what motivates me. I love to do all kinds of biking - road, gravel, cyclocross, traveling in my campervan."
          )
        ), 
        # awards
        resume_section(
          id = "awards",
          h4('awards'),
          p("My crash dashboard won runner-up")
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

