library(shiny)
library(shinydashboard)
library(tidytext)
library(data.table)
library(wordcloud)
library(tidyverse)
library(ggplot2)

data("stop_words")
load("myEnvironment.RData")

server <- function(input, output) {
  
  output$method <- renderPlot({
    if(input$method=="By Year") return(r.y)
    if(input$method=="By Book") return(r.b)
    if(input$method== "Individual") return(r.by)
  },
  height = 800,
  width = 800
  )
  
  output$word <- renderPlot({
    if(input$book2==1) return(wordCount(book1.u, input$minCount))
    if(input$book2==2) return(wordCount(book2.u, input$minCount))
    if(input$book2==3) return(wordCount(book3.u, input$minCount))
    if(input$book2==4) return(wordCount(book4.u, input$minCount))
    if(input$book2==5) return(wordCount(book5.u, input$minCount))
    if(input$book2==6) return(wordCount(book6.u, input$minCount))
    if(input$book2==7) return(wordCount(book7.u, input$minCount))
    else return(wordCount(text.u, input$minCount))
  },
  height = 800,
  width = 800
  )
  
  output$sentiment <- renderPlot({
    if(input$book3==1) return(s1)
    if(input$book3==2) return(s2)
    if(input$book3==3) return(s3)
    if(input$book3==4) return(s4)
    if(input$book3==5) return(s5)
    if(input$book3==6) return(s6)
    if(input$book3==7) return(s7)
    else return(sentimentCount(text.df, ""))
  },
  height = 800,
  width = 800
  )
  

  sliderValues <- reactive({
    data.frame(
      Name <- c("max", "min"),
    Value <- c(input$freq, input$max)
    )
  })
  
  output$wordcloud <- renderPlot({
    if(input$selection==1){
      v <- sliderValues()
      wordcloud(book1.u$word , book1.u$n, scale=c(10,1),
                  min.freq = input$freq, max.words=input$max,
                  colors=brewer.pal(8, "Dark2")
      )
    }
    if(input$selection==2){
      v <- sliderValues()
      wordcloud(book2.u$word , book2.u$n, scale=c(10,1),
                min.freq = input$freq, max.words=input$max,
                colors=brewer.pal(8, "Dark2")
      )
    }
    if(input$selection==3){
      v <- sliderValues()
      wordcloud(book3.u$word , book3.u$n, scale=c(10,1),
                min.freq = input$freq, max.words=input$max,
                colors=brewer.pal(8, "Dark2")
      )
    }
    if(input$selection==4){
      v <- sliderValues()
      wordcloud(book4.u$word , book4.u$n, scale=c(10,1),
                min.freq = input$freq, max.words=input$max,
                colors=brewer.pal(8, "Dark2")
      )
    }
    if(input$selection==5){
      v <- sliderValues()
      wordcloud(book5.u$word , book5.u$n, scale=c(10,1),
                min.freq = input$freq, max.words=input$max,
                colors=brewer.pal(8, "Dark2")
      )
    }
    if(input$selection==6){
      v <- sliderValues()
      wordcloud(book6.u$word , book6.u$n, scale=c(10,1),
                min.freq = input$freq, max.words=input$max,
                colors=brewer.pal(8, "Dark2")
      )
    }
    if(input$selection==7){
      v <- sliderValues()
      wordcloud(book7.u$word , book7.u$n, scale=c(10,1),
                min.freq = input$freq, max.words=input$max,
                colors=brewer.pal(8, "Dark2")
      )
    }
    else{
      v <- sliderValues()
      wordcloud(text.u$word , text.u$n, scale=c(10,1),
                min.freq = input$freq, max.words=input$max,
                colors=brewer.pal(8, "Dark2")
      )
    }
  },
  height = 800,
  width = 800)
}
