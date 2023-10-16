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
knitr::opts_chunk$set(echo=FALSE)
# source('build_toc.R')
# files <- list.files(pattern = '*.Rmd', recursive = F) 
# files = files[!grepl('^_', basename(files)) | grepl('^_index[.]', basename(files))]
# t1 <- render_toc("htw_n.Rmd")
# #cat(t1)
# 
# 
# render_toc("igas_n.Rmd")

library(thematic)
thematic_on(bg="#fcfcfc")
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
source('Functions/IGAS_ProcessFunctions.R')
library(webexercises)
library(kableExtra)
library(knitr)
knitr::opts_chunk$set(echo = FALSE)

#rm(list=ls())
###### data loading and organization #######

# load the processed data from experiment 1 and 2
e1 <- readRDS("data/igas_e1_cleanedData-final.rds")%>% mutate(initialVelocityX=X_Velocity,initialVelocityY=Y_Velocity,stageInt=as.numeric(as.character(experimentStage)))
e2<- readRDS('data/igas_e2_cleanedData-final.rds')%>% mutate(initialVelocityX=X_Velocity,initialVelocityY=Y_Velocity)
# load subject similarity data - computed with the IGAS model in 'IGAS-SimModel.R'
e2_sim <- readRDS('data/IGAS_Similarity-Performance.rds')

options(contrasts = c("contr.sum", "contr.poly"))
defaultContrasts = options()$contrasts
theme_set(theme_classic())

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
theme_set(theme_classic())
p=2
c<- .0002
simdat <- data.frame(x=rep(seq(200,1000),3),condit=c(rep("varied",1602),rep("constant",801)),
                     train.position=c(rep(400,801),rep(800,801),rep(600,801)),c=.0002,p=2) %>%
                     mutate(plotjitter=ifelse(condit=="varied",0,7),
                            linScale=ifelse(condit=="varied",980,1000),
                            genGauss=exp(-c*(abs((x-train.position)^p))),
                            genLinear=1000-abs(x-train.position)+plotjitter) %>% 
  #group_by(condit) %>% mutate(scaleLinear=(genLinear-min(genLinear))/(max(genLinear)-min(genLinear))) %>%
  group_by(x,condit) %>%
  summarise(genGauss=mean(genGauss),genLinear=mean(genLinear)/linScale,.groups = 'keep')
colorVec=c("darkblue","darkred")
plotSpecs <- list(geom_line(alpha=.7,size=.4),scale_color_manual(values=colorVec),
                  geom_vline(alpha=.55,xintercept = c(400,800),color=colorVec[2]),
                  geom_vline(alpha=.55,xintercept = c(600),color=colorVec[1]),
                  ylim(c(0,1.05)),
                  #xlim(c(250,950)),
                  scale_x_continuous(breaks=seq(200,1000,by=200)),
                  xlab("Test Stimulus"),
                  annotate(geom="text",x=447,y=1.05,label="Varied",size=3.1,fontface="plain"),
                  annotate(geom="text",x=450,y=1.02,label="Training",size=3.1,fontface="plain"),
                  annotate(geom="text",x=659,y=1.05,label="Constant",size=3.1,fontface="plain"),
                  annotate(geom="text",x=657,y=1.02,label="Training",size=3.1,fontface="plain"),
                  annotate(geom="text",x=847,y=1.05,label="Varied",size=3.1,fontface="plain"),
                  annotate(geom="text",x=850,y=1.02,label="Training",size=3.1,fontface="plain"),
                  theme(panel.border = element_rect(colour = "black", fill=NA, size=1),
                        legend.position="none"))

ip1 <- simdat  %>% ggplot(aes(x,y=genGauss,group=condit,col=condit))+plotSpecs+ylab("")
ip2 <- simdat %>%  ggplot(aes(x,y=genLinear,group=condit,col=condit))+plotSpecs+ylab("Amount of Generalization")

#gridExtra::grid.arrange(ip2,ip1,ncol=2)

gtitle="Figure 1"
title = ggdraw()+draw_label(gtitle,fontface = 'bold',x=0,hjust=0,size=11)+theme(plot.margin = margin(0, 0, 0, 1))
captionText=str_wrap("Figure 1. Left panel: Generalization predicted from a simple model that assumes a linear generalization function. A varied group (red vertical lines indicate the 2 training locations) trained from positions 400 and 800, and a constant group (blue vertical line), trained from position 600. Right panel: if a Gaussian generalization function is assumed, then varied training (400, 800) is predicted to result in better generalization to positions close to 400 and 800 than does constant training at 600. ",200)
capt=ggdraw()+draw_label(captionText,fontface = 'italic',x=0,hjust=0,size=11)+theme(plot.margin = margin(0, 0, 0, 1))

plot_grid(title,NULL,ip1,ip2,capt,NULL,ncol=2,rel_heights=c(.1,1,.15))

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

