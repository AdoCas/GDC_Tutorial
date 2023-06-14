

output$t8_ProjectsByProgram <- renderPrint({
  res = projects() %>% facet("program.name") %>% aggregations()
  head(res)
})

output$t8_ProjectsInTCGA <- renderPrint({
  res = cases() %>% filter(project.program.name == "TCGA") %>% facet("project.project_id") %>% aggregations()
  head(res)
})

output$t8_ProjectTCGAInfo <- renderPrint({
  res = projects() %>% filter(project_id == "TCGA-BRCA") %>% results_all()
  res
})

t8_res_SampleTypeInTCGA = cases() %>% filter(project.project_id == "TCGA-BRCA") %>% facet("samples.sample_type") %>% aggregations()

output$t8_SampleTypeInTCGA <- renderPrint({
  t8_res_SampleTypeInTCGA
})

output$t8_Plot_SampleTypeInTCGA <- renderPlot({
  ggplot(t8_res_SampleTypeInTCGA$samples.sample_type,aes(x = key, y = doc_count)) +
    geom_bar(stat='identity', colour="#005FFF", fill="#005FFF") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
})

t8_res_DemographicTCGA = cases() %>% filter(project.project_id == "TCGA-BRCA") %>% facet(c("demographic.race", "demographic.gender", "demographic.ethnicity")) %>% aggregations()

output$t8_DemographicTCGA <- renderPrint({
  t8_res_DemographicTCGA
})

output$t8_Plot_DemographycRace <- renderPlot({
  ggplot(t8_res_DemographicTCGA$demographic.race,aes(x = key, y = doc_count)) +
    geom_bar(stat='identity', colour="#005FFF", fill="#005FFF") +
    labs(title="RACE", x="Race", y="Count") +
    theme(plot.title = element_text(size=16, face="bold.italic", hjust=0.5),
          axis.title.x=element_blank(), 
          axis.title.y=element_blank(),
          axis.text.x = element_text(angle = 45, hjust = 1))
})

output$t8_Plot_DemographycGender <- renderPlot({
  ggplot(t8_res_DemographicTCGA$demographic.gender,aes(x = key, y = doc_count)) +
    geom_bar(stat='identity', colour="#005FFF", fill="#005FFF") +
    labs(title="GENDER", x="Race", y="Count") +
    theme(plot.title = element_text(size=16, face="bold.italic", hjust=0.5),
          axis.title.x=element_blank(), 
          axis.title.y=element_blank(),
          axis.text.x = element_text(angle = 45, hjust = 1))})

output$t8_Plot_DemographycEthnicity <- renderPlot({
  ggplot(t8_res_DemographicTCGA$demographic.ethnicity,aes(x = key, y = doc_count)) +
    geom_bar(stat='identity', colour="#005FFF", fill="#005FFF") +
    labs(title="ETHNICITY", x="Race", y="Count") +
    theme(plot.title = element_text(size=16, face="bold.italic", hjust=0.5),
          axis.title.x=element_blank(), 
          axis.title.y=element_blank(),
          axis.text.x = element_text(angle = 45, hjust = 1))})


output$t8_HowManyOtherBreastProjects <- renderPrint({
  res = projects() %>% filter(primary_site == "Breast") %>% count()
  res
})

output$t8_IDsIfOtherBreastProjects <- renderPrint({
  res = projects() %>% filter(primary_site == "Breast") %>% results_all()
  res$project_id
})

output$t8_NumberOfCases <- renderPrint({
  res = cases() %>% filter(project.primary_site == "Breast") %>% facet("project.project_id") %>% aggregations()
  res
})
