library(shiny)
library(datasets)
data(mtcars)
rankeddata<-transform(mtcars, 
                      mpgrank = rank(mpg, ties.method = "min"), 
                      hprank = rank(hp, ties.method = "min"), 
                      disprank = rank(disp, ties.method = "min")
)
shinyServer(function(input, output) {

        output$carlist <- renderTable({
                finaldata <- transform(rankeddata, 
                                       score = mpgrank * input$mpgwt + hprank * input$hpwt + disprank * input$dispwt)
                head(finaldata[with(finaldata, order(-score)), c("mpg","hp","disp")], n=input$ncar)
                
        })
        
})