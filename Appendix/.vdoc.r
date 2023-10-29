#
#
#
#
#
#
#
#
source(here::here('Functions/IGAS_ProcessFunctions.R'))

#rm(list=ls())
###### data loading and organization #######

# load the processed data from experiment 1 and 2
e1 <- readRDS(here::here("data/igas_e1_cleanedData-final.rds")) %>% mutate(initialVelocityX=X_Velocity,initialVelocityY=Y_Velocity)
e2<- readRDS(here::here('data/igas_e2_cleanedData-final.rds')) %>% mutate(initialVelocityX=X_Velocity,initialVelocityY=Y_Velocity)
# load subject similarity data - computed with the IGAS model in 'IGAS-SimModel.R'

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


transfer <- filter(e2, stage=="Transfer") %>% droplevels() %>% select(-trainHalf,-initialVelocityY,ThrowPosition2)%>% ungroup()
transfer <- transfer %>% group_by(positionX) %>% mutate(globalAvg=mean(AbsDistFromCenter),globalSd=sd(AbsDistFromCenter)) %>% 
  group_by(sbjCode,positionX) %>% mutate(scaledDev = scaleVar(globalAvg,globalSd,AbsDistFromCenter)) %>%ungroup()
transfer <- transfer %>% group_by(sbjCode,positionX) %>% mutate(ind=1,testPosIndex=cumsum(ind),posN=max(testPosIndex)) %>%
  select(-ind) %>% mutate(testHalf = case_when(testPosIndex<15 ~"1st Half",testPosIndex>=15 ~"2nd Half")) %>% convert_as_factor(testHalf)
variedTest <- transfer %>% filter(condit==7) %>% mutate(extrapolate=ifelse(positionX=="900" | positionX=="400","extrapolation","interpolation")) 
constantTest <- transfer %>% filter(condit!=7) %>% mutate(extrapolate=ifelse(distFromTrain==0,"interpolation","extrapolation"))
transfer <- rbind(variedTest,constantTest)
transfer<- transfer %>% mutate(novel=ifelse(distFromTrain3==0,"trainedLocation","novelLocation"))%>% convert_as_factor(novel,extrapolate)
transfer <- transfer %>% relocate(sbjCode,condit2,Group,conditType2,stage,trial,novel,extrapolate,positionX,
                                  AbsDistFromCenter,globalAvg,globalSd,scaledDev,distFromTrain3) %>% ungroup()


transfer <- transfer %>% group_by(sbjCode,positionX) %>% mutate(halfInd=floor(max(testPosIndex)/2)) %>%
    mutate(testHalfSbj = case_when(testPosIndex<halfInd ~"1st-Half",testPosIndex>=halfInd ~"2nd-Half")) %>% convert_as_factor(testHalfSbj)


#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#

e2TestFits <- readRDS(here::here('data/IGAS-e2TestFits-April4.rds'))
e2TestFits <- e2TestFits %>% mutate(Asymptote.Minus.Start=pAsym-pStart)
exp2.fit2 <- e2TestFits %>% ungroup() %>% group_by(sbjCode,conditType)%>%
  summarise(MeanAsym=mean(pAsym),MeanStart=mean(pStart),MeanRate=mean(pRate),asymMinusStart=mean(Asymptote.Minus.Start)) %>% ungroup() %>% as.data.frame()


#
#
#
#
mr1=e2TestFits %>% anova_test(dv=pRate,between=conditType,wid=sbjCode,within=positionX,type=3);show(mr1)
mr2=exp2.fit2 %>% anova_test(dv=MeanRate,between=conditType,wid=sbjCode,type=3);show(mr2) 

h4<-e2TestFits %>% ggplot(aes(x=positionX,y=pRate,fill=conditType))+geom_bar(stat="summary",position=dodge,fun="mean")+ stat_summary(fun.data=mean_se,geom="errorbar",position=dodge,width=.5)+ggtitle("Learning rates ")+guides(fill=guide_legend(title="Training Condition"))+theme(legend.title.align=.25)+ylab("Inverse Learning Rate")+xlab("Testing Location")
h4


mr1=e2TestFits %>% filter(converged==TRUE)%>% anova_test(dv=pRate,between=conditType,wid=sbjCode,within=positionX,type=3);show(mr1)
mr2=exp2.fit2 %>% anova_test(dv=MeanRate,between=conditType,wid=sbjCode,type=3);show(mr2) 