#mf <- png::readPNG("Assets/methodsFig1.png")
#ggplot()+annotation_raster(mf,xmin = 0, xmax = 486, ymin = 0, ymax = 196)

gtitle="Figure 2"

title = ggdraw()+draw_label(gtitle,fontface = 'bold',y=Inf, x=0,hjust=0,vjust=5.5,size=11)+theme(plot.margin = margin(0, 0, 0, 0))

captionText=str_wrap("Figure 2: The stimuli of the task consisted of a blue ball, which the participants would launch at the green target, while avoiding the red barrier. On each trial, the ball would appear in the center of the orange square, with the position of the orange square varying between experimental conditions. Participants were constrained to release the ball within the square. ",150)

capt<-ggdraw()+draw_label(captionText,fontface = 'italic',x=0,hjust=0,size=11)+ 
  theme(plot.margin = margin(0, 0, 0, 1))
  #theme(plot.margin = unit(c(0, 0, 0, 1), "cm"))
mf <- cowplot::ggdraw()+cowplot::draw_image("Assets/methodsFig1.png",hjust=0)+theme(plot.margin = margin(0, 0, 0, 0))

plot_grid(title,mf,capt,ncol=1,rel_heights = c(.1,1,.1))
#plot_grid(mf,capt,ncol=1,rel_widths=c(1,.01))
# plot_grid(capt,capt,ncol=1)

# capt
# # c2 = ggdraw()+draw_label("testing_text out",x=0,hjust=0,vjust=0,size=11)+ theme(plot.margin = unit(c(0, 0, 0, 0), "pt"))
# # c2
# plot_grid(capt,capt,ncol=1,rel_heights =c(1,.2))

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

exp1TrainPosition <- e1 %>% filter(stage!="Transfer",mode==1) %>%ungroup() %>% 
  group_by(sbjCode,Group,conditType,trainHalf,positionX) %>% 
  summarise(MeanTargetDistance=mean(AbsDistFromCenter),.groups = 'keep')

exp1TrainPosition3 <- e1 %>% filter(stage!="Transfer",mode==1) %>%ungroup() %>% 
  group_by(sbjCode,Group,conditType,stage,positionX) %>% 
  summarise(MeanTargetDistance=mean(AbsDistFromCenter),.groups = 'keep')

exp1Train <- e1 %>% filter(stage!="Transfer",mode==1)  %>%
  group_by(sbjCode,Group,conditType,trainHalf) %>% 
  summarise(MeanTargetDistance=mean(AbsDistFromCenter),.groups = 'keep')

exp1Train3 <- e1 %>% filter(stage!="Transfer",mode==1)  %>%
  group_by(sbjCode,Group,conditType,stage) %>% 
  summarise(MeanTargetDistance=mean(AbsDistFromCenter),.groups = 'keep')


e1train2 <- exp1TrainPosition3 %>% ggplot(aes(x=positionX,y=MeanTargetDistance))+
  geom_bar(aes(group=stage,fill=stage),stat="summary",fun=mean,position=dodge)+
  facet_wrap(~conditType,ncol=2)+
  stat_summary(aes(x=positionX,group=stage),fun.data=mean_se,geom="errorbar",position=dodge,width=.8)+
  ylab("Mean Distance From Center Of Target")+
  xlab("Training Location(s)")+theme(plot.title = element_text(hjust = 0.5))+
  guides(fill=guide_legend(title="Training Stage"))+theme(legend.title.align=.25)


gtitle="Figure 3"

title = ggdraw()+draw_label(gtitle,fontface = 'bold',y=Inf, x=0,hjust=0,vjust=5.5,size=11)+theme(plot.margin = margin(0, 0, 0, 0))

captionText=str_wrap("Training performance for varied and constant participants binned into three stages. Shorter bars indicate better performance (ball landing closer to the center of the target). Error bars indicate standard error of the mean. ",145)


capt<-ggdraw()+draw_label(captionText,fontface = 'italic',x=0,hjust=0,size=11)+ 
  theme(plot.margin = margin(0, 0, 0, 1))
  #theme(plot.margin = unit(c(0, 0, 0, 1), "cm"))
plot_grid(title,e1train2,capt,ncol=1,rel_heights=c(.18,1,.15))


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


exp1.Test <- e1 %>% filter(stage=="Transfer") %>% select(-trainHalf)%>% group_by(positionX) %>% 
  mutate(globalAvg=mean(AbsDistFromCenter),globalSd=sd(AbsDistFromCenter)) %>% 
  group_by(sbjCode,positionX) %>% 
  mutate(scaledDev = scaleVar(globalAvg,globalSd,AbsDistFromCenter)) %>%
  ungroup() %>% group_by(sbjCode,conditType,positionX,ThrowPosition) %>%
summarise(MeanTargetDeviance = mean(AbsDistFromCenter),MeanScaleDev = mean(scaledDev),.groups="keep")%>% as.data.frame()

