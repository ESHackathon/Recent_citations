## load packages
library(tidyverse)

args = commandArgs(trailingOnly=TRUE)
# read/import data - assumes data is in working directory
data <- read.csv(args[1], header=TRUE)

# filter data where year is greater than 2010
## assumes year column is named exactly "Year"
filtered_data <- data %>% filter(Year>args[2])

# write filtered data to new file called "filtered_data.csv"
write.csv(filtered_data, file = args[3], col.names = TRUE)
