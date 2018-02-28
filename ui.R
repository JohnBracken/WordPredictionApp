
#Front end user interface code for the word prediction
#Shiny application.
suppressWarnings(library(shiny))

shinyUI(fluidPage(
  
  #Do some additional preformatting of the app user interface, including
  #setting background color, font style and font size.
  tags$head(tags$style(
    HTML('
        body, input, button, select { 
            font-family: "Helvetica";
            font-size: 30px;
            font-weight: bold;
            background-color: #CBFAFF;
        }')
  )),  
  
  #Make the text of the input phrase typed in by the user nice and large.
  tags$style("#phrase {font-size:30px;height:30px;}"),
  
  # Application title
  titlePanel(HTML("<b><i>Word Prediction Application</i></b>")),

  #Sidebar with a radiobutton panel to select the prediction context of
  #blogs, news or twitter.
  sidebarLayout(
    sidebarPanel(
      h3("Choose document type prediction (context):"),
      radioButtons("doc_type", "Document Type:",
                   c("Blogs" ="blogs",
                     "News" = "news",
                     "Twitter" = "twitter"))
    ),
  
    #In the main panel, show the text box that allows the user to type
    #the input phrase, the button to execute the prediction and also show
    #the top 10 predicted words after the prediction has been done.  
    mainPanel(
      titlePanel(HTML("<b><i>Next Word Prediction</i></b>")),
      h3("Please enter a test phrase and then hit the predict button"),
      textAreaInput("phrase", "Test phrase:", height= "100%", width= "200%"),
      actionButton("predictButton", "Predict!",style='font-size:30px'),
      h3("Top 10 possible predicted words ('NA' means no additional words found):"),
      textOutput("nText")
       
                
      )
    )
))
