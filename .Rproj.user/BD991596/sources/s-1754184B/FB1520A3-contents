#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(resume)

# Define UI for application that draws a histogram
shinyUI(
    resume_page(
        app_title = "Jacci Z",
        nav = resume_navbar(
            refs = c(
                "about" = "About",
                "experience" = "Experience",
                'projects' = "Personal projects",
                "education" = "Education",
                "interests" = "Interests",
                "awards" = "Awards"
            ),
            image = "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/apple/198/sign-of-the-horns_1f918.png",
            color = "pink"
        ),
        body = resume_body(
            # About
            resume_section(
                id = "about",
                h2('Jacci Ziebert'),
                h3('Madison, WI jacciziebert@gmail.com'),
                span("I work as a data analyst in the public sector. I got my Master's in transportation planning
                     and have worked at my state's Department of Transportation for 5 years")
            ),
            # experience
            resume_section(
                id = "experience",
                h4('experience'),
                tags$div(HTML("<iframe height=600 width=100% frameborder=no src=http://jacciz.shinyapps.io/Shiny_Crashes> </iframe>"))
            ),
            # projects
            resume_section(
                id = "projects",
                h4('Personal projects')
            ),
            # education
            resume_section(
                id = "education",
                h4('education'),
                plotOutput("education")
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
