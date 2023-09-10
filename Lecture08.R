#https://lcolladotor.github.io/jhustatcomputing2023/posts/08-managing-data-frames-with-tidyverse/
library('tidyverse')
library('dplyr')

chicago <- readRDS(here::here('jhustatcomputing2023','data','chicago.rds'))

chicago <- as_tibble(chicago)
str(chicago)

chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
select(chic.f, date, tmpd, pm25tmean2)

chicago <- arrange(chicago, date)
head(select(chicago, date, pm25tmean2), 3)
tail(select(chicago, date, pm25tmean2), 3)

chicago <- rename(chicago, dewpoint = dptp, pm25 = pm25tmean2)
head(chicago[, 1:5], 3)

chicago <- mutate(chicago, pm25detrend = pm25 - mean(pm25, na.rm = TRUE))
head(chicago)
tail(chicago)
head(transmute(chicago,
               pm10detrend = pm10tmean2 - mean(pm10tmean2, na.rm = TRUE),
               o3detrend = o3tmean2 - mean(o3tmean2, na.rm = TRUE)
))

chicago %>%
  mutate(year = as.POSIXlt(date)$year + 1900) %>%
  group_by(year) %>%
  summarize(
    pm25 = mean(pm25, na.rm = TRUE),
    o3 = max(o3tmean2, na.rm = TRUE),
    no2 = median(no2tmean2, na.rm = TRUE)
  )

slice_sample(chicago, n = 10)
