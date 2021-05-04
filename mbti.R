install.packages("tidyverse")
install.packages("ggplot2")
remove.packages("ggplot2") # Unisntall ggplot
install.packages("ggplot2") # Install it again
library(ggplot2)
library(data.table)
final.urm.dt <- final.final.urm[-1]

# Step 0: HODP Theme
if (!require('dplyr')) install.packages('dplyr'); library(dplyr)
if (!require('ggplot2')) install.packages('ggplot2'); library(ggplot2)
if (!require('hrbrthemes')) install.packages('hrbrthemes'); library(hrbrthemes)
if (!require('magick')) install.packages('magick'); library(magick)
if (!require('plotly')) install.packages('plotly'); library(plotly)
logo <- image_read("Desktop/logo.png") 
# Legend: https://stackoverflow.com/questions/14622421/how-to-change-legend-title-in-ggplot

monochrome <- c('#760001', '#BE1E26', '#D84742', '#FF6B61', '#FF9586', '#760000', '#BE1E26', '#D84742', '#FF6B61', '#FF9586', '#760000', '#BE1E26', '#D84742', '#FF6B61', '#FF9586', '#760000')
primary <- c('#EE3838', '#FA9E1C', '#78C4D4', '#4B5973', '#E2DDDB')
sidebysidebarplot <- c("#ef3e3e", "#2c3e50")
theme_hodp <- function () { 
  theme_classic(base_size=12, base_family="Helvetica") %+replace%
    theme(
      panel.background  = element_rect(fill="#F2F2F2", colour=NA),
      plot.background = element_rect(fill="#F2F2F2", colour="#d3d3d3"),
      legend.background = element_rect(fill="transparent", colour=NA),
      legend.key = element_rect(fill="transparent", colour=NA),
      plot.title = element_text(size=24,  family="Helvetica", face = "bold", margin = margin(t = 0, r = 0, b = 10, l = 0)),
      plot.subtitle = element_text(size=18,  family="Helvetica", color="#717171", face = "italic", margin = margin(t = 0, r = 0, b = 10, l = 0)),
      plot.caption = element_text(size=8,  family="Helvetica", hjust = 1),
      axis.text.x =element_text(size=10,  family="Helvetica"),
      axis.title.x =element_text(size=14, family="Helvetica", margin = margin(t = 10, r = 0, b = 0, l = 0), face = "bold"),
      axis.title.y = element_text(margin = margin(t = 0, r = 10, b = 0, l = 0), size=14, family="Helvetica", angle=90, face ='bold'),
      legend.title=element_text(size=10, family="Helvetica"), 
      legend.text=element_text(size=10, family="Helvetica"),
      legend.position = "bottom",
      axis.ticks = element_blank()
    )
}


monochrome <- c("#760000", "#BE1E26", "#D84742", "#FF6B61", "#FF9586", "#760000", "#BE1E26", "#D84742", "#FF6B61", "#FF9586", "#760000", "#BE1E26", "#D84742", "#FF6B61", "#FF9586", "#760000")


df <- data.frame(mbti=c("ISTP", "ISTJ", "ISFP", "ISFJ", "INTP","INTJ", "INFP", "INFJ", "ESTP", "ESTJ", "ESFP", "ESFJ", "ENTP","ENTJ", "ENFP", "ENFJ"), freq=c(0.49, 5.85, 1.46, 6.83, 4.88, 10.73, 7.80, 17.07, 0.49, 2.44, 1.95,3.90, 5.85, 11.22, 10.24, 8.78))
ggplot(data=df, aes(x=mbti, y=freq)) +
  geom_bar(stat="identity", fill = monochrome) +
  theme_hodp() +
  labs(title="Percentage of Each MBTI Personality Type") +
  xlab("Personality Type") +
  ylab("Percentage") 
grid::grid.raster(logo, x = 0.01, y = 0.01, just = c('left', 'bottom'), width = unit(1.5, 'cm'))


install.packages("reshape2")
library("reshape2")
# Init dataframe
df1 <- data.frame(freq=c(44.4, 55.5, 23.23, 76.76, 42.92, 57.07, 66.66, 33.33, 49.3, 50.7, 73.3, 26.7, 40.2, 59.8, 54.1, 45.9))
# Letters column
df1$letter = rep(c("E", "I", "S", "N", "T", "F", "J", "P"), 2)
# Convert data Wide to long
df2 <- reshape2::melt(df1, id.vars='letter')
df2
# Drop variable
df3 <- subset(df2, select=-c(variable))
# Add type variable
df3$type = c(rep("Harvard", 8), rep("World", 8))
df3
df3 <- within(df3, 
              letter <- factor(letter, 
                               levels=c("E", "I", "S", "N", "T", "F", "J", "P")))
df3
ggplot(data=df3, aes(x=letter, y=value, fill=type)) +
  geom_bar(stat="identity", position='dodge') +
  theme_hodp() +
  labs(title="MBTI Personality Letter: Harvard vs. the World") +
  xlab("Personality Letter") +
  ylab("Percentage")+
  scale_fill_manual(values=c("#760000", "#D84742"))
