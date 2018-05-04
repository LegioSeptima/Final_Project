library(shiny)
library(shinydashboard)
library(tidytext)
library(data.table)
library(wordcloud)
library(tidyverse)
library(ggplot2)
library(shinythemes)

data("stop_words")
load("myEnvironment.RData")

fluidPage(theme = shinytheme("superhero"),
          
ui <- navbarPage(
  title = "Analysis of Harry Potter Reviews and Text",
  tabPanel(
    "About",
    mainPanel(
      h3("Each tab examines a different aspect of the Harry Potter Series"),
      h6("This project was completed by Steven Tran")
    ),
    img(src = "harrypotter.jpg", align = "center", height="50%")
  ),
  tabPanel(
    "Ratings",
    sidebarPanel(
      radioButtons(
        inputId = "method", "Method",
        choices = list(
          "By Year",
          "By Book",
          "Individual"
        ),
        selected = "By Year"
      )
    ),
    mainPanel(
      plotOutput("method")
    )
  ),
  tabPanel(
    "Word Count",
    sidebarPanel(
      radioButtons(
        inputId = "book2", "Book:",
        choices = list(
          "Harry Potter and the Sorcerer's Stone" = 1,
          "Harry Potter and the Chamber of Secrets" = 2,
          "Harry Potter and the Prisoner of Azkaban" = 3,
          "Harry Potter and the Goblet of Fire" = 4,
          "Harry Potter and the Order of the Phoenix" = 5,
          "Harry Potter and the Half Blood Prince" = 6,
          "Harry Potter and the Deathly Hallows" = 7,
          "All" = 0
        ),
        selected = 1
      ),
      sliderInput("minCount",
                  "Minimum Frequency:",
                  min = 1, max = 1000, value = 100
      )
    ),
    mainPanel(
      plotOutput("word")
    )
  ),
  tabPanel(
    "Sentiment Analysis",
    sidebarPanel(
      radioButtons(
        inputId = "book3", "Book:",
        choices = list(
          "Harry Potter and the Sorcerer's Stone" = 1,
          "Harry Potter and the Chamber of Secrets" = 2,
          "Harry Potter and the Prisoner of Azkaban" = 3,
          "Harry Potter and the Goblet of Fire" = 4,
          "Harry Potter and the Order of the Phoenix" = 5,
          "Harry Potter and the Half Blood Prince" = 6,
          "Harry Potter and the Deathly Hallows" = 7,
          "All" = 0
        ),
        selected = 1
      )
    ),
    mainPanel(
      plotOutput("sentiment")
    )
  ),
  tabPanel(
    "Word Cloud",

    sidebarLayout(
      sidebarPanel(
        selectInput("selection", "Choose a book:",
          choices = list(
            "Harry Potter and the Sorcerer's Stone" = 1,
            "Harry Potter and the Chamber of Secrets" = 2,
            "Harry Potter and the Prisoner of Azkaban" = 3,
            "Harry Potter and the Goblet of Fire" = 4,
            "Harry Potter and the Order of the Phoenix" = 5,
            "Harry Potter and the Half Blood Prince" = 6,
            "Harry Potter and the Deathly Hallows" = 7,
            "All" = 0
          )
        )
        ,
        sliderInput("freq",
          "Minimum Frequency:",
          min = 1, max = 50, value = 15
        ),
        sliderInput("max",
          "Maximum Number of Words:",
          min = 1, max = 300, value = 100
        )
      ),
      mainPanel(
        plotOutput("wordcloud")
      )
    )
  )
)
)