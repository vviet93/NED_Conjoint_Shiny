#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(data.table)

main.data <- fread("baselinetable.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(theme="style.css",
    div(class="header"),

    # Application title
    titlePanel("",windowTitle="Determinants of Foreign Information Use in North Korea"),
    h2(style="padding-left:15px;padding-right:15px","Determinants of Foreign Information Use in North Korea/북한의 해외정보이용 결정요인"),
    div(class="divideline"," "),
    navbarPage("",
        tabPanel("English",
                 
                 div(style="padding-left:6%;padding-right:6%;margin-top:30px",
                     p("This application is intended for use by NGOs and other organizations to support their information dissemination strategies in North Korea. It can also be used by researchers interested in the determinants of foreign information use in the country. Users can specify foreign information profiles based on seven fixed profile attributes with varying levels. The outcome statistic represents the",
                     span(style="font-weight:bold","probability"), 
                     "that the specified profile will be used In other words, the probability that this information will be read, listened to, or watched.")
                      ),
        
                # Sidebar with a slider input for number of bins 
                fluidRow(class="containerblock",
                         column(class="conjointtable",width=5,
                                fluidRow(class="titletable",width=12,h3("Foreign Information Profile")),
                                fluidRow(class="alignedrow",column(class="columntitle",width=3,"Provider"),
                                         column(width=1,class="connectionline",""),
                                         column(width=8,class="selectiontable",selectInput("provider",label="",choices = main.data[feature=="Provider",level]))
                                ),
                                fluidRow(class="alignedrow",column(class="columntitle",width=3,"Aquisition Place"),
                                         column(width=1,class="connectionline",""),
                                         column(width=8,class="selectiontable",selectInput("aquisition",label="",choices=main.data[feature=="Aquisition Place",level]))
                                ),
                                fluidRow(class="alignedrow",column(class="columntitle",width=3,"Distribution Media"),
                                         column(width=1,class="connectionline",""),
                                         column(width=8,class="selectiontable",selectInput("distribution",label="",choices=main.data[feature=="Distribution Media",level]))),
                                fluidRow(class="alignedrow",column(class="columntitle",width=3,"Content Subject"),
                                         column(width=1,class="connectionline",""),
                                         column(width=8,class="selectiontable",selectInput("contsubj",label="",choices=main.data[feature=="Content Subject",level]))),
                                fluidRow(class="alignedrow",column(class="columntitle",width=3,"Content Form"),
                                         column(width=1,class="connectionline",""),
                                         column(width=8,class="selectiontable",selectInput("contform",label="",choices=main.data[feature=="Content Form",level]))),
                                fluidRow(class="alignedrow",column(class="columntitle",width=3,"Target Age"),
                                         column(width=1,class="connectionline",""),
                                         column(width=8,class="selectiontable",selectInput("age",label="",choices=main.data[feature=="Target Age",level]))),
                                fluidRow(class="alignedrow",column(class="columntitle",width=3,"Type"),
                                         column(width=1,class="connectionline",""),
                                         column(width=8,class="selectiontable",selectInput("type",label="",main.data[feature=="Type",level])))
                         ),
                         column(class="maintext",width=7,
                                htmlOutput("marginal"),
                                htmlOutput("provider.effect"),
                                htmlOutput("aquisition.effect"),
                                htmlOutput("distribution.effect"),
                                htmlOutput("contsubj.effect"),
                                htmlOutput("contform.effect"),
                                htmlOutput("age.effect"),
                                htmlOutput("type.effect"),)
                ),
                div(style="padding-left:6%;padding-right:6%;margin-top:25px",
                    p(span(style="font-weight:bold","Source:"),'The outcome statistic is derived from a choice-based conjoint using data from a 2021 survey of 313 North Korean defector-migrants living in South Korea. Funded by the National Endowment for Democracy (NED), the survey was administered as part of the project, “Information Dissemination in North Korea: The Role of Social Capital, Civil Society, and Markets," by Peter Ward and Steven Denney. For questions or concerns about this application, please contact Steven Denney at',
                      a(href="mailto:steven.denney@univie.ac.at","steven.denney@univie.ac.at",.noWS="after"),
                      ".")
                    )
        ),
        
        
        #######################Korean Content from below
        
        tabPanel("한국어",div(style="padding-left:6%;padding-right:6%;margin-top:30px",
                              p("이 애플리케이션은 NGO 및 기타 단체가 북한 내 정보  배포 전략을 지원하기 위한 것입니다. 해외로부터 유입된 정보 사용의 결정요인에 관심이 있는 연구자들도 이용할 수 있습니다. 이용자는 다양한 수준의 7가지 고정 프로파일 속성을 기반으로 외부 정보 프로파일을 지정할 수 있습니다.  산출된 통계는 조사응답자가 지정된 프로필의 속성을 사용할",
                                span(style="font-weight:bold","확률"), 
                                "을 나타냅니다.  즉, 조사응답자가 이 정보를 읽거나, 듣거나, 볼 확률입니다.")
        ),
        
        # Sidebar with a slider input for number of bins 
        fluidRow(class="containerblock",
                 column(class="conjointtable",width=5,
                        fluidRow(class="titletable",width=12,h3("해외정보의 프로필")),
                        fluidRow(class="alignedrow",column(class="columntitle",width=3,"제공자"),
                                 column(width=1,class="connectionline",""),
                                 column(width=8,class="selectiontable",selectInput("provider.kr",label="",main.data[feature=="Provider",KOR]))
                        ),
                        fluidRow(class="alignedrow",column(class="columntitle",width=3,"입수 장소"),
                                 column(width=1,class="connectionline",""),
                                 column(width=8,class="selectiontable",selectInput("aquisition.kr",label="",main.data[feature=="Aquisition Place",KOR]))
                        ),
                        fluidRow(class="alignedrow",column(class="columntitle",width=3,"내용물 유통 매체"),
                                 column(width=1,class="connectionline",""),
                                 column(width=8,class="selectiontable",selectInput("distribution.kr",label="",main.data[feature=="Distribution Media",KOR]))),
                        fluidRow(class="alignedrow",column(class="columntitle",width=3,"내용물 주제/배경"),
                                 column(width=1,class="connectionline",""),
                                 column(width=8,class="selectiontable",selectInput("contsubj.kr",label="",main.data[feature=="Content Subject",KOR]))),
                        fluidRow(class="alignedrow",column(class="columntitle",width=3,"내용물 형태"),
                                 column(width=1,class="connectionline",""),
                                 column(width=8,class="selectiontable",selectInput("contform.kr",label="",main.data[feature=="Content Form",KOR]))),
                        fluidRow(class="alignedrow",column(class="columntitle",width=3,"내용물의 대상 연령대"),
                                 column(width=1,class="connectionline",""),
                                 column(width=8,class="selectiontable",selectInput("age.kr",label="",choices=main.data[feature=="Target Age",KOR]))),
                        fluidRow(class="alignedrow",column(class="columntitle",width=3,"내용물의 분류"),
                                 column(width=1,class="connectionline",""),
                                 column(width=8,class="selectiontable",selectInput("type.kr",label="",choices=main.data[feature=="Type",KOR])))
                 ),
                 column(class="maintext",width=7,
                        htmlOutput("marginal.kr"),
                        htmlOutput("provider.effect.kr"),
                        htmlOutput("aquisition.effect.kr"),
                        htmlOutput("distribution.effect.kr"),
                        htmlOutput("contsubj.effect.kr"),
                        htmlOutput("contform.effect.kr"),
                        htmlOutput("age.effect.kr"),
                        htmlOutput("type.effect.kr"),)
        ),
        div(style="padding-left:6%;padding-right:6%;margin-top:25px",
            p(span(style="font-weight:bold","출처:"),'이  산출된 통계는 한국에 살고 있는 313명의 탈북자-이민자를 대상으로 한 2021년 조사 데이터를 이용한 선택 기반 결합 분석 (이산 선택 모델링)에서 도출되었다. 이 조사는 전국 민주주의 기금의 지원을 받아 "북한에서 해외내용물 유통 구조: 사회연결망, 시장, 사회 변화 참가자들을 위한 정보," Peter Ward와 Steven Denney의 보고서입니다. 이 응용 프로그램에 대한 질문이나 우려 사항은 Steven Denney(',
              a(href="mailto:steven.denney@univie.ac.at","steven.denney@univie.ac.at",.noWS="outside"),
              ")에게 문의하십시오.")
        ))
    )
    
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
    observe({
        updateSelectInput(session,"provider",selected=sample(main.data[feature=="Provider",level],1))
        updateSelectInput(session,"aquisition",selected=sample(main.data[feature=="Aquisition Place",level],1))
        updateSelectInput(session,"distribution",selected=sample(main.data[feature=="Distribution Media",level],1))
        updateSelectInput(session,"contsubj",selected=sample(main.data[feature=="Content Subject",level],1))
        updateSelectInput(session,"contform",selected=sample(main.data[feature=="Content Form",level],1))
        updateSelectInput(session,"age",selected=sample(main.data[feature=="Target Age",level],1))
        updateSelectInput(session,"type",selected=sample(main.data[feature=="Type",level],1))
        
        updateSelectInput(session,"provider.kr",selected=sample(main.data[feature=="Provider",KOR],1))
        updateSelectInput(session,"aquisition.kr",selected=sample(main.data[feature=="Aquisition Place",KOR],1))
        updateSelectInput(session,"distribution.kr",selected=sample(main.data[feature=="Distribution Media",KOR],1))
        updateSelectInput(session,"contsubj.kr",selected=sample(main.data[feature=="Content Subject",KOR],1))
        updateSelectInput(session,"contform.kr",selected=sample(main.data[feature=="Content Form",KOR],1))
        updateSelectInput(session,"age.kr",selected=sample(main.data[feature=="Target Age",KOR],1))
        updateSelectInput(session,"type.kr",selected=sample(main.data[feature=="Type",KOR],1))
    })
    output$marginal <- renderUI({
        value <- main.data[feature=="Provider" & level==input$provider,estimate] + 
            main.data[feature=="Aquisition Place" & level==input$aquisition,estimate] +
            main.data[feature=="Distribution Media" & level==input$distribution,estimate]+
            main.data[feature=="Content Subject" & level==input$contsubj,estimate]+
            main.data[feature=="Content Form" & level==input$contform,estimate]+
            main.data[feature=="Target Age"& level==input$age,estimate]+
            main.data[feature=="Type"&level==input$type,estimate]
        value=signif(value*100+48.40593,4)
        div(p("Based on the parameters selected, this foreign information profile has a ",span(style="font-weight:bold; color:#A4243B",paste0(value,"%")),"probability of being used."))
    })
    
    output$provider.effect <- renderUI({
        if(input$provider=="Stranger"){
            p(class="effectsize","The provider being",
              span(style="font-weight:bold;color:#00072D",input$provider),
              "changed this probability by",
              span(style="font-weight:bold;color:#00072D",paste0(-signif(100*main.data[feature=="Provider" & level=="Family",estimate],2),"%")),
              "compared to Family")
        }
        else{
            p(class="effectsize","The provider being",
              span(style="font-weight:bold;color:#00072D",input$provider),
              "changed this probability by",
              span(style="font-weight:bold;color:#00072D",paste0(signif(100*main.data[feature=="Provider" & level==input$provider,estimate],2),"%")),
              "compared to Stranger")
        }
    })
    
    output$aquisition.effect <- renderUI({
        if(input$aquisition=="One's own home"){
            p(class="effectsize","The acquisition place being",
              span(style="font-weight:bold;color:#00072D",input$aquisition.effect),
              "changed this probability by",
              span(style="font-weight:bold;color:#00072D",paste0(-signif(100*main.data[feature=="Aquisition Place" & level=="Market",estimate],2),"%")),
              "compared to Market")
        }
        else{
            p(class="effectsize","The acquisition place being",
              span(style="font-weight:bold;color:#00072D",input$aquisition.effect),
              "changed this probability by",
              span(style="font-weight:bold;color:#00072D",paste0(signif(100*main.data[feature=="Aquisition Place" & level==input$aquisition,estimate],2),"%")),
              "compared to One's Own Home")
        }
    })
    
    output$distribution.effect <- renderUI({
        if(input$distribution=="North Korean phone/tablet"){
            p(class="effectsize","The distribution media being",
              span(style="font-weight:bold;color:#00072D",input$distribution),
              "changed this probability by",
              span(style="font-weight:bold;color:#00072D",paste0(-signif(100*main.data[feature=="Distribution Media" & level=="Foreign device (phone etc.)",estimate],2),"%")),
              "compared to Foreign Device")
        }
        else{
            p(class="effectsize","The distribution media being",
              span(style="font-weight:bold;color:#00072D",input$distribution),
              "changed this probability by",
              span(style="font-weight:bold;color:#00072D",paste0(signif(100*main.data[feature=="Distribution Media" & level==input$distribution,estimate],2),"%")),
              "compared to North Korean Phone or Tablet")
        }
    })
    
    output$contsubj.effect <- renderUI({
        if(input$contsubj=="Not country-related"){
            p(class="effectsize","The content subject being",
              span(style="font-weight:bold;color:#00072D",input$contsubj),
              "changed this probability by",
              span(style="font-weight:bold;color:#00072D",paste0(-signif(100*main.data[feature=="Content Subject" & level=="North Korean content",estimate],2),"%")),
              "compared to North Korean Content")
        }
        else{
            p(class="effectsize","The content subject being",
              span(style="font-weight:bold;color:#00072D",input$contsubj),
              "changed this probability by",
              span(style="font-weight:bold;color:#00072D",paste0(signif(100*main.data[feature=="Content Subject" & level==input$contsubj,estimate],2),"%")),
              "compared to Not Country-related")
        }
    })
    
    output$contform.effect <- renderUI({
        if(input$contform=="Text"){
            p(class="effectsize","The content form being",
              span(style="font-weight:bold;color:#00072D",input$contform),
              "changed this probability by",
              span(style="font-weight:bold;color:#00072D",paste0(-signif(100*main.data[feature=="Content Form" & level=="Computer program or app",estimate],2),"%")),
              "compared to Computer Program or App")
        }
        else{
            p(class="effectsize","The content form being",
              span(style="font-weight:bold;color:#00072D",input$contform),
              "changed this probability by",
              span(style="font-weight:bold;color:#00072D",paste0(signif(100*main.data[feature=="Content Form" & level==input$contform,estimate],2),"%")),
              "compared to Text")
        }
    })
    
    output$age.effect <- renderUI({
        if(input$age=="Youth"){
            p(class="effectsize","The target age being",
              span(style="font-weight:bold;color:#00072D",input$age),
              "changed this probability by",
              span(style="font-weight:bold;color:#00072D",paste0(-signif(100*main.data[feature=="Target Age" & level=="50+",estimate],2),"%")),
              "compared to 50+")
        }
        else{
            p(class="effectsize","The target age being",
              span(style="font-weight:bold;color:#00072D",input$age),
              "changed this probability by",
              span(style="font-weight:bold;color:#00072D",paste0(signif(100*main.data[feature=="Target Age" & level==input$age,estimate],2),"%")),
              "compared to Youth")
        }
    })
    
    output$type.effect <- renderUI({
        if(input$type=="Fiction"){
            p(class="effectsize","The content type being",
              span(style="font-weight:bold;color:#00072D",input$type),
              "changed this probability by",
              span(style="font-weight:bold;color:#00072D",paste0(-signif(100*main.data[feature=="Type" & level=="Fiction",estimate],2),"%")),
              "compared to Non-fiction")
        }
        else{
            p(class="effectsize","The content type being",
              span(style="font-weight:bold;color:#00072D",input$type),
              "changed this probability by",
              span(style="font-weight:bold;color:#00072D",paste0(signif(100*main.data[feature=="Type" & level=="Fiction",estimate],2),"%")),
              "compared to Fiction")
        }
    })

    #Korean outputs
    
    
    output$marginal.kr <- renderUI({
        value <- main.data[feature=="Provider" & KOR==input$provider.kr,estimate] + 
            main.data[feature=="Aquisition Place" & KOR==input$aquisition.kr,estimate] +
            main.data[feature=="Distribution Media" & KOR==input$distribution.kr,estimate]+
            main.data[feature=="Content Subject" & KOR==input$contsubj.kr,estimate]+
            main.data[feature=="Content Form" & KOR==input$contform.kr,estimate]+
            main.data[feature=="Target Age"& KOR==input$age.kr,estimate]+
            main.data[feature=="Type"&KOR==input$type.kr,estimate]
        value=signif(value*100+48.40593,4)
        div(p("선택한 매개 변수를 기준으로 이 외부 정보 프로파일은",span(style="font-weight:bold; color:#A4243B",paste0(value,"%")),"의 소비 확률을 가집니다."))
    })
    
    output$provider.effect.kr <- renderUI({
        if(input$provider.kr=="친분이 없는 사람"){
            p(class="effectsize","이 제공자는",
              span(style="font-weight:bold;color:#00072D",input$provider.kr),
              "로서 가족/친척 에 비하면 확률을",
              span(style="font-weight:bold;color:#00072D",paste0(-signif(100*main.data[feature=="Provider" & level=="Family",estimate],2),"%")),
              "로 낮춘다/높인다.")
        }
        else{
            p(class="effectsize","이 제공자는",
              span(style="font-weight:bold;color:#00072D",input$provider.kr),
              "로서 친분이 없는 사람에 비하면 확률을",
              span(style="font-weight:bold;color:#00072D",paste0(signif(100*main.data[feature=="Provider" & KOR==input$provider.kr,estimate],2),"%")),
              "로 낮춘다/높인다.")
        }
    })
    
    output$aquisition.effect.kr <- renderUI({
        if(input$aquisition.kr=="본인의 집"){
            p(class="effectsize","이 장소는",
              span(style="font-weight:bold;color:#00072D",input$aquisition.effect.kr),
              "로서장 마당 에 비하면 확률을",
              span(style="font-weight:bold;color:#00072D",paste0(-signif(100*main.data[feature=="Aquisition Place" & level=="Market",estimate],2),"%")),
              "로 낮춘다/높인다.")
        }
        else{
            p(class="effectsize","이 장소는 ",
              span(style="font-weight:bold;color:#00072D",input$aquisition.effect.kr),
              "로서 본인의 집 에 비하면 확률을",
              span(style="font-weight:bold;color:#00072D",paste0(signif(100*main.data[feature=="Aquisition Place" & KOR==input$aquisition.kr,estimate],2),"%")),
              "로 낮춘다/높인다.")
        }
    })
    
    output$distribution.effect.kr <- renderUI({
        if(input$distribution.kr=="북한 손전화기/태블릿"){
            p(class="effectsize","이 유통 매체는",
              span(style="font-weight:bold;color:#00072D",input$distribution.kr),
              "로서 외국 휴대용 전자기기 (손전화기 등) 에 비하면 확률을",
              span(style="font-weight:bold;color:#00072D",paste0(-signif(100*main.data[feature=="Distribution Media" & level=="Foreign device (phone etc.)",estimate],2),"%")),
              "로 낮춘다/높인다.")
        }
        else{
            p(class="effectsize","이 유통 매체는",
              span(style="font-weight:bold;color:#00072D",input$distribution.kr),
              "로서 북한 손전화기/태블릿 에 비하면 확률을",
              span(style="font-weight:bold;color:#00072D",paste0(signif(100*main.data[feature=="Distribution Media" & KOR==input$distribution.kr,estimate],2),"%")),
              "로 낮춘다/높인다.")
        }
    })
    
    output$contsubj.effect.kr <- renderUI({
        if(input$contsubj.kr=="특정 나라와 관련없음"){
            p(class="effectsize","이 내용 주제는",
              span(style="font-weight:bold;color:#00072D",input$contsubj.kr),
              "로서 북한관련 에 비하면 확률을",
              span(style="font-weight:bold;color:#00072D",paste0(-signif(100*main.data[feature=="Content Subject" & level=="North Korean content",estimate],2),"%")),
              "로 낮춘다/높인다.")
        }
        else{
            p(class="effectsize","이 내용 주제는",
              span(style="font-weight:bold;color:#00072D",input$contsubj.kr),
              "로서 특정 나라와 관련없음 에 비하면 확률을",
              span(style="font-weight:bold;color:#00072D",paste0(signif(100*main.data[feature=="Content Subject" & KOR==input$contsubj.kr,estimate],2),"%")),
              "로 낮춘다/높인다.")
        }
    })
    
    output$contform.effect.kr <- renderUI({
        if(input$contform.kr=="글"){
            p(class="effectsize","이 내용 유형은",
              span(style="font-weight:bold;color:#00072D",input$contform.kr),
              "로서 컴퓨터프로그램 혹은 앱 에 비하면 확률을",
              span(style="font-weight:bold;color:#00072D",paste0(-signif(100*main.data[feature=="Content Form" & level=="Computer program or app",estimate],2),"%")),
              "로 낮춘다/높인다.")
        }
        else{
            p(class="effectsize","이 내용 유형은",
              span(style="font-weight:bold;color:#00072D",input$contform.kr),
              "로서 글 에 비하면 확률을",
              span(style="font-weight:bold;color:#00072D",paste0(signif(100*main.data[feature=="Content Form" & KOR==input$contform.kr,estimate],2),"%")),
              "로 낮춘다/높인다.")
        }
    })
    
    output$age.effect.kr <- renderUI({
        if(input$age.kr=="청소년기"){
            p(class="effectsize","대상 연령대는",
              span(style="font-weight:bold;color:#00072D",input$age.kr),
              "로서 장년기/노년기 (50세 이상) 에 비하면 확률을",
              span(style="font-weight:bold;color:#00072D",paste0(-signif(100*main.data[feature=="Target Age" & level=="50+",estimate],2),"%")),
              "로 낮춘다/높인다.")
        }
        else{
            p(class="effectsize","대상 연령대는",
              span(style="font-weight:bold;color:#00072D",input$age.kr),
              "로서 청소년기 에 비하면 확률을",
              span(style="font-weight:bold;color:#00072D",paste0(signif(100*main.data[feature=="Target Age" & KOR==input$age.kr,estimate],2),"%")),
              "로 낮춘다/높인다.")
        }
    })
    
    output$type.effect.kr <- renderUI({
        if(input$type.kr=="허구"){
            p(class="effectsize","내용 종류는",
              span(style="font-weight:bold;color:#00072D",input$type.kr),
              "로서 실화 에 비하면 확률을",
              span(style="font-weight:bold;color:#00072D",paste0(-signif(100*main.data[feature=="Type" & level=="Fiction",estimate],2),"%")),
              "로 낮춘다/높인다.")
        }
        else{
            p(class="effectsize","내용 종류는",
              span(style="font-weight:bold;color:#00072D",input$type.kr),
              "로서 허구 에 비하면 확률을",
              span(style="font-weight:bold;color:#00072D",paste0(signif(100*main.data[feature=="Type" & level=="Fiction",estimate],2),"%")),
              "로 낮춘다/높인다.")
        }
    })

}

# Run the application 
shinyApp(ui = ui, server = server)