#manuscript plot
e1test1=exp1.Test %>% ggplot(aes(x=positionX,y=MeanTargetDeviance,group=conditType,fill=conditType))+
  geom_bar(stat="summary",fun=mean,position=dodge)+ stat_summary(fun.data=mean_se,geom="errorbar",position=dodge,width=.5)+ylab("Mean Distance From Center Of Target") +xlab("Testing Location")+theme(plot.title = element_text(hjust = 0.5))+guides(fill=guide_legend(title="Training Condition"))+theme(legend.title.align=.25)+scale_x_discrete(name="Testing Location",labels=e1Labels)


gtitle="Figure 4"

title = ggdraw()+draw_label(gtitle,fontface = 'bold',y=Inf, x=0,hjust=0,vjust=5.5,size=11)+theme(plot.margin = margin(0, 0, 0, 0))

captionText=str_wrap("Testing performance for each of the 4 testing positions, compared between training conditions. Positions 610 and 910 were trained on by the varied group, and novel for the constant group. Position 760 was trained on by the constant group, and novel for the varied group. Position 835 was novel for both groups. Shorter bars are indicative of better performance (the ball landing closer to the center of the target). Error bars indicate standard error of the mean. ",130)


capt<-ggdraw()+draw_label(captionText,fontface = 'italic',x=0,hjust=0,size=11)+ 
  theme(plot.margin = margin(0, 0, 0, 1))
  #theme(plot.margin = unit(c(0, 0, 0, 1), "cm"))
plot_grid(title,e1test1,capt,ncol=1,rel_heights=c(.18,1,.15))

#
#
#
#
#
#






exp1.Test <- e1 %>% filter(stage=="Transfer") %>% select(-trainHalf)%>% group_by(positionX) %>% 
  mutate(globalAvg=mean(AbsDistFromCenter),globalSd=sd(AbsDistFromCenter)) %>% 
  group_by(sbjCode,positionX) %>% 
  mutate(scaledDev = scaleVar(globalAvg,globalSd,AbsDistFromCenter)) %>%
  ungroup() %>% group_by(sbjCode,conditType,positionX,ThrowPosition) %>%
summarise(MeanTargetDeviance = mean(AbsDistFromCenter),MeanScaleDev = mean(scaledDev),.groups="keep")%>% as.data.frame()


test= exp1.Test %>% dplyr::rename(Condition="conditType") %>% group_by(Condition,positionX) %>%
   summarise(Mean=round(mean(MeanTargetDeviance),2),sd=round(sd(MeanTargetDeviance),2),.groups="keep")
 test=test %>% group_by(Condition) %>% mutate(GroupAvg=round(mean(Mean),2),groupSd=round(sd(Mean),2))
 test = test %>% mutate(msd=paste(Mean,"(",sd,")",sep=""),gsd=paste(GroupAvg,"(",groupSd,")",sep="")) %>% select(positionX,Condition,msd,gsd)%>%pivot_wider(names_from = Condition,values_from=c(msd,gsd))
 test=test[,1:3]

captionText="Table 1. Testing performance for varied and constant groups in experiment 1. Mean absolute deviation from the center of the target, with standard deviations in parenthesis." 
 
kable(test,escape=FALSE,booktabs=TRUE,col.names=c("Position","Constant","Varied"),align=c("l"))  %>% kableExtra::kable_styling(position="left") %>%   kable_classic() %>% kableExtra::footnote(general=captionText,general_title = "")

# 
# colnames(test) <- c("Position","Constant","Varied")
# ft1=flextable(test,col_keys = c("Position","Constant","Varied"))
# ft1 <- flextable::set_caption(ft1,captionText)
# ft1

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


e2$stage <- factor(e2$stage, levels = c("Beginning", "Middle", "End","Transfer"),ordered = TRUE)

exp2TrainPosition <- e2  %>% filter(stage!="Transfer") %>%ungroup() %>% 
  group_by(sbjCode,Group2,conditType,trainHalf,positionX) %>% 
  summarise(MeanTargetDistance=mean(AbsDistFromCenter))%>% as.data.frame()

exp2TrainPosition3 <- e2  %>% filter(stage!="Transfer") %>%ungroup() %>% 
  mutate(globalAvg=mean(AbsDistFromCenter),globalSd=sd(AbsDistFromCenter)) %>% 
  group_by(sbjCode,positionX) %>% mutate(scaledDev = scaleVar(globalAvg,globalSd,AbsDistFromCenter)) %>%ungroup() %>%
  group_by(sbjCode,Group2,conditType,stage,positionX) %>% 
  summarise(MeanTargetDistance=mean(AbsDistFromCenter),MeanScaledDev=mean(scaledDev,trim=.05))%>% as.data.frame()

