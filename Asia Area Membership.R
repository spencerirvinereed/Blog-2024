library(readxl)
library(tidyverse)
library(gt)

# https://www.lightplanet.com/mormons/history/asia.html
# https://newsroom.churchofjesuschrist.org/article/which-asian-nations-have-more-church-members

df <- read_excel("asia church data.xlsx", sheet = "Sheet2")
df1 <- df[1:16,2:7]

df1 %>% 
  gt()

df <- df[1:3]

df

df %>% 
  ggplot(aes(x = date,
             y = Members,
             group = Area,
             color = factor(Area))) +
  geom_line(size = 2,
            alpha = 0.5) +
  geom_point(size = 3)


df %>% 
  ggplot(aes(x = date,
             y = Members,
             group = Area,
             color = factor(Area))) +
  geom_line(size = 2,
            alpha = 0.5) +
  geom_point(size = 3) +
  facet_wrap(~Area, scales = 'free')

df %>% 
  filter(Area!="Philippines") %>% 
  ggplot(aes(x = date,
           y = Members,
           group = Area,
           color = factor(Area))) +
  geom_line(size = 2,
            alpha = 0.5) +
  geom_point(size = 3)

library(CGPfunctions)

df$time <- as.factor(df$date)

newggslopegraph(dataframe = df,
                Times = time,
                Measurement = Members,
                Grouping = Area,
                Title = "Asia Area Membership",
                SubTitle = "From 1989, 2011 to 2021"
                )

df %>% 
  ggplot(aes(Members, Area, color=time)) +
  geom_point()

df %>% 
  ggplot(aes(Members, reorder(Area, Members), color=time)) +
  geom_point()

df1 <- df %>% 
  filter(Area!="Philippines") 

df1 %>% 
  ggplot(aes(Members, Area, color=time)) +
  geom_point()

df1 %>% 
  ggplot(aes(Members, reorder(Area, Members), color=time)) +
  geom_point() +
  geom_vline(xintercept = 2000)

df1 %>% 
  ggplot(aes(Area, Members, color=time)) +
  geom_point() +
  geom_hline(yintercept = 2000)

library(ggthemes)

newggslopegraph(dataframe = df1,
                Times = time,
                Measurement = Members,
                Grouping = Area,
                Title = "Asia Area Membership",
                SubTitle = "From 1989, 2011 to 2021",
                Caption = "Without Philippines"
)

newggslopegraph(dataframe = df1,
                Times = time,
                Measurement = Members,
                Grouping = Area,
                Title = "Asia Area Membership",
                SubTitle = "From 1989, 2011 to 2021",
                Caption = "Without Philippines",
                ThemeChoice = 'econ'
)