h4<-e2TestFits %>%filter(Pval<.4)%>% ggplot(aes(x=positionX,y=pRate,fill=conditType))+geom_bar(stat="summary",position=dodge,fun="mean")+ stat_summary(fun.data=mean_se,geom="errorbar",position=dodge,width=.5)+ggtitle("Learning rates ")+guides(fill=guide_legend(title="Training Condition"))+theme(legend.title.align=.25)+ylab("Inverse Learning Rate")+xlab("Testing Location")
h4

#
#
#
#
#

testSplit <- transfer %>%
  group_by(sbjCode, conditType, positionX, testHalfSbj) %>%
  summarise(
    MeanTargetDistance = mean(AbsDistFromCenter),
    MeanScaledDev =mean(scaledDev,trim=.05),
    .groups = "keep"
  ) %>% 
  as.data.frame()

testSplit2 <- transfer %>%
  group_by(sbjCode, conditType, testHalfSbj) %>%
  summarise(
    MeanTargetDistance = mean(AbsDistFromCenter, trim = .01),
    MeanScaledDev =
      mean(scaledDev, trim = .05),
    .groups = "keep"
  ) %>% as.data.frame()


tsw <- testSplit %>% ungroup() %>% 
  pivot_wider(names_from = testHalfSbj,values_from=c(MeanTargetDistance,MeanScaledDev)) %>%
  mutate(endMinusStart = `MeanTargetDistance_2nd-Half` - `MeanTargetDistance_1st-Half`,
    endMinusStartScaled = `MeanScaledDev_2nd-Half` - `MeanScaledDev_1st-Half`) %>% 
    as.data.frame()

tsw2 <- tsw %>% 
  group_by(sbjCode,conditType) %>% summarise(endMinusStart=mean(endMinusStart),endMinusStartScaled=mean(endMinusStartScaled)) %>% as.data.frame()

# testSplit %>% ggplot(aes(x=testHalfSbj,y=MeanTargetDistance))+
#   geom_bar(aes(group=conditType,fill=conditType),stat="summary",position=dodge)+
#   facet_wrap(~positionX,ncol=2)+
#   stat_summary(aes(x=testHalfSbj,group=conditType),fun.data=mean_se,geom="errorbar",position=dodge)


h1=testSplit %>% filter(testHalfSbj=="1st-Half") %>% ggplot(aes(x=positionX,y=MeanTargetDistance))+
 geom_bar(aes(group=conditType,fill=conditType),stat="summary",position=dodge,fun="mean")+stat_summary(aes(x=positionX,group=conditType),fun.data=mean_se,geom="errorbar",position=dodge,width=.8)+
 scale_y_continuous(name="Mean Absolute Deviation From Target",limits=c(0,400))+ 
 ggtitle("Testing Performance - 1st half")+
  ylab("Mean Absolute Deviation From Target")+xlab("Testing Location")+theme(legend.position="none")

h2=testSplit %>% filter(testHalfSbj=="2nd-Half") %>% ggplot(aes(x=positionX,y=MeanTargetDistance))+
 geom_bar(aes(group=conditType,fill=conditType),stat="summary",position=dodge,fun="mean")+stat_summary(aes(x=positionX,group=conditType),fun.data=mean_se,geom="errorbar",position=dodge,width=.8) + 
 scale_y_continuous(name="",limits=c(0,400))+ 
 ggtitle("Testing Performance - 2nd half")+
  xlab("Testing Location")+theme(plot.title = element_text(hjust = 0.5))+
  guides(fill=guide_legend(title="Training Condition"))+theme(legend.title.align=.25)

#egg::ggarrange(h1,h2,ncol=2)


h3 <- tsw %>% ggplot(aes(x=positionX,y=endMinusStart))+
  geom_bar(aes(group=conditType,fill=conditType),stat="summary",position=dodge,fun="mean")+
  stat_summary(aes(x=positionX,group=conditType),fun.data=mean_se,geom="errorbar",position=dodge,width=.8)+
  ylab("2nd Half Deviation - 1st Half Deviation")+ 
  ggtitle("Improvement Per Testing Location")+
  xlab("Testing Location")+theme(plot.title = element_text(hjust = 0.5))+
  guides(fill=guide_legend(title="Testing Location"))+theme(legend.position="none")

ggarrange(h1,h2,h3,h4,ncol=2)

# 
 #testSplit2 %>% anova_test(dv=MeanScaledDev,between=conditType,within = c(testHalfSbj),wid=sbjCode,type=3)
 #testSplit %>% anova_test(dv=MeanTargetDistance,between=conditType,covariate=testHalfSbj,within=(positionX),wid=sbjCode)
