#https://lcolladotor.github.io/jhustatcomputing2023/posts/10-joining-data-in-r/
library(tidyverse)

outcomes <- tibble(
  id = rep(c("a", "b", "c"), each = 3),
  visit = rep(0:2, 3),
  outcome = rnorm(3 * 3, 3)
)

print(outcomes)

subjects <- tibble(
  id = c("a", "b", "c"),
  house = c("detached", "rowhouse", "rowhouse")
)

print(subjects)

left_join(x = outcomes, y = subjects, by = "id")

#With incomplete data
subjects <- tibble(
  id = c("a", "b", "c"),
  visit = c(0, 1, 0),
  house = c("detached", "rowhouse", "rowhouse"),
)

print(subjects)

left_join(outcomes, subjects, by = c("id", "visit"))

