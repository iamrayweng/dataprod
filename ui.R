library(shiny) 

shinyUI(fluidPage(
        titlePanel("Compare Cars"),
        helpText("Usage: This small App is to help you pick a car",
                 "First, you need to decide how important you think of the following 3 properties:",
                 "Mile per Gallon",
                 "Horsepower",
                 "And Displacement",
                 "Give each of the elements a weight from 1 to 10,",
                 "And then, choose how many cars you want to list out, for example if you choose 10, it will display the top 10 ranked cars",
                 "Then click submit",
                 "The App will rank the cars from the mtcars dataset and show the choices in the panel to the right."
                 ),
        sidebarPanel(
                sliderInput('mpgwt', 'Weighting Mile per Gallon:', value=5, min = 1, max = 10, step = 1),
                sliderInput('hpwt', 'Weighting Horsepower:', value=5, min = 1, max = 10, step = 1),
                sliderInput('dispwt', 'Weighting Displacement:', value=5, min = 1, max = 10, step = 1),
                numericInput("ncar", "Number of rankings to view:", value=10),
                submitButton('Submit')
        ),
        mainPanel(
                h3("Top ranked cars:"),
                h4("The cars are ranked based on their rankings on mpg, hp and displacement weighted on the weighting you given in side panel"),
                tableOutput('carlist')
        )
)
)