exp2Train <- e2  %>% filter(stage!="Transfer")  %>% 
  group_by(sbjCode,Group2,conditType,trainHalf) %>% 
  summarise(MeanTargetDistance=mean(AbsDistFromCenter)) %>% as.data.frame()

exp2Train3 <- e2  %>% filter(stage!="Transfer")  %>% ungroup() %>% 
  mutate(globalAvg=mean(AbsDistFromCenter),globalSd=sd(AbsDistFromCenter)) %>% 
  group_by(sbjCode,positionX) %>% mutate(scaledDev = scaleVar(globalAvg,globalSd,AbsDistFromCenter)) %>%ungroup() %>%
  group_by(sbjCode,Group2,conditType,stage) %>% 
  summarise(MeanTargetDistance=mean(AbsDistFromCenter),MeanScaledDev=mean(scaledDev,trim=.05)) %>% as.data.frame()

transfer <- filter(e2, stage=="Transfer") %>% droplevels() %>% select(-trainHalf,-initialVelocityY,ThrowPosition2)%>% ungroup()
transfer <- transfer %>% group_by(positionX) %>% mutate(globalAvg=mean(AbsDistFromCenter),globalSd=sd(AbsDistFromCenter)) %>% 
  group_by(sbjCode,positionX) %>% mutate(scaledDev = scaleVar(globalAvg,globalSd,AbsDistFromCenter)) %>%ungroup()

transfer <- transfer %>% group_by(sbjCode,positionX) %>% mutate(ind=1,testPosIndex=cumsum(ind),posN=max(testPosIndex)) %>%
  select(-ind) %>% mutate(testHalf = case_when(testPosIndex<15 ~"1st Half",testPosIndex>=15 ~"2nd Half")) %>% convert_as_factor(testHalf)

variedTest <- transfer %>% filter(condit==7) %>% mutate(extrapolate=ifelse(positionX=="900" | positionX=="400","extrapolation","interpolation")) 
constantTest <- transfer %>% filter(condit!=7) %>% mutate(extrapolate=ifelse(distFromTrain==0,"interpolation","extrapolation"))

transfer <- rbind(variedTest,constantTest)
transfer<- transfer %>% mutate(novel=ifelse(distFromTrain3==0,"trainedLocation","novelLocation"))%>% convert_as_factor(novel,extrapolate)

transfer <- transfer %>% relocate(sbjCode,condit2,Group,conditType2,stage,trial,novel,extrapolate,positionX,AbsDistFromCenter,globalAvg,globalSd,scaledDev,distFromTrain3) %>% ungroup()


# novelAll <- transfer %>% filter(distFromTrain!=0, distFromTrain3!=0) %>% select(-globalAvg,-globalSd,-scaledDev)%>% droplevels() %>% ungroup()
# novelAll <- novelAll %>% group_by(positionX) %>%
#  mutate(globalAvg=mean(AbsDistFromCenter),globalSd=sd(AbsDistFromCenter)) %>% 
#   group_by(sbjCode,positionX) %>% mutate(scaledDev = scaleVar(globalAvg,globalSd,AbsDistFromCenter)) %>%ungroup()

novelAll <- transfer %>% filter(distFromTrain!=0, distFromTrain3!=0)
novelAllMatched <- novelAll %>% filter(condit!=5,condit!=2)


constantIden <- transfer %>% filter(condit !=7,distFromTrain==0) # only constant groups from their training position
variedTest <- transfer %>% filter(condit==7) # only varied testing
variedVsIden <- rbind(constantIden,variedTest) # all varied combined with constant identity


variedNovel <- variedTest %>% filter(distFromTrain3 !=0) # removes 500 and 800 from varied
constantIden2 <- transfer %>% filter(condit !=7,condit!=5,condit!=2,distFromTrain==0) # only constant groups from training position 400,625,675,900
variedVsNovelIden <- rbind(constantIden2,variedNovel) # novel positions for varied, trained for constant

exp2.Test <- transfer %>%group_by(sbjCode,conditType,positionX,ThrowPosition)%>%
  summarise(MeanTargetDeviance = mean(AbsDistFromCenter,trim=.05),MeanScaledDev=mean(scaledDev,trim=.05)) %>%ungroup() %>% as.data.frame()

exp2.Test2 <- exp2.Test %>% group_by(sbjCode,conditType)%>%
  summarise(MeanTargetDeviance = mean(MeanTargetDeviance),MeanScaledDev=mean(MeanScaledDev)) %>%ungroup() %>% as.data.frame()

exp2.Test7 <- transfer %>%group_by(Group2,sbjCode,positionX,Group,conditType,ThrowPosition4) %>% 
  summarise(MeanTargetDeviance = mean(AbsDistFromCenter,trim=.05),MeanScaledDev=mean(scaledDev,trim=.05)) %>% as.data.frame()

exp2.Test7.agg <- exp2.Test7  %>%group_by(Group2,sbjCode,Group,conditType) %>% 
  summarise(MeanTargetDeviance = mean(MeanTargetDeviance),MeanScaledDev=mean(MeanScaledDev)) %>% as.data.frame()

