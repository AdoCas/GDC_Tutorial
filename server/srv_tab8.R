

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

output$t8_SampleTypeInTCGA <- renderPrint({
  res = cases() %>% filter(project.project_id == "TCGA-BRCA") %>% facet("samples.sample_type") %>% aggregations()
  res
})

output$t8_DemographicTCGA <- renderPrint({
  res = cases() %>% filter(project.project_id == "TCGA-BRCA") %>% facet(c("demographic.race", "demographic.gender", "demographic.ethnicity")) %>% aggregations()
  res
})

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
