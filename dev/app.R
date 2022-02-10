## app.R ##
library(shinydashboard)
library(shinydashboardPlus)
library(shiny)

ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard"),
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
      menuItem(
        strong("Experience"),
        tabName = "experience",
        icon = icon("briefcase")
      ),
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
                  type = 1,
                  image = "www/plane.jpg",
                ),
                status = "warning",
                footer = "I am a data analyst and transportation enthusiast. I started my career at the Wisconsin Department of Transportation doing travel forecasting. Learning Excel and macros, I improved our forecasting worksheets. My next position as a highway safety analyst I stepped up my programming game. I took a graduate-level programming course and sparked a passion for R. I'm always striving to increase my skill set and I hope to make maps more visually appealing while showing concise information. /n <br>
                Fast forward a few years
I like to look for ways to streamline manual tasks, make dashboards, and to translate our data to a user-friendly visual for the general public. I use R notebooks to do my analysis and data viz. I also have a background in GIS. I spend my free time as a strategy board game enthusiast, a cyclist, a kitchen experimenter, a bike tourer, a coffee roaster, and a solo traveler. I'm always on the lookout for a good pour-over coffee.",
                collapsible = FALSE,
                closable = FALSE
                # sidebar = boxSidebar(
                #   id = "NULL",
                #   width = 50,
                #   background = "#333a40",
                #   startOpen = FALSE,
                #   icon = shiny::icon("cogs")
                # )
                # navPills(
                #   id = "pillItem",
                #   navPillsItem(
                #     left = "Item 1",
                #     right = "test2 right",
                #     color = "green"
                #     # right = 10
                #   ),
                #   navPillsItem(
                #     left = "Item 2", 
                #     color = "red",
                #     icon = icon("angle-down"), 
                #     right = "10%"
                #   )
                # )
              ),
              box(
                width = NULL,
                title = "Social Buttons",
                status = NULL,
                socialButton(
                  href = "https://www.linkedin.com/in/jacci-ziebert/",
                  icon = icon("linkedin")
                ),
                socialButton(
                  href = "http://github.com/jacciz",
                  icon = icon("github")
                )
              )
              )
            )),
    tabItem(tabName = "experience",
            h2("Widgets tab content")),
    tabItem(tabname= "dash_projects",
            h4('Data Viz & Dashboards'),
            h5('WisDOT Crash Statistics Dashboard'),
            tagList(tags$span(
              HTML("<div id = 'header'> <p style='float:left;padding:10px;width:20%'>A Wisconsin Crash Statistics Dashboard built with R Shiny, leaflet, plotly under a golem framework. Switching to golem, I found that the app became extremely slow. Through performance testing, I found the bottleneck was tied to simply loading the data. I found SQLite to be an optimal solution as it is saved locally inside the package while the data is stagnant. View it <a href='https://jacciz.shinyapps.io/Shiny_Crashes/'>here</a>.</p> <img src=www/crash_dashboard.png style=padding:10px;float:right;width:80%></div>"))),
            h5('Traffic Summary of 72 County Profiles'),
            tagList(tags$span(
              HTML(
                "<p style='float:left;padding:10px;width:20%'>I wrote a parameterized R Markdown to fully automate and create crash data summaries of 72 counties. In the past, each county was done by hand using Word. View Dane County's Safety Summary <a href='tiny.cc/46unuz'>here</a>.</p> View it <a href='https://jacciz.shinyapps.io/Shiny_Crashes/'>here</a>.</p> <img src=www/crash_dashboard.png style=padding:10px;float:right;width:80%>"))),
            h5('Coffee Roasting Profiler'),
            tagList(tags$span(
              HTML(
                "<p style='float:left;padding:10px;width:20%'>An ameateur coffee roaster, I made this dashboard to visualize my roasts. The tricky part was adding the RoR (rate of return) curves onto the graph as this is calculated via an algorethm written in Python inside Artisan software. I found this piece of code and rewrote part of it so it would work for my app. Next I used the reticulate package so the app can read Python code. </p> <img src=www/crash_dashboard.png style=padding:10px;float:right;width:80%>")))
    )
  ))
)

server <- function(input, output) {

}

shinyApp(ui, server)