exp2.Test7.agg2 <- exp2.Test7  %>%group_by(sbjCode,conditType) %>% 
  summarise(MeanTargetDeviance = mean(MeanTargetDeviance),MeanScaledDev=mean(MeanScaledDev)) %>% as.data.frame()

#
#
#


### New - 3 stage
e2train1<-exp2TrainPosition3 %>% ggplot(aes(x=stage,y=MeanTargetDistance))+
  geom_bar(aes(group=stage,fill=stage),stat="summary",position=dodge,fun="mean")+
  stat_summary(aes(x=stage,group=stage),fun.data=mean_se,geom="errorbar",position=dodge,width=.8)+facet_wrap(~conditType,ncol=2)+
  ylab("Mean Distance From Center Of Target") +xlab("Training Stage")+
  theme(plot.title = element_text(face="bold",hjust = 0.0,size=9),
        plot.title.position = "plot")+
  guides(fill=guide_legend(title="Training Stage"))+theme(legend.title.align=.25)+ggtitle("A")

e2train2<-exp2TrainPosition3 %>% ggplot(aes(x=positionX,y=MeanTargetDistance))+
  geom_bar(aes(group=stage,fill=stage),stat="summary",position=dodge,fun="mean")+
  facet_wrap(~conditType,ncol=2)+stat_summary(aes(x=positionX,group=stage),fun.data=mean_se,geom="errorbar",position=dodge,width=.8)+ylab("Mean Distance From Center Of Target") +xlab("Training Location(s)")+
  theme(plot.title = element_text(face="bold",hjust = 0,size=9),
        plot.title.position = "plot")+
  guides(fill=guide_legend(title="Training Stage"))+theme(legend.title.align=.25)+ggtitle("B")

#plot_grid(e2train1,e2train2,ncol=1)



gtitle="Figure 5"

title = ggdraw()+draw_label(gtitle,fontface = 'bold',y=Inf, x=0,hjust=0,vjust=5.5,size=11)+theme(plot.margin = margin(0, 0, 0, 0))

captionText=str_wrap("Training performance for the six constant conditions, and the varied condition, binned into three stages. In Figure 5a, the six constant groups are averaged together, as are the two training positions for the varied group. In Figure 5b the six constant groups are shown separately, with each set of bars representing the beginning, middle, and end of training for a single constant group that trained from the position indicated on the x-axis. Figure 5b also shows training performance separately for both of the throwing locations trained by the varied group. Error bars indicate standard error of the mean. ",130)


capt<-ggdraw()+draw_label(captionText,fontface = 'italic',x=0,hjust=0,size=11)+ 
  theme(plot.margin = margin(0, 0, 0, 1))
  #theme(plot.margin = unit(c(0, 0, 0, 1), "cm"))
plot_grid(title,e2train1,e2train2,capt,ncol=1,rel_heights=c(.18,1,1,.15))

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


# manuscript plot
e2test1<-exp2.Test %>% ggplot(aes(x=ThrowPosition,y=MeanTargetDeviance,group=conditType,fill=conditType))+geom_bar(stat="summary",position=dodge,fun="mean")+ stat_summary(fun.data=mean_se,geom="errorbar",position=dodge,width=.5)+ylab("Mean Distance From Center Of Target") +xlab("Testing Location")+guides(fill=guide_legend(title="Training Condition"))+
  theme(plot.title=element_text(face="bold",size=9),
        plot.title.position = "plot",
        legend.title.align=.25)+
  ggtitle("A")


e2test2<-exp2.Test7 %>% 
  ggplot(aes(x=Group,y=MeanTargetDeviance,group=conditType,fill=conditType))+
  geom_bar(stat="summary",position=position_dodge(),fun="mean")+ 
  stat_summary(fun.data=mean_se,geom="errorbar",position=position_dodge())+
  facet_wrap(~ThrowPosition4)+
  ylab("Mean Distance From Center Of Target")+
  guides(fill=guide_legend(title="Training Condition"))+
  theme(plot.title=element_text(face="bold",size=9),
        plot.title.position = "plot",
        legend.title.align=.25,
        axis.text.x = element_text(size = 7,angle=45,hjust=1))+
  scale_x_discrete(name=" Training Group",labels=e2Labels)+ggtitle("B")


gtitle="Figure 6"

title = ggdraw()+draw_label(gtitle,fontface = 'bold',y=Inf, x=0,hjust=0,vjust=5.5,size=11)+theme(plot.margin = margin(0, 0, 0, 0))

captionText=str_wrap("Testing phase performance from each of the six testing positions. The six constant conditions are averaged together into a single constant group, compared against the single varied-trained group.B) Transfer performance from each of the 6 throwing locations from which all participants were tested. Each bar represents performance from one of seven distinct training groups (six constant groups in red, one varied group in blue). The x axis labels indicate the location(s) from which each group trained. Lower values along the y axis reflect better performance at the task (closer distance to target center). Error bars indicate standard error of the mean. ",140)