# testSplit %>% lmer(MeanTargetDistance ~ conditType*testHalfSbj + (1|sbjCode)+(1+testHalfSbj|positionX),data=.) %>% summary()

testSplit %>% anova_test(dv=MeanTargetDistance,between=conditType,within=positionX,wid=sbjCode,type=3)

print("Testing End - Testing Start Comparison")
tsw %>% anova_test(dv=endMinusStart,between=conditType,within=positionX,wid=sbjCode,type=3)
tsw2 %>% anova_test(dv=endMinusStartScaled,between=conditType,wid=sbjCode,type=3)

print("2nd Half of testing only comparison")
testSplit %>% filter(testHalfSbj=="2nd-Half")%>%  anova_test(dv=MeanTargetDistance,between=conditType,within=(positionX),wid=sbjCode)
testSplit2 %>% filter(testHalfSbj=="2nd-Half")%>%  anova_test(dv=MeanScaledDev,between=conditType,wid=sbjCode,type=3)

testSplit2 %>% filter(testHalfSbj=="2nd-Half")%>% group_by(conditType) %>% get_summary_stats(type = "mean_sd")

#
#
#
#
#
#
#
#
#

ma1=e2TestFits %>% filter()%>% anova_test(dv=Asymptote.Minus.Start,between=conditType,wid=sbjCode,within=positionX,type=3);show(ma1)
ma2=exp2.fit2 %>% anova_test(dv=asymMinusStart,between=conditType,wid=sbjCode,type=3);show(ma2) 

e2TestFits %>% ggplot(aes(x=conditType,y=Asymptote.Minus.Start,fill=conditType))+geom_bar(stat="summary",position=dodge,fun="mean")+ 
  stat_summary(fun.data=mean_se,geom="errorbar",position=dodge,width=.5)+facet_grid(~positionX)+ggtitle("e2 testing (asymptote - start performance)  ")
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#

# possible that scaling required loading special package from devtools
exp1Train <- e1 %>% filter(stage!="Transfer",mode==1) %>% group_by(positionX) %>%mutate(scaleDev=scale_this(AbsDistFromCenter)) %>%ungroup() %>% group_by(sbjCode,trainHalf,conditType,devianceDirection,positionX)
exp1Train = exp1Train %>% summarise(MeanTargetDistance=mean(AbsDistFromCenter,trim=.05),scaledDist=mean(scaleDev,trim=.05),meanRelativeDist=mean(relativeDeviance,trim=.05))

# ggplot(data = exp1Train, aes(x=stage, y=scaledDist)) + geom_boxplot(aes(fill=conditType),position=position_dodge(1)) +ggtitle("Training Performance - Experiment 1")

# manuscript plot - original
ggplot(data = exp1Train, aes(x=trainHalf, y=MeanTargetDistance)) + geom_boxplot(aes(fill=conditType),position=position_dodge(1)) +ylab("Mean Distance From Center Of Target") +xlab("Training Stage")+theme(plot.title = element_text(hjust = 0.5))+guides(fill=guide_legend(title="Training Condition"))+theme(legend.title.align=.5)+theme_classic() +ggtitle("Experiment 1 Training - Absolute Distance")



exp1Train %>% ggplot(aes(x=trainHalf,y=MeanTargetDistance))+
  geom_bar(aes(group=positionX,fill=positionX),stat="summary",fun=mean,position=dodge)+
  facet_wrap(~devianceDirection,ncol=2)+
  stat_summary(aes(x=trainHalf,group=positionX),fun.data=mean_se,geom="errorbar",position=dodge,width=.8)+
  ylab("Mean Distance From Center Of Target")+
  xlab("Training Stage")+theme(plot.title = element_text(hjust = 0.5))+
  guides(fill=guide_legend(title="Throw Location"))+theme(legend.title.align=.25)

ggplot(data = exp1Train, aes(x=trainHalf, y=meanRelativeDist)) + geom_boxplot(aes(fill=conditType),position=position_dodge(1)) +ylab("Mean Relative Distance From Center Of Target") +xlab("Training Stage")+theme(plot.title = element_text(hjust = 0.5))+guides(fill=guide_legend(title="Training Condition"))+theme(legend.title.align=.5)+theme_classic()+ggtitle("Experiment 1 Training - Relative Distance ")+facet_grid(.~devianceDirection)


