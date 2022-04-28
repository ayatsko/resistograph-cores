# Functions for reading in residrill output

# @title residrill_import
# @param filename the raw output from the resi-drill
# @export

residrill_import <- function(filename) {
  out<-read.table(file = filename,sep=";",skip = 129) 
  names(out)<-c("drilling.resistance","feed.speed")
  return(out)
}

# @title feedspeed_plot
# @export
# @import ggplot2
# @rdname feedspeed_plot
# @param df data.frame of residrill data

feedspeed_plot<-function(df){
  ggplot(df, aes(y = feed.speed, x = seq(1, length(feed.speed)))) + geom_line()+theme_classic()
}

# @title drillingresistance_plot
# @export
# @import ggplot2
# @rdname drillingresistance_plot
# @param df data.frame of residrill data

drillingresistance_plot<-function(df){
  ggplot(df, aes(y = drilling.resistance, x = seq(1, length(drilling.resistance)))) + geom_line()+theme_classic()
}

#out<-residrill_import("example_data//Residrill001.txt")
#feedspeed_plot(out)