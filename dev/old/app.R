## app.R ##
library(shinydashboard)
library(shinydashboardPlus)
library(shiny)

ui <- dashboardPage(
  md = TRUE,
  skin = "yellow-light",
  dashboardHeader(title = "Jacci's Portfolio"),
  
  # CSS
  # tags$head(
  #   tags$style(HTML(".timeline>li>.timeline-item>.timeline-header {background:blue;}
  #                   .timeline-header {background:green;}"))),
  # 
  
  dashboardSidebar(
    sidebarMenu(# Remove the sidebar toggle element
      tags$script(
        htmlwidgets::JS(
          "document.getElementsByClassName('sidebar-toggle')[0].style.visibility = 'hidden';"
        )
      ),
      # div(class = "inlay", style = "height:15px;width:100%;background-color: #ecf0f5;"),
      menuItem(
        strong("About"),
        tabName = "about",
        icon = icon("address-card")
      ),
      # menuItem(
      #   strong("Experience"),
      #   tabName = "experience",
      #   icon = icon("briefcase")
      # ),
      menuItem(
        strong("Data Viz & Web apps"),
        tabName = "dash_projects",
        icon = icon("table")
      ),
      menuItem(
        strong("Coding projects"),
        tabName = "coding_projects",
        icon = icon("code")
      ),
      menuItem(
        strong("Education"),
        tabName = "education",
        icon = icon("graduation-cap")
      ),
      menuItem(
        strong("Interests"),
        tabName = "interests",
        icon = icon("bicycle")
      ),
      menuItem(
        strong("Awards"),
        tabName = "awards",
        icon = icon("award")
      )
      )
  ),
  dashboardBody(tabItems(
    # Boxes need to be put in a row (or column)
    tabItem(tabName = "about",
            fluidRow(
              column(width = 4,
              userBox(width = NULL,
                title = userDescription(
                  title = "Hi, I'm Jacci Ziebert",
                  subtitle = 'Data Analyst', #'Madison, WI jacciziebert@gmail.com',
                  type = 1
                  # image = "C:/Users/jacci/Documents/ziebert_myresume/inst/app/www/plane_small.jpg", # or just www/ ??
                ),
                status = "warning",
                footer = tagList(tags$span(
                  HTML(
                    "<p>I am a data analyst and transportation enthusiast. I started my career at the Wisconsin Department of Transportation doing travel forecasting. Learning Excel and macros, I improved our forecasting worksheets. My next position as a highway safety analyst I stepped up my programming game. I took a graduate-level programming course and sparked a passion for R. I'm always striving to increase my skill set and I hope to make maps more visually appealing while showing concise information.</p>
                <p>Fast forward a few years
I like to look for ways to streamline manual tasks, make dashboards, and to translate our data to a user-friendly visual for the general public. I use R notebooks to do my analysis and data viz. I also have a background in GIS. I spend my free time as a strategy board game enthusiast, a cyclist, a kitchen experimenter, a bike tourer, a coffee roaster, and a solo traveler. I'm always on the lookout for a good pour-over coffee.</p>"))),
                collapsible = FALSE,
                closable = FALSE
              ),
              box(
                width = NULL,
                title = "Skills",
                h5("R"),
                # https://shiny.rstudio.com/reference/shiny/0.14/splitLayout.html
                splitLayout(style = "border: 1px solid silver:", cellWidths = c("50%", "50%"),
                # htmltools::div(style="float:left;width:48%;",
                shinydashboardPlus::progressBar(
                  value = 50,
                  max = 50,
                  animated = TRUE,
                  status = "warning",
                  size = "xs"
                  # label = "R"
                ),
                shinydashboardPlus::progressBar(
                  value = 50,
                  max = 100,
                  animated = TRUE,
                  status = "warning",
                  size = "xs",
                  label = "SQL"
                )),
                h5("R Packages")
              ),
              box(
                width = NULL,
                # title = "Social Buttons",
                status = NULL,
                socialButton(
                  href = "mailto:jacciziebert@gmail.com",
                  icon = icon("envelope")
                ),
                socialButton(
                  href = "https://www.linkedin.com/in/jacci-ziebert/",
                  icon = icon("linkedin")
                ),
                socialButton(
                  href = "http://github.com/jacciz",
                  icon = icon("github")
                )
              )
              ),
              column(width = 4,
                     box(
                       title = "Experience",
                       status = "info",
                       width = 12,
                       timelineBlock(
                         width = 12,
                         timelineEnd(color = "red"),
                         timelineLabel(2021, color = "teal"),
                         timelineItem(
                           title = "Highway Safety Analyst",
                           icon = icon("cogs"),
                           color = "olive",
                           time = "now",
                           footer = "This is the body",
                           "Wisconsin Department of Transportation"
                         ),
                         timelineItem(
                           title = "Mandli Communications",
                           border = FALSE
                         ),
                         timelineLabel(2019, color = "orange"),
                         timelineItem(
                           title = "Mandli Communications",
                           icon = icon("paint-brush"),
                           time = "08-01-2019",
                           color = "maroon"
                         ),
                         timelineLabel(2015, color = "orange"),
                         timelineItem(
                           title = "Cycling trip",
                           icon = icon("paint-brush"),
                           color = "maroon"
                         ),
                         timelineItem(
                           title = "Traffic Forecaster and Bike/Ped Intern (two part-time positions)",
                           icon = icon("paint-brush"),
                           color = "maroon",
                           time = "Mar 2014 - Jun 2014",
                           footer = "Wisconsin Department of Transportation", 
                           "This is the body"
                         ),
                         timelineLabel(2014, color = "orange"),
                         timelineItem(
                           title = "Graduated with a Master's in Urban Planning",
                           icon = icon("paint-brush"),
                           color = "maroon"
                         ),
                       timelineLabel(2012, color = "orange"),
                       timelineItem(
                         title = "Travel to Eastern Europe",
                         icon = icon("paint-brush"),
                         color = "maroon"
                       ),
                       timelineLabel(2011, color = "orange"),
                       timelineItem(
                         title = "Urban Planning Assistant",
                         icon = icon("paint-brush"),
                         color = "maroon"
                       ),
                       timelineLabel(2010, color = "orange"),
                       timelineItem(
                         title = "Graduated with a Bachelor's in Geography",
                         icon = icon("paint-brush"),
                         color = "maroon"
                       ),
                         timelineStart(color = "purple")
                       )
                     ))
            )),

    tabItem(tabName = "dash_projects",
            h4('Data Viz & Dashboards'),
            column(
              width = 6,
              box(width = NULL,
                title = 'WisDOT Crash Statistics Dashboard',
                tagList(tags$span(
                  HTML(
                    "<div id = 'header'> <p style='float:left;padding:10px;width:20%'>A Wisconsin Crash Statistics Dashboard built with R Shiny, leaflet, plotly under a golem framework. Switching to golem, I found that the app became extremely slow. Through performance testing, I found the bottleneck was tied to simply loading the data. I found SQLite to be an optimal solution as it is saved locally inside the package while the data is stagnant. View it <a href='https://jacciz.shinyapps.io/Shiny_Crashes/'>here</a>.</p> <img src=www/crash_dashboard.png style=padding:10px;float:right;width:80%></div>"
                  )
                ))
              ),
              box(width = NULL,
                  title = 'Traffic Summary of 72 County Profiles',
                  tagList(tags$span(
                    HTML(
                      "<p style='float:left;padding:10px;width:20%'>I wrote a parameterized R Markdown to fully automate and create crash data summaries of 72 counties. In the past, each county was done by hand using Word. View Dane County's Safety Summary <a href='tiny.cc/46unuz'>here</a>.</p> View it <a href='https://jacciz.shinyapps.io/Shiny_Crashes/'>here</a>.</p> <img src=www/county_profile.png style=padding:10px;float:right;width:80%>"
                    )
                  ))),
              box(width = NULL,
                  title = 'Coffee Roasting Profiler',
                  tagList(tags$span(
                    HTML(
                      "<p style='float:left;padding:10px;width:20%'>An ameateur coffee roaster, I made this dashboard to visualize my roasts. The tricky part was adding the RoR (rate of return) curves onto the graph as this is calculated via an algorethm written in Python inside Artisan software. I found this piece of code and rewrote part of it so it would work for my app. Next I used the reticulate package so the app can read Python code. </p> <img src=www/coffee_roasting.png style=padding:10px;float:right;width:80%>"
                    )
                  )))
            )), 
    tabItem(tabName = "coding_projects",
            h2("Coding Projects"))
  ))
)

server <- function(input, output) {

}

shinyApp(ui, server)