ggplot(data = exp1Train, aes(x=trainHalf, y=MeanTargetDistance)) + geom_boxplot(aes(fill=conditType),position=position_dodge(1)) +ylab("Mean Distance From Center Of Target") +xlab("Training Stage")+theme(plot.title = element_text(hjust = 0.5))+guides(fill=guide_legend(title="Training Condition"))+theme(legend.title.align=.5)+theme_classic() +ggtitle("Experiment 1 Training - Absolute Distance")+facet_grid(.~devianceDirection)



t= e1 %>% filter(stage!="Transfer",mode==1)  %>% group_by(conditType,positionX,devianceDirection) %>% 
  summarise(Mean=round(mean(AbsDistFromCenter),2),sd=round(sd(AbsDistFromCenter),2),msd=paste(Mean,"(",sd,")",sep=""),.groups="keep") %>%
   select(-Mean,-sd) %>% spread(positionX,msd) %>% as.data.frame() %>%stargazer(.,type="text",summary=FALSE,rownames = FALSE)


t= e1 %>% filter(stage!="Transfer",mode==1)  %>% group_by(conditType,positionX) %>% 
  summarise(Mean=round(mean(relativeDeviance),2),sd=round(sd(AbsDistFromCenter),2),msd=paste(Mean,"(",sd,")",sep=""),.groups="keep") %>%
   select(-Mean,-sd) %>% spread(positionX,msd) %>% as.data.frame() %>%stargazer(.,type="text",summary=FALSE,rownames = FALSE)

t= e1 %>% filter(stage=="Transfer",mode==1)  %>% group_by(conditType,positionX) %>% 
  summarise(Mean=round(mean(relativeDeviance),2),sd=round(sd(AbsDistFromCenter),2),msd=paste(Mean,"(",sd,")",sep=""),.groups="keep") %>%
   select(-Mean,-sd) %>% spread(positionX,msd) %>% as.data.frame() %>%stargazer(.,type="text",summary=FALSE,rownames = FALSE)


f=ftable(xtabs(MeanTargetDistance  ~ conditType+positionX+devianceDirection, data = exp1Train))
stargazer(f,type="text",summary=FALSE,rownames = FALSE)

#
#
#
#
# possible that scaling required loading special package from devtools
exp2Train <- e2 %>% filter(stage!="Transfer",mode==1) %>% group_by(Group2,sbjCode,conditType,Group,Group) %>%mutate(scaleDev=scale_this(AbsDistFromCenter)) %>%ungroup() %>% group_by(Group2,sbjCode,stage,conditType,devianceDirection)
exp2Train = exp2Train %>% summarise(MeanTargetDistance=mean(AbsDistFromCenter),scaledDist=mean(scaleDev),meanRelativeDist=mean(relativeDeviance,trim=.05))
exp2Train$stage <- factor(exp2Train$stage, levels = c("Beginning", "Middle", "End")) #in case the levels get out of order

#ggplot(data = exp2Train, aes(x=stage, y=scaledDist)) + geom_boxplot(aes(fill=Group2),position=position_dodge(1)) +ggtitle("")

# manuscript plots

par(mfrow=c(1,2))
ggplot(data = exp2Train, aes(x=stage, y=meanRelativeDist)) + geom_boxplot(aes(fill=conditType),position=position_dodge(1)) +ylab("Mean Relative Distance From Center Of Target") +xlab("Training Stage")+theme(plot.title = element_text(hjust = 0.5))+guides(fill=guide_legend(title="Training Group"))+theme(legend.title.align=.25)+theme_classic()+ggtitle("Experiment 2 Training - Relative Distance")+facet_grid(.~devianceDirection)


ggplot(data = exp2Train, aes(x=stage, y=meanRelativeDist)) + geom_boxplot(aes(fill=Group2),position=position_dodge(1)) +ylab("Mean Distance From Center Of Target") +xlab("Training Stage")+theme(plot.title = element_text(hjust = 0.5))+guides(fill=guide_legend(title="Training Condition"))+theme(legend.title.align=.25)+theme_classic()+ggtitle("Experiment 2 Training - Relative Distance")+facet_grid(.~devianceDirection)


#
#
#
#
exp1Transfer3 <- e1 %>% filter(stage=="Transfer") %>% group_by(conditType2,sbjCode,positionX,ThrowPosition,devianceDirection) %>% summarise(MeanTargetDeviance = mean(AbsDistFromCenter),meanRelativeDist=mean(relativeDeviance))


exp1Transfer3_raw <- e1 %>% filter(stage=="Transfer",mode==1,AbsDistFromCenter<1500,trialType!=44) 


