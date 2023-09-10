#https://lcolladotor.github.io/jhustatcomputing2023/posts/09-tidy-data-and-the-tidyverse/
library(tidyr)

relig_income

library(tidyverse)

relig_income %>%
  pivot_longer(-religion, names_to = "income", values_to = "respondents") %>%
  mutate(religion = factor(religion), income = factor(income))

relig_income %>%
  pivot_longer(-religion, names_to = "income", values_to = "respondents") %>%
  mutate(religion = factor(religion), income = factor(income)) %>%
  group_by(income) %>%
  summarize(total_respondents = sum(respondents)) %>%
  pivot_wider(
    names_from = "income",
    values_from = "total_respondents"
  ) %>%
  knitr::kable()

library(gapminder)
gapminder

gapminder %>%
  unite(
    col = "country_continent_year",
    country:year,
    sep = "_"
  )

gapminder %>%
  unite(
    col = "country_continent_year",
    country:year,
    sep = "_"
  ) %>%
  separate(
    col = "country_continent_year",
    into = c("country", "continent", "year"),
    sep = "_"
  )
