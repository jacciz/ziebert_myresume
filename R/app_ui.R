#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny shinydashboardPlus shinydashboard
#' @noRd
app_ui <- function(request) {
  # TODO Download resume button / contact button
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic 
    dashboardPage(
      md = TRUE,
      skin = "yellow-light",
      dashboardHeader(title = "Jacci's Portfolio",
                      userOutput("user")),
      shinydashboard::dashboardSidebar(
        shinydashboard::sidebarMenu(# Remove the sidebar toggle element
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
            strong("Data Viz & Web Apps"),
            tabName = "dash_projects",
            icon = icon("table")
          ),
          menuItem(
            strong("Coding projects"),
            tabName = "coding_projects",
            icon = icon("code")
          ),
          # menuItem(
          #   strong("Education"),
          #   tabName = "education",
          #   icon = icon("graduation-cap")
          # ),
          menuItem(
            strong("Interests"),
            tabName = "interests",
            icon = icon("bicycle")
          )
          # menuItem(
          #   strong("Awards"),
          #   tabName = "awards",
          #   icon = icon("award")
          # )
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
                                   subtitle = 'Data Analyst',
                                   type = 2,
                                   image = "www/plane_small.jpg"
                                 ),
                                 status = "warning",
                                 collapsible = FALSE,
                                 closable = FALSE,
                                 footer =  withTags({
                                   div(
                                     div(style = "float:left",
                                  actionButton(
                                     inputId = "download_cv",
                                     label = "View CV",
                                     style = "pill", 
                                     color = "warning",
                                     onclick = "window.open('www/Ziebert_Resume.pdf')"
                                   )),
                                   div(style = "float:right",
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
                                   )))}),
                                 tagList(tags$span(
                                   HTML(
                                     "<p>I am a data analyst and a transportation planner with 5+ years of experience in transportation planning. My passion for R sparked after I took a programming class a few years ago and immediately applied what I learned to my job. I'm always striving to increase my skill set. I like to look for ways to streamline manual tasks and to translate data into a concise and meaningful visual for the general public in either a dashboard or report format.</p>")))
                         ),
                         box(
                           width = NULL,
                           # title = "Skills",
                           title = tags$span(
                             HTML(
                               '<i class="fa fa-gear" style = "color:#ffffff;"></i><p style="display:inline-block;">&ensp;Skills</p>'
                             )
                           ),
                           withTags({
                             div(
                                 ul(
                                   li("R and Shiny"),
                                   li("Dashboards, web apps, and data visualizations"),
                                   li("SQL databases (RSQLite and duckdb R packages)"),
                                   li("CSS, HTML"),
                                   li("Docker, Git")
                                 )
                             )
                           }),
                           
                           # https://shiny.rstudio.com/reference/shiny/0.14/splitLayout.html
                           # splitLayout(style = "border: 1px solid silver:", cellWidths = c("50%", "50%"),
                                       # htmltools::div(style="float:left;width:48%;",
                                       # shinydashboardPlus::progressBar(
                                       #   value = 50,
                                       #   max = 50,
                                       #   animated = TRUE,
                                       #   status = "warning",
                                       #   size = "xs"
                                       #   # label = "R"
                                       # ),
                                       # shinydashboardPlus::progressBar(
                                       #   value = 50,
                                       #   max = 100,
                                       #   animated = TRUE,
                                       #   status = "warning",
                                       #   size = "xs",
                                       #   label = "SQL"
                                       # ),
                           withTags({
                             div(h5("R packages for data analysis"),
                                 ul(
                                   li("data.table"),
                                   li("dplyr"),
                                   li("janitor"),
                                   li("purrr"),
                                   li("sf"),
                                   li("tidycensus")
                                 ),
                                 style = "float:left;width:50%")
                           }),
                           withTags({
                             div(h5("R packages for data viz"),
                                 ul(
                                   li("flexdashboard"),
                                   li("ggplot2"),
                                   li("golem"),
                                   li("kableExtra"),
                                   li("leaflet"),
                                   li("plotly")
                                 ),
                                 style = "float:right;width:50%")
                           })
                         ),
                         box(
                           width = NULL,
                           # title = "Education",
                           title = tags$span(
                             HTML(
                               '<i class="fa fa-graduation-cap" style = "color:#ffffff;"></i><p style="display:inline-block;">&ensp;Education</p>'
                             )
                           ),
                           status = NULL,
                           tagList(tags$span(
                             HTML(
                               '<div><p style="padding:10px;float:left"><b>University of Wisconsin – Madison</b><br>Master of Urban & Regional Planning<br>Cert. in Transp. Management & Policy</p><p style="padding:10px;float:right">Madison, WI<br>Graduation: May 2014<br>Cumulative GPA: 3.5/4.0</p></div>'
                             )
                           ),
                           tags$span(
                             HTML(
                               '<div><p style="padding:10px;float:left"><b>University of Wisconsin – Oshkosh</b><br>Bachelor of Science<br>Geography (GIS) & Urban Planning</p><p style="padding:10px;float:right">Oshkosh, WI<br>Graduation: Dec 2010<br>Cumulative GPA: 3.1/4.0</p></div>'
                             )
                           ))
                         )
                  ),
                  column(width = 5,
                         box(
                           # title = "Experience",
                           title = tags$span(
                             HTML(
                               '<i class="fa fa-briefcase" style = "color:#ffffff;"></i><p style="display:inline-block;">&ensp;Experience</p>'
                             )
                           ),
                           status = "info",
                           width = NULL,
                           timelineBlock(
                             width = NULL,
                             # timelineEnd(color = "orange"),
                             # timelineLabel(2021, color = "orange"),
                             timelineItem(
                               title = "Highway Safety Analyst",
                               icon = icon("car-crash"),
                               color = "light-blue",
                               time = "May 2019 - now",
                               footer = withTags({
                                 ul(
                                   li("Developed a Crash Data Dashboard in R Shiny with multi-selection capabilities and a dynamic map"),
                                   li("Wrote a parameterized R Markdown to fully automate the creation of 72 crash data county profiles"),
                                   li("Created an internal R package for data pulls and data analysis for our crash database"),
                                   li("Used an API to collect court case data then flattening JSON file, cleaning data, and running analysis"),
                                   li("Fulfill data requests on a daily basis using R notebooks for analysis and data viz and exporting as Powerpoint, HTML or CSV") 
                                   )
                               }),
                               "Wisconsin Department of Transportation"
                             ),
                             timelineLabel(2019, color = "orange"),
                             timelineItem(
                               title = "Traffic Forecaster (part-time)",
                               icon = icon("car"),
                               color = "light-blue",
                               time = "Feb 2017 - Jun 2018",
                               footer = withTags({
                                 ul(
                                   li("Completed statewide traffic forecast requests through the use of travel demand models and regression analysis of historical counts on a weekly basis"),
                                   li("Provided expertise on completed forecast requests to MPOs, DOT regions and consultants"),
                                   li("Conducted research and learned VBA to develop a macro-enabled Excel worksheet, improving and streamlining the department’s method to forecast turning movement counts"))
                               }),
                               "Wisconsin Department of Transportation"
                             ),
                             timelineItem(
                               title = "Data Processor",
                               icon = icon("database"),
                               color = "light-blue",
                               time = "Dec 2016 - May 2019",
                               footer =withTags({
                                 ul(
                                   li("Analyze, classify, and process LiDAR data maintaining above average speed,  occasionally perform quality control"))
                               }),
                               "Mandli Communications"
                             ),
                             timelineItem(
                               title = "Cycling trip",
                               icon = icon("bicycle"),
                               color = "light-blue",
                               time = "Jul 2015 - Oct 2015",
                               "Bike tour along the Pacific Coast"
                             ),
                             timelineLabel(2015, color = "orange"),
                             timelineItem(
                               title = "Traffic Forecaster and Bike/Ped Intern",
                               icon = icon("user"),
                               color = "light-blue",
                               time = "Feb 2014 - Jul 2015",
                               footer = withTags({
                                     ul(
                                       li("Learned ADA standards in order to digitize and assess statewide curb ramps and sidewalks in ArcMap"),
                                       li("Learned about bike/pedestrian safety and design and the benefits of complete streets through five day-long courses"))
                               }),
                               "Wisconsin Department of Transportation"
                             ),
                             timelineLabel(2014, color = "orange"),
                             timelineItem(
                               title = "Graduated with a Master's in Urban Planning",
                               icon = icon("graduation-cap"),
                               color = "light-blue",
                               time = "2014"
                             )
                           )
                         ))
                )),
        tabItem(
          tabName = "dash_projects",
          h3('Data Viz & Web Apps'),
          column(
            width = 8,
            box(width = NULL,
                # <ul>
                #   <li>R Shiny</li>
                #   <li>leaflet</li>
                #   <li>plotly</li>
                #   </ul>
                title = 'WisDOT Crash Statistics Dashboard (Shiny)',
                tagList(tags$span(
                  HTML(
                    "<div id = 'header'> <p style='float:left;padding:10px;width:20%'>This is a dashboard that summarizes our crash data with numerous filters, data visuals and a map. Through performance testing, I found an enormous bottleneck through simply loading the data. I found SQLite to be an optimal solution as the database is saved locally inside the package. <br><br>Highlighted packages: <i>plotly, leaflet, leaflet.extras2 and leafgl</i> under a <i>golem</i> framework.<br><br>View the <a href='https://jacciz.shinyapps.io/Shiny_Crashes/'>app</a> and the <a href='https://github.com/jacciz/shiny_wisdot_crash_dashboard'>code</a>.</p> <img src=www/crash_dashboard.jpg style=padding:10px;float:right;width:80%></div>"
                  )
                ))
                ),
            box(width = NULL, 
                      title = 'Traffic Summary of 72 County Profiles (R Markdown)',
                      tagList(tags$span(
                        HTML(
                          "<p style='float:left;padding:10px;width:20%'>A parameterized R Markdown to fully automate the creation of crash data summaries for 72 counties. This has dynamic maps showing crashes and hotspots via <i>googleway</i>.<br><br>Highlighted packages: <i>plotly, googleway, and kableExtra</i>.<br><br>View <a href='https://tiny.cc/46unuz'>Dane County's Traffic Safety Summary</a>.</p> <img src=www/county_profile.jpg style=padding:10px;float:right;width:80%>"
                        )
                      ))),
                  box(width = NULL,
                      title = 'Coffee Roasting Profiler (Shiny)',
                      tagList(tags$span(
                        HTML(
                          "<p style='float:left;padding:10px;width:20%'>An ameateur coffee roaster, I made this dashboard to visualize my roast profiles. The tricky part was adding the RoR (rate of return) curves (the blue and purple) onto the graph as this is calculated via an algorithm written in Python inside Artisan software. I found this piece of code and rewrote part of it so it would work for my app. Next I used the <i>reticulate</i> package so the app can read Python code.<br><br>Highlighted packages: <i>reticulate, formattable, and DT</i> under a <i>golem</i> framework.<br><br>View the <a href='https://jacciz.shinyapps.io/coffee_roasting/'>app</a> and the <a href='https://github.com/jacciz/coffee_roasting_profiles'>code</a>.</p><img src=www/coffee_roasting.jpg style=padding:10px;float:right;width:80%>"
                        )
                      )))
                )), 
        tabItem(tabName = "coding_projects",
                h3("Coding Projects"),
        column(
          width = 8,
          box(width = NULL,
              title = 'wisdotcrashdatabase R Package',
              withTags({
                div(
                  class = "header",
                  p(
                    "I developed an R package to import and analyze our crash data inside an R environment. It came to a point where I was constantly sourcing the same series of scripts so it was logical to turn these scripts into an R package. Furthermore, the package has functions that query certain crash flags. This way I don't have to look up the query of each crash flag; it's simply written inside the function.",
                    br(),
                    br(),
                    p("Highlighted packages: ", style = "display:inline-block"),
                    i("data.table, duckdb, fst, and purrr."),
                    br(),
                    br(),
                    "View the ",
                    a(href = 'https://github.com/jacciz/wisdotcrashdatabase', "package.")
                  ),
                  style = 'float:left;padding:10px;width:40%'
                )
              }),
        # div( # padding:10px;float:right;width:80%
        carousel(width = 5,
          id = "r_package",
          carouselItem(
            caption = "Page 1",
            tags$img(src = "www/package_1.jpg")
          ),
          carouselItem(
            caption = "Page 2",
            tags$img(src = "www/package_2.jpg")
          )
        )
        ),
        box(width = NULL,
            title = 'Analysis of OWI ratios',
            withTags({
              div(
                class = "header",
                div(style='float:left;padding:10px;width:40%',
                p(
                  "This project involved the compilation of 5 data sets to calculate OWI (operating while intoxicated) ratios broken down by age group, race and sex. In order to combine these datasets, I had to rename columns and recode variables so datasets can be joined. I wrote functions that summarize each of the datasets and combined them into a table with the parameter allowing for any combo of age, sex, or race."
                ),
                br(),
                br(),
                p(style='display:inline-block;',
                  "Datasets include: National Household Travel Survey (NHTS), U.S. Census, arrest data, DMV licensed drivers, and persons in a crash"
                )),
                img(src='www/nhts_by_age.jpg', style='padding:10px;float:right;width:60%;')
              )
            })),
        box(width = NULL,
            title = 'Working with API and JSON format',
            withTags({
              div(
                p(
                  "We wanted to find the average sentence length of 3+ OWI offenders. This was done it two parts 1) Writing functions that pulls data from our court case API into a JSON format over a certain time period and for certain citations. This data was flattened and compiled into a single dataframe and exported. And 2) Finding the sentence length for a certain citation for each case. This was tricky as one case may have multiple citations while sentence lengths can be found in multiple branches of the flattened JSON. I solved this issue by finding which branch a certain location was found and replaced part of the branch name with where the sentence length location. I was able to extract the sentence length with this 'renaming.'"
                )
              )
            }))
        )), 
        tabItem(tabName = "interests",
                # h3("Interests"),
                column(width = 5,
                box(width = NULL,
                    title = 'Interests',
                    withTags({
                      div(class = "header",
                          p("I spend my free time as a strategy board game enthusiast, a cyclist, a kitchen experimenter, a bike tourer, a coffee roaster, and a solo traveler. I'm always on the lookout for a good pour-over coffee."))
                    }),
        carousel(width = 7,
                 id = "c_interests",
                 carouselItem(
                   # caption = "Page 1",
                   tags$img(src = "www/me.jpg")
                 ),
                 carouselItem(
                   # caption = "Page 1",
                   tags$img(src = "www/van.jpg")
                 ),
                 carouselItem(
                   # caption = "Page 1",
                   tags$img(src = "www/bike.jpg")
                 ))))
      )))
    )

        # ),                     tagList(tags$span(
        #                  HTML(
        #                    "<span>University of Wisconsin – Madison<br>
        #       Master of Urban and Regional Planning<br>
        #       Certificate in Transportation Management and Policy</span>"
        #                  )))
        # 
        #     "Adventure is what motivates me. I love to do all kinds of biking - road, gravel, cyclocross, traveling in my campervan."
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
    favicon(ext = 'png'),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = "Jacci's Portfolio"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