#manuscript plot
dodge <- position_dodge(width = 0.9)
e1Pos <- c("610","760","835","910")
e1Var <- paste("Varied Train Position","Constant Train Position", "Novel Position", "Varied Training Position")
e1Labels<- paste(c("610\n Varied Trained","760\n Constant Trained","835\n Novel Location","910\n Varied Trained"),sep="")


# exp1Transfer3 %>% ggplot(aes(x=positionX,y=MeanTargetDeviance,group=conditType2,fill=conditType2))+geom_bar(stat="summary",position=dodge)+ stat_summary(fun.data=mean_se,geom="errorbar",position=dodge,width=.8)+ylab("Mean Distance From Center Of Target") +xlab("Testing Location")+theme(plot.title = element_text(hjust = 0.5))+guides(fill=guide_legend(title="Training Condition"))+theme(legend.title.align=.25)+theme_classic()+scale_x_discrete(name="Testing Location",breaks=e1Pos,labels=e1Labels)

# exp1Transfer3 %>% ggplot(aes(x=positionX,y=meanRelativeDist,group=conditType2,fill=conditType2))+geom_bar(stat="summary",position=dodge)+ stat_summary(fun.data=mean_se,geom="errorbar",position=dodge,width=.8)+ylab("Mean Distance From Center Of Target") +xlab("Testing Location")+theme(plot.title = element_text(hjust = 0.5))+guides(fill=guide_legend(title="Training Condition"))+theme(legend.title.align=.25)+theme_classic()+scale_x_discrete(name="Testing Location",breaks=e1Pos,labels=e1Labels)+ggtitle("Experiment 1 Test -Relative Distance")
# 
# 
# 
# exp1Transfer3 %>% ggplot(aes(x=positionX,y=MeanTargetDeviance,group=conditType2,fill=conditType2))+geom_bar(stat="summary",position=dodge)+ stat_summary(fun.data=mean_se,geom="errorbar",position=dodge,width=.8)+ylab("Mean Distance From Center Of Target") +xlab("Testing Location")+theme(plot.title = element_text(hjust = 0.5))+guides(fill=guide_legend(title="Training Condition"))+theme(legend.title.align=.25)+theme_classic()+scale_x_discrete(name="Testing Location",breaks=e1Pos,labels=e1Labels)+facet_grid(.~devianceDirection)

exp1Transfer3 %>% ggplot(aes(x=positionX,y=meanRelativeDist,group=conditType2,fill=conditType2))+geom_bar(stat="summary",position=dodge)+ stat_summary(fun.data=mean_se,geom="errorbar",position=dodge,width=.8)+ylab("Mean Signed Deviation From Target Center") +xlab("Testing Location")+theme(plot.title = element_text(hjust = 0.5))+guides(fill=guide_legend(title="Training Condition"))+theme(legend.title.align=.25)+scale_x_discrete(name="Testing Location",breaks=e1Pos,labels=e1Labels)+facet_grid(.~devianceDirection)




t= exp1Transfer3  %>% 
  group_by(conditType2,positionX) %>% 
  summarise(Mean.unsigned=round(mean(MeanTargetDeviance),2),
            sd.unsigned=round(sd(MeanTargetDeviance),2),
            msdu=paste(Mean.unsigned,"(",sd.unsigned,")",sep=""),
            Mean.signed=round(mean(meanRelativeDist),2),
            sd.signed=round(sd(meanRelativeDist),2),
            msds=paste(Mean.signed,"(",sd.signed,")",sep=""),
            .groups="keep") %>% ungroup() %>%
   select(-Mean.unsigned,-sd.unsigned,-Mean.signed,-sd.signed) %>% 
  pivot_wider(names_from = positionX,values_from=c(msdu,msds)) %>% as.data.frame() %>%stargazer(.,type="text",summary=FALSE,rownames = FALSE)


t= exp1Transfer3  %>% 
  mutate(Condition=conditType2) %>%
  group_by(Condition,positionX) %>% 
  summarise(Mean.signed=round(mean(meanRelativeDist),2),
            sd.signed=round(sd(meanRelativeDist),2),
            msds=paste(Mean.signed,"(",sd.signed,")",sep=""),
            .groups="keep") %>% ungroup() %>%
   select(-Mean.signed,-sd.signed) %>% 
  pivot_wider(names_from = positionX,values_from=c(msds)) %>% as.data.frame() %>%stargazer(.,type="text",summary=FALSE,rownames = FALSE)
            


#
#
#
#
#
#

