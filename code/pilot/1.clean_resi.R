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
df$Dry_Mass <- as.numeric(df$Dry_Mass)
str(df)

# add column for segment length (need to check on these units - probably mm?)
df$seg_length <- (df$Length_d) - (df$Length_p)

# add column for segment diameter (mm)
df$diameter <- 5

# add column for volume (based on cylindrical shape)
# V = π * r^2 * h
df$volme <- pi * ((df$diameter/2)^2) * df$seg_length

# add column for density estimate (working - need to check on all units)
# d = m / v 
df$density <- df$Dry_Mass / df$volme

# these units are grams / mm^3 (most likely - need to check on this)

# take the big data sheet and make unique df for each unique column value in 'Cores' 
library(dplyr)
df_split <- df %>%
  group_split(Core)

# now name and seperate each of these out from the list of 26 that they are stored in 'df_split'
for (i in 1:length(df_split)) {
  assign(paste0("df_split", i), as.data.frame(df_split[[i]]))
}

# essentially there are 26 different tree cores here, now we get to dive into them all