capt<-ggdraw()+draw_label(captionText,fontface = 'italic',x=0,hjust=0,size=11)+ 
  theme(plot.margin = margin(0, 0, 0, 1))
  #theme(plot.margin = unit(c(0, 0, 0, 1), "cm"))
plot_grid(title,e2test1,e2test2,capt,ncol=1,rel_heights=c(.18,1,1,.15))

#
#
#
#
#
#
#

tab2= exp2.Test %>% rename(Condition="conditType") %>% group_by(Condition,positionX) %>%
   summarise(Mean=round(mean(MeanTargetDeviance),2),sd=round(sd(MeanTargetDeviance),2),.groups="keep")
 tab2=tab2 %>% group_by(Condition) %>% mutate(GroupAvg=round(mean(Mean),2),groupSd=round(sd(Mean),2))
 tab2 = tab2 %>% mutate(msd=paste(Mean,"(",sd,")",sep=""),gsd=paste(GroupAvg,"(",groupSd,")",sep="")) %>% 
   select(positionX,Condition,msd,gsd)%>%pivot_wider(names_from = Condition,values_from=c(msd,gsd))
 tab2=tab2[,1:3]

 captionText="Table 2. Transfer performance from each of the 6 throwing locations from which all participants were tested. Each bar represents performance from one of seven distinct training groups (six constant groups in red, one varied group in blue). The x axis labels indicate the location(s) from which each group trained. Lower values along the y axis reflect better performance at the task (closer distance to target center). Error bars indicate standard error of the mean. "


kable(tab2,escape=FALSE,booktabs=TRUE,col.names=c("Position","Constant","Varied"),align=c("l"))  %>% kableExtra::kable_styling(position="left") %>% kable_classic() %>% footnote(general=captionText,general_title = "")

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

sum.novelAll <- novelAll %>% group_by(sbjCode,conditType,positionX) %>% 
  summarise(MeanTargetDev=mean(AbsDistFromCenter,trim=.05),MeanScaledDev=mean(scaledDev,trim=.05),.groups="keep") %>% as.data.frame()

tab3=sum.novelAll %>% rename(Condition="conditType") %>% group_by(Condition,positionX) %>%
  summarise(Mean=round(mean(MeanTargetDev),2),sd=round(sd(MeanTargetDev),2),.groups="keep")

 tab3=tab3 %>% group_by(Condition) %>% mutate(GroupAvg=round(mean(Mean),2),groupSd=round(sd(Mean),2))
 
 tab3 = tab3 %>% 
   mutate(msd=paste(Mean,"(",sd,")",sep=""),gsd=paste(GroupAvg,"(",groupSd,")",sep="")) %>% select(positionX,Condition,msd,gsd)%>%pivot_wider(names_from = Condition,values_from=c(msd,gsd))
 tab3=tab3[,1:3]




 captionText="Table 3. Testing performance from novel positions. Includes data only from positions that were not encountered during the training stage (e.g. excludes positions 500 and 800 for the varied group, and one of the six locations for each of the constant groups). Table presents Mean absolute deviations from the center of the target, and standard deviations in parenthesis. "


kable(tab3,escape=FALSE,booktabs=TRUE,col.names=c("Position","Constant","Varied"),align=c("l"))  %>% kableExtra::kable_styling(position="left") %>% kable_classic() %>% footnote(general=captionText,general_title = "")
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


sum.variedVsNovelIden <- variedVsNovelIden  %>%
  group_by(sbjCode,conditType,positionX) %>% 
  summarise(MeanTargetDev=mean(AbsDistFromCenter,trim=.05),MeanScaledDev=mean(scaledDev,trim=.05),.groups="keep") %>% as.data.frame()

e2Test2 <- sum.variedVsNovelIden %>% ggplot(aes(x=positionX,y=MeanTargetDev,group=conditType,fill=conditType))+geom_bar(stat="summary",position=dodge,fun="mean")+ stat_summary(fun.data=mean_se,geom="errorbar",position=dodge,width=.5)+ylab("Mean Distance From Center Of Target") +xlab("Testing Location")+theme(plot.title = element_text(hjust = 0.5))+guides(fill=guide_legend(title="Training Condition"))+theme(legend.title.align=.25)


gtitle="Figure 7"

title = ggdraw()+draw_label(gtitle,fontface = 'bold',y=Inf, x=0,hjust=0,vjust=5.5,size=11)+theme(plot.margin = margin(0, 0, 0, 0))

captionText=str_wrap("A comparison of throwing location that are identical to those trained by the constant participants (e.g. constant participants trained at position 900, tested from position 900), which are also novel to the varied-trained participants (thus excluding positions 500 and 800). Error bars indicate standard error of the mean. ",145)