exp2Transfer3 <- e2 %>% filter(stage=="Transfer") %>% group_by(conditType2,sbjCode,positionX,devianceDirection,Group) %>% summarise(MeanTargetDeviance = mean(AbsDistFromCenter,trim=.05),meanRelativeDist=mean(relativeDeviance)) %>% ungroup()
exp2Transfer3$ThrowPosition <- exp2Transfer3$positionX

exp2Transfer4 <- e2 %>% filter(stage=="Transfer",mode==1,AbsDistFromCenter<1500,trialType!=44) %>% group_by(Group2,sbjCode,positionX,devianceDirection,Group) %>% summarise(MeanTargetDeviance = mean(AbsDistFromCenter),meanRelativeDist=mean(relativeDeviance)) 



# exp2Transfer3 %>% ggplot(aes(x=ThrowPosition,y=meanRelativeDist,group=conditType2,fill=conditType2))+geom_bar(stat="summary",position=dodge,fun="mean")+ stat_summary(fun.data=mean_se,geom="errorbar",position=dodge,width=.5)+ylab("Mean Distance From Center Of Target") +xlab("Testing Location")+theme(plot.title = element_text(hjust = 0.5))+guides(fill=guide_legend(title="Training Condition"))+theme(legend.title.align=.25)+theme_classic()+ggtitle("Experiment 2 Test - Relative Distance")
# 
# exp2Transfer3 %>% ggplot(aes(x=ThrowPosition,y=MeanTargetDeviance,group=conditType2,fill=conditType2))+geom_bar(stat="summary",position=dodge,fun="mean")+ stat_summary(fun.data=mean_se,geom="errorbar",position=dodge,width=.5)+ylab("Mean Distance From Center Of Target") +xlab("Testing Location")+theme(plot.title = element_text(hjust = 0.5))+guides(fill=guide_legend(title="Training Condition"))+theme(legend.title.align=.25)+theme_classic()+facet_grid(.~devianceDirection)+ggtitle("Absolute Dist - Split by Over/Under")

exp2Transfer3 %>% ggplot(aes(x=ThrowPosition,y=meanRelativeDist,group=conditType2,fill=conditType2))+geom_bar(stat="summary",position=dodge,fun="mean")+ stat_summary(fun.data=mean_se,geom="errorbar",position=dodge,width=.5)+ylab("Mean Signed Deviation From Target Center") +xlab("Testing Location")+theme(plot.title = element_text(hjust = 0.5))+guides(fill=guide_legend(title="Training Condition"))+theme(legend.title.align=.25)+facet_grid(.~devianceDirection)



# 
# exp2Transfer4 %>% ggplot(aes(x=positionX,y=MeanTargetDeviance,group=Group2,fill=Group2))+geom_bar(stat="summary",position=position_dodge(),fun="mean")+ stat_summary(fun.data=mean_se,geom="errorbar",position=position_dodge())+ylab("Mean Distance From Center Of Target") +xlab("Testing Location")+theme(plot.title = element_text(hjust = 0.5))+guides(fill=guide_legend(title="Training Position"))+theme(legend.title.align=.25)+theme_classic()+facet_grid(.~devianceDirection)+ggtitle("Absolute Dist - Split by Over/Under")
# 
# 
# exp2Transfer4 %>% ggplot(aes(x=positionX,y=meanRelativeDist,group=Group2,fill=Group2))+geom_bar(stat="summary",position=position_dodge(),fun="mean")+ stat_summary(fun.data=mean_se,geom="errorbar",position=position_dodge())+ylab("Mean Distance From Center Of Target") +xlab("Testing Location")+theme(plot.title = element_text(hjust = 0.5))+guides(fill=guide_legend(title="Training Position"))+theme(legend.title.align=.25)+theme_classic()+facet_grid(.~devianceDirection)+ggtitle("Experiment 2 Test - Relative Distance")



t= exp2Transfer3  %>% 
  mutate(Condition=conditType2) %>%
  group_by(Condition,positionX) %>% 
  summarise(Mean.signed=round(mean(meanRelativeDist),2),
            sd.signed=round(sd(meanRelativeDist),2),
            msds=paste(Mean.signed,"(",sd.signed,")",sep=""),
            .groups="keep") %>% ungroup() %>%
   select(-Mean.signed,-sd.signed) %>% 
  pivot_wider(names_from = positionX,values_from=c(msds)) %>% as.data.frame() %>%stargazer(.,type="text",summary=FALSE,rownames = FALSE)
            

