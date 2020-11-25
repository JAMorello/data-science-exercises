library(shiny)
library(shinydashboard)

header <- dashboardHeader(title = "Titanic: Machine Learning from Disaster",
                          titleWidth = 400,
                          
        # tags$li(class = "dropdown",
        #     tags$style(".main-header {max-height: 50px}"),
        #     tags$style(".main-header .logo {height: 50px;}"),
        #     tags$style(".main-header .navbar {margin-left: 400px;}"),
        #     tags$style(".main-header .logo {width: 400px;}")
        # )
        dropdownMenu(type = "messages", badgeStatus = "success",
                     messageItem(
                         from = "Primera version",
                         message = "Hecha el 25/11/2020",
                         icon = icon("exclamation-triangle"),
                         time = "15:00"
                     ),
                     messageItem(
                         from = "Saludos!",
                         message = "Bienvenido a mi dashboard",
                         icon = icon("user-friends"),
                     ),
                     messageItem(
                         from = "Preguntas y sugerencias",
                         message = "Cualquier cosa me pueden contactar a juan.ag.morello@gmail.com",
                         icon = icon("envelope-open-text")
                     )
        ),
        
        dropdownMenu(type = "notifications", badgeStatus = "warning",
                     notificationItem(
                         text = "Gracias por visitar",
                         icon("users"),
                         status = "info"
                     ),
                     notificationItem(
                         text = "No olvides cepillarte los dientes",
                         icon("teeth"),
                         status = "warning"
                     ),
                     notificationItem(
                         text = "Se viene el apocalipsis",
                         icon = icon("meteor"),
                         status = "danger"
                     )
        ),
        
        dropdownMenu(type = "tasks", badgeStatus = "danger",
                     taskItem(value = 90, color = "green",
                              "Documentation"
                     ),
                     taskItem(value = 17, color = "aqua",
                              "Project X"
                     ),
                     taskItem(value = 75, color = "yellow",
                              "Server deployment"
                     ),
                     taskItem(value = 80, color = "red",
                              "Overall project"
                     )
        )
        
        
    )
    
sidebar <- dashboardSidebar(
    width = 350,
    sidebarMenu(
        menuItem("Dashboard", tabName = "dashboard", icon = icon("chart-line")),
        menuItem("Widgets", icon = icon("th"), tabName = "widgets",
                 badgeLabel = "new", badgeColor = "green"),
        menuItem("Source code", icon = icon("file-code-o"), 
                 href = "https://github.com/JAMorello/data-science-exercises/tree/master/shiny-dashboards/titanic"),
        menuItem("Acerca del creador", icon = icon("user-tie"),
                 href = "https://jamorello.github.io/about.html")
        
    )
)
    
body <- dashboardBody(
    tabItems(
        tabItem(tabName = "dashboard",
                h2("Dashboard tab content"),
                fluidRow(
                    box(
                        title = "Histogram", status = "primary",
                        solidHeader = TRUE,
                        collapsible = TRUE,
                        plotOutput("plot1", height = 250)
                    ),
                    
                    box(
                        title = "Inputs", status = "warning", 
                        solidHeader = TRUE, background = "black",
                        "Box content here", br(), "More box content",
                        sliderInput("slider", "Slider input:", 1, 100, 50),
                        textInput("text", "Text input:")
                    )
                ),
                
                fluidRow(
                    # A static infoBox
                    infoBox("New Orders", 10 * 2, icon = icon("credit-card"),
                            fill = TRUE),
                    # Dynamic infoBoxes
                    infoBoxOutput("progressBox"),
                    infoBoxOutput("approvalBox"),
                    box(width = 4, actionButton("count", "Increment progress"))
                ),
                
                fluidRow(
                    tabBox(
                        title = "First tabBox",
                        # The id lets us use input$tabset1 on the server to find the current tab
                        id = "tabset1", height = "250px",
                        tabPanel("Tab1", "First tab content"),
                        tabPanel("Tab2", "Tab content 2")
                    ),
                    tabBox(
                        side = "right", height = "250px",
                        selected = "Tab3",
                        tabPanel("Tab1", "Tab content 1"),
                        tabPanel("Tab2", "Tab content 2"),
                        tabPanel("Tab3", "Note that when side=right, the tab order is reversed.")
                    )
                ),
                fluidRow(
                    tabBox(
                        # Title can include an icon
                        title = tagList(shiny::icon("gear"), "tabBox status"),
                        tabPanel("Tab1",
                                 "Currently selected tab from first box:",
                                 verbatimTextOutput("tabset1Selected")
                        ),
                        tabPanel("Tab2", "Tab content 2")
                    )
                )
                
        ),
        
        tabItem(tabName = "widgets",
                h2("Widgets tab content")
        )
    )
    
        # tabItems(
        #     # First tab content
        #     tabItem(tabName = "dashboard",
        #         fluidRow(
        #             box(plotOutput("plot1", height = 250)),
        #                 
        #             box(
        #                 title = "Controls",
        #                 sliderInput("slider", "Number of observations:", 1, 100, 50)
        #             )
        #         )
        #     ),
        #     
        #     # Second tab content
        #     tabItem(tabName = "widgets",
        #         h2("Widgets tab content")
        #     )
        # )
        
    )
    
dashboardPage(header, sidebar, body, skin = "black")