capt<-ggdraw()+draw_label(captionText,fontface = 'italic',x=0,hjust=0,size=11)+ 
  theme(plot.margin = margin(0, 0, 0, 1))
  #theme(plot.margin = unit(c(0, 0, 0, 1), "cm"))
plot_grid(title,e2Test2,capt,ncol=1,rel_heights=c(.18,1,.15))


#
#
#
#
#
#

tab4=sum.variedVsNovelIden %>% rename(Condition="conditType") %>% group_by(Condition,positionX) %>%
  summarise(Mean=round(mean(MeanTargetDev),2),sd=round(sd(MeanTargetDev),2),.groups="keep")

 tab4=tab4 %>% group_by(Condition) %>% 
   mutate(GroupAvg=round(mean(Mean),2),groupSd=round(sd(Mean),2))
tab4 = tab4 %>% mutate(msd=paste(Mean,"(",sd,")",sep=""),gsd=paste(GroupAvg,"(",groupSd,")",sep="")) %>% 
   select(positionX,Condition,msd,gsd)%>%pivot_wider(names_from = Condition,values_from=c(msd,gsd))
 tab4=tab4[,1:3]


 captionText="Table 5. Testing performance from the locations trained by constant participants and novel to varied participants. Locations 500 and 800 are not included as these were trained by the varied participants. Table presents Mean absolute deviation from the center of the target, and standard deviations in parenthesis. "
 

kable(tab4,escape=FALSE,booktabs=TRUE,col.names=c("Position","Constant","Varied"),align=c("l"))  %>% kableExtra::kable_styling(position="left") %>% kable_classic() %>% footnote(general=captionText,general_title = "")


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

library("RColorBrewer")
taskspace <- e2 %>% filter(AbsDistFromCenter<900)
taskspace$hitOrMiss <- ifelse(taskspace$trialType==11,"Hit Target","Missed Target")

solSpace <- e2 %>% filter(trialType==11)
#solSpace %>% ggplot(aes(x=X_Velocity,y=Y_Velocity)) + geom_point(aes(colour=ThrowPosition),alpha=0.58) + ggtitle("") 

solSpace$Result = ifelse(solSpace$ThrowPosition==400,"400",solSpace$ThrowPosition)
solSpace$Result = ifelse(solSpace$ThrowPosition==500,"500",solSpace$Result)
solSpace$Result= ifelse(solSpace$ThrowPosition==625,"625",solSpace$Result)
solSpace$Result = ifelse(solSpace$ThrowPosition==675,"675",solSpace$Result)
solSpace$Result = ifelse(solSpace$ThrowPosition==800,"800",solSpace$Result)
solSpace$Result = ifelse(solSpace$ThrowPosition==900,"900",solSpace$Result)


missSpace <- e2 %>% filter(trialType !=11)
missSpace$Result = "Missed Target"
solSpace$Result <- solSpace$Result

# the usual method of changing the legend title does not seem to work after the colours are manually scaled. 
# multiplied velocoties by -1 to make the axes less confusing
ss=solSpace %>% ggplot(aes(x=X_Velocity*-1,y=Y_Velocity*-1)) + 
  geom_point(aes(colour=Result),alpha=0.6) + 
  scale_color_manual(values =brewer.pal(n=6,name="Set1"))+
  labs(colour="Target Hit Thrown from Position:") + xlab("X Release Velocity") + ylab("Y Release Velocity")+ggtitle("A")

fullSpace <- rbind(missSpace,solSpace)

fs<- fullSpace %>% ggplot(aes(x=X_Velocity*-1,y=Y_Velocity*-1,colour=Result)) + 
  geom_point(aes(),alpha=0.6) + scale_color_manual(values =brewer.pal(n=7,name="Set1"))+
  labs(colour="Target Hit or Miss From Position:") + xlab("X Release Velocity") + ylab("Y Release Velocity") +ggtitle("B")


gtitle="Figure 8"
title = ggdraw()+draw_label(gtitle,fontface = 'bold',y=Inf, x=0,hjust=0,vjust=5.5,size=11)+theme(plot.margin = margin(0, 0, 0, 0))

captionText=str_wrap("Figure 8A is a visual representation of the combinations of throw parameters (x and y velocities applied to the ball at launch), which resulted in target hits during the testing phase. This empirical solution space was compiled from all of the participants in experiment 2. Figure 8B shows the solution space within the context of all of the throws made throughout the testing phase of the experiment.",145)


capt<-ggdraw()+draw_label(captionText,fontface = 'italic',x=0,hjust=0,size=11)+ 
  theme(plot.margin = margin(0, 0, 0, 1))
  #theme(plot.margin = unit(c(0, 0, 0, 1), "cm"))