#
#
#
#
#
#
#
#
#
#
# first 3 trials - 1 throw from 610, 760 and 910
# interleaved every 20 trials, 2 throws from 610, 760, 910
# 10 full intermittent tests (6 trials each), plus 3 at beginning = 63 total per subject. 
#[1] 0  2  3  5  6  8  9  11 12 14 15 17 18 20 21 23 24 26 27 29 30
# First final testing trial is 264. So 1-263 = training and intermittent testing. 
# 
# intTest.third <- exp1.inter %>% filter(intStage!="int1")%>% group_by(sbjCode,conditType,stage,intStage,positionX) %>%
#   summarise(MeanTargetDistance=mean(AbsDistFromCenter,trim=.05)) %>% group_by(sbjCode,conditType,stage,positionX) %>%
#   summarise(MeanTargetDistance=mean(MeanTargetDistance))
# 
# intTest.third %>% ggplot(aes(x=positionX,y=MeanTargetDistance))+
#   geom_bar(aes(group=stage,fill=stage),stat="summary",fun=mean,position=dodge)+
#   facet_wrap(~conditType,ncol=2)+
#   stat_summary(aes(x=positionX,group=stage),fun.data=mean_se,geom="errorbar",position=dodge,width=.8)+
#   ylab("Mean Distance From Center Of Target")+
#   xlab("Throw Location")+theme(plot.title = element_text(hjust = 0.5))+
#   guides(fill=guide_legend(title="Training Stage"))+theme(legend.title.align=.25)
# 
# intTest.half %>% anova_test(dv=MeanTargetDistance,between=conditType,within=trainHalf,covariate=positionX,wid=sbjCode)
# intTest.half %>% anova_test(dv=MeanTargetDistance,between=conditType,within=c(trainHalf,positionX),wid=sbjCode)


 intTest.half <- readRDS("data/e1_intTest.rds")


intTest.half <- exp1.inter %>%filter(AbsDistFromCenter<1550)%>% 
  group_by(sbjCode,conditType,trainHalf,positionX) %>%
  summarise(MeanTargetDistance=mean(AbsDistFromCenter,trim=.01))
  
intTest.half %>% ggplot(aes(x=positionX,y=MeanTargetDistance))+
  geom_bar(aes(group=trainHalf,fill=trainHalf),stat="summary",fun=mean,position=dodge)+
  facet_wrap(~conditType,ncol=2)+
  stat_summary(aes(x=positionX,group=trainHalf),fun.data=mean_se,geom="errorbar",position=dodge,width=.8)+
  ylab("Mean Distance From Center Of Target")+
  xlab("Intermittent Testing Throw Location")+theme(plot.title = element_text(hjust = 0.5))+
  guides(fill=guide_legend(title="Training Stage"))+theme(legend.title.align=.25)


cnames=c("Condition","610_First Half","760_First Half","910_First Half","610_Second Half","760_Second Half","910_Second Half")
test= intTest.half %>% rename(Condition="conditType") %>% group_by(Condition,trainHalf,positionX) %>% 
  summarise(Mean=round(mean(MeanTargetDistance),2),sd=round(sd(MeanTargetDistance),2)) 
test=test %>% group_by(Condition) %>% mutate(msd=paste(Mean,"(",sd,")",sep="")) %>%
 select(Condition,positionX,trainHalf,msd)%>% pivot_wider(names_from = c(positionX,trainHalf),values_from=c(msd))
test=test %>% as.data.frame()
colnames(test) <- cnames
stargazer(test,type="text",summary=FALSE,rownames=FALSE)

#
#
#
#
#
#
#
#
#
#
# possible that scaling required loading special package from devtools
exp1Train <- e1 %>% filter(stage!="Transfer",mode==1) %>% group_by(Group,sbjCode) %>%mutate(scaleDev=scale_this(AbsDistFromCenter)) %>%ungroup() %>% group_by(Group,sbjCode,stage,conditType)
exp1Train = exp1Train %>% summarise(MeanTargetDistance=mean(AbsDistFromCenter),scaledDist=mean(scaleDev,trim=.05))
exp1Train$stage <- factor(exp1Train$stage, levels = c("Beginning", "Middle", "End")) #in case the levels get out of order
exp1TrainTrials <- e1 %>% filter(stage!="Transfer",mode==1,trialType!=44) %>% group_by(Group,sbjCode,positionX) %>% mutate(scaleDev=scale_this(AbsDistFromCenter),ind=1,trainIndex=cumsum(ind)) %>%ungroup() %>% group_by(Group,sbjCode,stage,conditType)




