# # Set options here
# options(golem.app.prod = FALSE) # TRUE = production mode, FALSE = development mode
# 
# # Detach all loaded packages and clean your environment
# golem::detach_all_attached()
# # rm(list=ls(all.names = TRUE))
# 
# # Document and reload your package
# golem::document_and_reload()
# 
# # Run the application
# run_app()




# Set options here
options(golem.app.prod = FALSE) # TRUE = production mode, FALSE = development mode

# Detach all loaded packages and clean your environment
golem::detach_all_attached()
# rm(list=ls(all.names = TRUE))

# Document and reload your package
golem::document_and_reload()

options(shiny.autoreload = TRUE)
# Run the application
shiny::runApp(appDir = here::here())

# rstudioapi::viewer("http://127.0.0.1:5324")