plot_grid(title,ss,fs,capt,ncol=1,rel_heights=c(.18,1,1,.15))
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
#| Toy Model 2, fig.width=10,fig.height=10.0,
#| fig.cap="Figure 9. A simple model depicting the necessity of both of two separately fit generalization parameters, c, and a positive distance between training and testing contexts, in order for an instance model to predict a pattern of varied training from stimuli 400 and 800 outperforming constant training from position 600 at a test position of 600. For the top left panel, in which the generalization model assumes a single c value (-.008) for  both varied and constant conditions, and identical contexts across training and testing, the equation which generates the varied condition is: Amount of Generalization =  $e^{(c\\cdot|x-800|)}  +e^{(c\\cdot|x-400|)}$, whereas the constant group generalization is generated from $2\\cdot e^{(c\\cdot|x-600|)}$. For the top right panel, the c constants in the original equations are different for the 2 conditions, with $c=-.002$ for the varied condition, and $c=-.008$ for the constant condition. The bottom two panels are generated from identical equations to those immediately above, except for the addition of extra distance (100 units) to reflect the assumption of some change in context between training and testing conditions. Thus, the generalization model for the varied condition in the bottom-right panel is of the form: Amount of Generalization = $e^{(cvaried\\cdot|x-800|)}  +e^{(cvaried\\cdot|x-400|)}$."


# 

p=2
c<- .000002

trainingTestingDifference=2000;
cvaried=.00002
cconstant=.0005
simdat <- data.frame(x=rep(seq(200,1000),3),condit=c(rep("varied",1602),rep("constant",801)),
                     train.position=c(rep(400,801),rep(800,801),rep(600,801)),c=.0002,p=2) %>%
                     mutate(c2=ifelse(condit=="varied",cvaried,cconstant),
                            genGauss=exp(-c*(abs((x-train.position)^p))),
                            genGaussDist=exp(-c*(trainingTestingDifference+abs((x-train.position)^p))),
                            genGauss2=exp(-c2*(abs((x-train.position)^p))),
                            genGaussDist2=exp(-c2*(trainingTestingDifference+abs((x-train.position)^p))),
                            ) %>% 
  group_by(x,condit) %>%
  summarise(genGauss=mean(genGauss),genGauss2=mean(genGauss2),genGaussDist=mean(genGaussDist),genGaussDist2=mean(genGaussDist2),.groups='keep')


#plot(x,exp(c*(trainingTestingDifference+abs(x-800)))+exp(c*(trainingTestingDifference+abs(x-400)))

colorVec=c("darkblue","darkred")
plotSpecs <- list(geom_line(alpha=.7),scale_color_manual(values=colorVec),
                  geom_vline(alpha=.55,xintercept = c(400,800),color=colorVec[2]),
                  geom_vline(alpha=.55,xintercept = c(600),color=colorVec[1]),
                  ylim(c(0,1.05)),
                  #xlim(c(250,950)),
                  scale_x_continuous(breaks=seq(200,1000,by=200)),
                  xlab("Test Stimulus"),
                  annotate(geom="text",x=455,y=1.05,label="Varied",size=3.1),
                  annotate(geom="text",x=455,y=1.01,label="Training",size=3.1),
                  annotate(geom="text",x=662,y=1.05,label="Constant",size=3.1),
                  annotate(geom="text",x=657,y=1.01,label="Training",size=3.1),
                  annotate(geom="text",x=855,y=1.05,label="Varied",size=3.1),
                  annotate(geom="text",x=855,y=1.01,label="Training",size=3.1),
                  theme(panel.border = element_rect(colour = "black", fill=NA, size=1),
                        legend.position="none"))

ip1 <- simdat  %>% ggplot(aes(x,y=genGauss,group=condit,col=condit))+plotSpecs+ylab("Amount of Generalization")+ggtitle("Identical context, 1c")
ip2 <- simdat %>%  ggplot(aes(x,y=genGauss2,group=condit,col=condit))+plotSpecs+ylab("")+ggtitle("Identical context, 2c")
ip3 <- simdat  %>% ggplot(aes(x,y=genGaussDist,group=condit,col=condit))+plotSpecs+ylab("Amount of Generalization")+
  ggtitle("Added distance due to context context, 1c")+theme(plot.margin = margin(0, 0, 0, 1))
ip4 <- simdat %>%  ggplot(aes(x,y=genGaussDist2,group=condit,col=condit))+plotSpecs+ylab("")+
  ggtitle("Added distance due to context context, 2c")+theme(plot.margin = margin(0, 0, 0, 1))
# gridExtra::grid.arrange(ip1,ip2,ip3,ip4,ncol=2)

gtitle="Figure 9."
title = ggdraw()+draw_label(gtitle,fontface = 'bold',x=0,hjust=0,size=11)+theme(plot.margin = margin(0, 0, 0, 1))
plot_grid(title,NULL,ip1,ip2,ip3,ip4,ncol=2,rel_heights=c(.1,.8,.8))

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
