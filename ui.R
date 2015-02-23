library(shiny)
require(datasets)

# Define the overall UI
shinyUI(
  fluidPage(
    titlePanel("Lawyers' ratings of state judges in the US Superior Court."),
    sidebarLayout(position = "right",
      sidebarPanel( p("This app explores Ratings of State Judges in the 
        US Superior Court from a data frame containing 43 observations on 12 
        numeric variables as follows:"),
        br(),
        br(),
        p("[,1]  CONT	Number of contacts of lawyer with judge.
        [,2]	INTG	Judicial integrity.
        [,3]	DMNR	Demeanor.
        [,4]	DILG	Diligence.
        [,5]	CFMG	Case flow managing.
        [,6]	DECI	Prompt decisions.
        [,7]	PREP	Preparation for trial.
        [,8]	FAMI	Familiarity with law.
        [,9]	ORAL	Sound oral rulings.
        [,10]	WRIT	Sound written rulings.
        [,11]	PHYS	Physical ability.
        [,12]	RTEN	Worthy of retention."),

        p("Use the select lists to filter main variables into the table.")
      ),
      mainPanel(
        # Create a new Row in the UI for selectInputs
        fluidRow(
          column(4, 
                 selectInput("INTG", 
                             "Judicial integrity:", 
                             c("All", 
                               unique(as.character(USJudgeRatings$INTG))))
          ),
          column(4, 
                 selectInput("DILG", 
                             "Diligence:", 
                             c("All", 
                               unique(as.character(USJudgeRatings$DILG))))
          ),
          column(4, 
                 selectInput("FAMI", 
                             "Familiarity with law.:", 
                             c("All", 
                               unique(as.character(USJudgeRatings$FAMI))))
          )        
        ),
        # Create a new row for the table.
        fluidRow(
          dataTableOutput(outputId="table")
        )    
      )         
      )
    )    
 
)

