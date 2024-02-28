---
title: Discussion
date: today
---



library(xaringanthemer)
# Create a xaringan style in a temporary file
xaringan_themer_css <- tempfile("xaringan-themer-", fileext = ".css")

style_xaringan(
  text_color = "#4a4a4a",
  header_color = "#9f2042",
  background_color = "#fcfcfc",
  inverse_background_color = "#222222",
  link_color = "#9f2042",
  # code_highlight_color = rgba(255,255,0,0.5),
  inverse_text_color= "#4a4a4a",
  inverse_header_color= "#222222",
  inverse_link_color= "#9f2042",
  title_slide_background_color= "#fcfcfc",
  title_slide_text_color= "#9f2042",
  header_background_color= "#222222",
  header_background_text_color= "#222222",
  outfile = "Style/xaringan_themer_css.css" # omit in your slides to write the
  # styles to xaringan-themer.css
)


e2<- readRDS('data/igas_e2_cleanedData-final.rds')%>% mutate(initialVelocityX=X_Velocity,initialVelocityY=Y_Velocity)
solSpace <- e2 %>% filter(trialType==11)
#solSpace %>% ggplot(aes(x=X_Velocity,y=Y_Velocity)) + geom_point(aes(colour=ThrowPosition),alpha=0.58) + ggtitle("") 

solSpace$Result = ifelse(solSpace$ThrowPosition==400,"400",solSpace$ThrowPosition)
solSpace$Result = ifelse(solSpace$ThrowPosition==500,"500",solSpace$Result)
solSpace$Result= ifelse(solSpace$ThrowPosition==625,"625",solSpace$Result)
solSpace$Result = ifelse(solSpace$ThrowPosition==675,"675",solSpace$Result)
solSpace$Result = ifelse(solSpace$ThrowPosition==800,"800",solSpace$Result)
solSpace$Result = ifelse(solSpace$ThrowPosition==900,"900",solSpace$Result)
theme_set(theme_classic())