# exp1TrainTrials %>% filter(AbsDistFromCenter<1000) %>% ggplot(aes(x=trainIndex,y=AbsDistFromCenter,group=conditType2)) +geom_point()+geom_smooth(method="lm",se=FALSE) +facet_grid(~positionX)


# manuscript plot - original
ggplot(data = exp1Train, aes(x=stage, y=MeanTargetDistance)) + geom_boxplot(aes(fill=conditType),position=position_dodge(1))+stat_summary(fun="mean",aes(group=conditType),position=position_dodge(1))+
ylab("Mean Distance From Center Of Target") +xlab("Training Stage")+theme(plot.title = element_text(hjust = 0.5))+guides(fill=guide_legend(title="Training Condition"))+theme(legend.title.align=.5)+theme_classic()



 lineplot.CI(data=exp1Train,x.factor=stage,group=conditType,response=scaledDist,xlab="Training Stage",x.leg=2,legend=TRUE,ylab="Distance from Target (scaled)",main="Training Performance - Experiment 1",col=c("red","black"))+theme_classic()

lineplot.CI(data=exp1Train,x.factor=stage,group=conditType,response=MeanTargetDistance,xlab="Training Stage",x.leg=2,legend=TRUE,ylab="Distance From Target",main="Training Performance - Experiment 1",col=c("red","blue"))+theme_classic()

# paste("stage means")
# exp1Train %>% ungroup() %>%group_by(stage) %>% summarise(mean=mean(MeanTargetDistance))
# 
# model<-ezANOVA(data=data.frame(exp1Train),dv=scaledDist,within=c(stage),between=c(conditType),wid=sbjCode) # conduct a repeated measures ANOVA - dv = dependent 
# show(model)
# 
# model<-ezANOVA(data=data.frame(exp1Train),dv=MeanTargetDistance,within=c(stage),between=c(conditType),wid=sbjCode) # conduct a repeated measures ANOVA - dv = dependent 
# show(model)

#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
e2Fits.AggPos <- readRDS('data/IGAS-e2Fits.AggPos-April_12.rds')

e2Fits.AggPos %>% ggplot(aes(x=Group,y=pStart,fill=Group))+geom_bar(stat="summary",position=dodge,fun="mean")+ 
  stat_summary(fun.data=mean_se,geom="errorbar",position=dodge,width=.5)+ggtitle("experiment 2 - starting performance per position")

e2Fits.AggPos %>% ggplot(aes(x=Group,y=pAsym,fill=Group))+geom_bar(stat="summary",position=dodge,fun="mean")+ 
  stat_summary(fun.data=mean_se,geom="errorbar",position=dodge,width=.5)+ggtitle("e2 testing performance asymptote per position ")

e2Fits.AggPos %>% ggplot(aes(x=Group,y=pRate,fill=Group))+geom_bar(stat="summary",position=dodge,fun="mean")+ 
  stat_summary(fun.data=mean_se,geom="errorbar",position=dodge,width=.5)+ggtitle("e2 testing performance asymptote per position ")

mr1=e2Fits.AggPos %>% anova_test(dv=pRate,between=conditType,wid=sbjCode,type=3);show(mr1)

#
#
#
#
#
#

ms1=e2TestFits %>% filter(converged==TRUE) %>% anova_test(dv=pStart,between=conditType,wid=sbjCode,within=positionX,type=3);show(ms1)
ms2=exp2.fit2 %>% anova_test(dv=MeanStart,between=conditType,wid=sbjCode,type=3);show(ms2) 


e2TestFits %>% ggplot(aes(x=conditType,y=pStart,fill=conditType))+geom_bar(stat="summary",position=dodge,fun="mean")+ 
  stat_summary(fun.data=mean_se,geom="errorbar",position=dodge,width=.5)+facet_grid(~positionX)+ggtitle("experiment 2 - starting performance per position")

#
#
#
#
#
#

ma1=e2TestFits %>% filter(converged==TRUE)%>% anova_test(dv=pAsym,between=conditType,wid=sbjCode,within=positionX,type=3);show(ma1)
ma2=exp2.fit2 %>% anova_test(dv=MeanAsym,between=conditType,wid=sbjCode,type=3);show(ma2) 

e2TestFits %>% ggplot(aes(x=conditType,y=pAsym,fill=conditType))+geom_bar(stat="summary",position=dodge,fun="mean")+ 
  stat_summary(fun.data=mean_se,geom="errorbar",position=dodge,width=.5)+facet_grid(~positionX)+ggtitle("e2 testing performance asymptote per position ")

#
#
#
#
#
#
#
#
#