setwd("/Users/abbeyyatsko/Desktop/repos/resistograph-cores/data_resi")

# FOR RESISTOGRAPHS
# test ALPH_1.txt as new df "a"

# using residrill import function
a <- residrill_import("ALPH_1.txt")

# plot showing the feed speed 
feedspeed_plot(a)

# plot showing the drilling resistance
drillingresistance_plot(a)

# FOR TREE CORES
df <- read.csv("/Users/abbeyyatsko/Desktop/repos/resistograph-cores/data_core/core_processing.csv")

# take the big data sheet and make unique df for each unique column value in 'Cores' 
library(dplyr)
df_split <- df %>%
  group_split(Core)

# now name and seperate each of these out from the list of 26 that they are stored in 'df_split'
for (i in 1:length(df_split)) {
  assign(paste0("df_split", i), as.data.frame(df_split[[i]]))
}

# essentially there are 26 different tree cores here, now we get to dive into them all