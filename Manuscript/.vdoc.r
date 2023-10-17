#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
library(here)
here::set_here(path='..')
source(here::here("Functions", "packages.R"))
# test <- readRDS(here("data/e1_08-21-23.rds")) |> filter(expMode2 == "Test") 
# #options(brms.backend="cmdstanr",mc.cores=4)
# e1Sbjs <- test |> group_by(id,condit) |> summarise(n=n())
# testAvg <- test %>% group_by(id, condit, vb, bandInt,bandType,tOrder) %>%
#   summarise(nHits=sum(dist==0),vx=mean(vx),dist=mean(dist),sdist=mean(sdist),n=n(),Percent_Hit=nHits/n)


if (is.null(knitr::pandoc_to())) {
  fmt_out <- "interactive"
} else {
  fmt_out <- knitr::pandoc_to()
}

knitr::opts_chunk$set(fig.align = "center", fig.retina = 3,
                      fig.width = 6, fig.height = (6 * 0.618),
                      out.width = "100%", collapse = TRUE)
# 
options(digits = 3, width = 120,
        dplyr.summarise.inform = FALSE,
        knitr.kable.NA = "")
# 

#
#
#
#

source(here::here('Functions/IGAS_ProcessFunctions.R'))

e1 <- readRDS(here::here("data/igas_e1_cleanedData-final.rds")) %>% mutate(initialVelocityX=X_Velocity,initialVelocityY=Y_Velocity,stageInt=as.numeric(as.character(experimentStage)))

# load the processed data from experiment 1 and 2


e2<- readRDS(here::here('data/igas_e2_cleanedData-final.rds')) %>% mutate(initialVelocityX=X_Velocity,initialVelocityY=Y_Velocity)

# load subject similarity data - computed with the IGAS model in 'IGAS-SimModel.R'
e2_sim <- readRDS(here::here('data/IGAS_Similarity-Performance.rds'))

options(contrasts = c("contr.sum", "contr.poly"))
defaultContrasts = options()$contrasts

dodge <- position_dodge(width = 0.9)
e2GrpPos <- c("400","500","625","675","800","900")
e2Grp <- paste("Constant","Constant", "Constant","Constant","Constant","Constant", "Varied")
e2Labels <- paste(c("400\n Constant","500\n Constant","625\n Constant","675\n Constant",
                   "800\n Constant","900\n Constant","500-800\n Varied"),sep="")

e1Pos <- c("610","760","835","910")
e1Var <- paste("Varied Train Position","Constant Train Position", "Novel Position", "Varied Training Position")
e1Labels<- paste(c("610\n Varied Trained","760\n Constant Trained","835\n Novel Location","910\n Varied Trained"),sep="")
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
