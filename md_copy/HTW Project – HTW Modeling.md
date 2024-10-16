[[ReadItLater]] [[Article]]

# [HTW Project – HTW Modeling](https://tegorman13.github.io/htw/Model/htw_model.html)

Code

```
pacman::p_load(dplyr,purrr,tidyr,ggplot2, data.table, here, patchwork, conflicted, 
               stringr,future,furrr, knitr, reactable,ggstance, htmltools,
               ggdist,ggh4x,brms,tidybayes,emmeans,bayestestR, gt)
walk(c("dplyr"), conflict_prefer_all, quiet = TRUE)
#options(brms.backend="cmdstanr",mc.cores=4)
options(digits=3, scipen=999, dplyr.summarise.inform=FALSE)
walk(c("Display_Functions","fun_alm","fun_indv_fit","fun_model", "prep_model_data","org_functions"), ~source(here::here(paste0("Functions/", .x, ".R"))))
```

Code

```
invisible(list2env(load_sbj_data(), envir = .GlobalEnv))
invisible(list2env(load_e1(), envir = .GlobalEnv))
e1Sbjs <- e1 |> group_by(id,condit) |> summarise(n=n())
e2_model <- load_e2()
e3_model <- load_e3()
```

Code

[![](md_extract/assets/fig-alm-diagram-1.png)](https://tegorman13.github.io/htw/Model/htw_model_files/figure-html/fig-alm-diagram-1.png "Figure 1: The Associative Learning Model (ALM). The diagram illustrates the basic structure of the ALM model as used in the present work. Input nodes are activated as a function of their similarity to the lower-boundary of the target band. The generalization parameter, c, determines the degree to which nearby input nodes are activated. The output nodes are activated as a function of the weighted sum of the input nodes - weights are updated via the delta rule.")

Figure 1: The Associative Learning Model (ALM). The diagram illustrates the basic structure of the ALM model as used in the present work. Input nodes are activated as a function of their similarity to the lower-boundary of the target band. The generalization parameter, \\(c\\), determines the degree to which nearby input nodes are activated. The output nodes are activated as a function of the weighted sum of the input nodes - weights are updated via the delta rule.

## Modeling Approach

The modeling goal is to implement a full process model capable of both 1) producing novel responses and 2) modeling behavior in both the learning and testing stages of the experiment. For this purpose, we will apply the associative learning model (ALM) and the EXAM model of function learning ([DeLosh et al., 1997](https://tegorman13.github.io/htw/Model/htw_model.html#ref-deloshExtrapolationSineQua1997)). ALM is a simple connectionist learning model which closely resembles Kruschke’s ALCOVE model ([Kruschke, 1992](https://tegorman13.github.io/htw/Model/htw_model.html#ref-kruschkeALCOVEExemplarbasedConnectionist1992)), with modifications to allow for the generation of continuous responses.

## ALM & Exam Description

ALM is a localist neural network model ([Page, 2000](https://tegorman13.github.io/htw/Model/htw_model.html#ref-pageConnectionistModellingPsychology2000a)), with each input node corresponding to a particular stimulus, and each output node corresponding to a particular response value. The units in the input layer activate as a function of their Gaussian similarity to the input stimulus. So, for example, an input stimulus of value 55 would induce maximal activation of the input unit tuned to 55. Depending on the value of the generalization parameter, the nearby units (e.g. 54 and 56; 53 and 57) may also activate to some degree. ALM is structured with input and output nodes that correspond to regions of the stimulus space, and response space, respectively. The units in the input layer activate as a function of their similarity to a presented stimulus. As was the case with the exemplar-based models, similarity in ALM is exponentially decaying function of distance. The input layer is fully connected to the output layer, and the activation for any particular output node is simply the weighted sum of the connection weights between that node and the input activations. The network then produces a response by taking the weighted average of the output units (recall that each output unit has a value corresponding to a particular response). During training, the network receives feedback which activates each output unit as a function of its distance from the ideal level of activation necessary to produce the correct response. The connection weights between input and output units are then updated via the standard delta learning rule, where the magnitude of weight changes are controlled by a learning rate parameter. The EXAM model is an extension of ALM, with the same learning rule and representational scheme for input and output units. EXAM differs from ALM only in its response rule, as it includes a linear extrapolation mechanism for generating novel responses. Although this extrapolation rule departs from a strictly similarity-based generalization mechanism, EXAM is distinct from pure rule-based models in that it remains constrained by the weights learned during training. EXAM retrieves the two nearest training inputs, and the ALM responses associated with those inputs, and computes the slope between these two points. The slope is then used to extrapolate the response to the novel test stimulus. Because EXAM requires at least two input-output pairs to generate a response, additional assumptions were required in order for it to generate resposnes for the constant group. We assumed that participants come to the task with prior knowledge of the origin point (0,0), which can serve as a reference point necessary for the model to generate responses for the constant group. This assumption is motivated by previous function learning research (Brown & Lacroix ([2017](https://tegorman13.github.io/htw/Model/htw_model.html#ref-brownUnderestimationLinearFunction2017))), which through a series of manipulations of the y intercept of the underlying function, found that participants consistently demonstrated knowledge of, or a bias towards, the origin point (see Kwantes & Neal ([2006](https://tegorman13.github.io/htw/Model/htw_model.html#ref-kwantesWhyPeopleUnderestimate2006)) for additional evidence of such a bias in function learning tasks).

See [Table 1](https://tegorman13.github.io/htw/Model/htw_model.html#tbl-alm-exam) for a full specification of the equations that define ALM and EXAM, and [Figure 1](https://tegorman13.github.io/htw/Model/htw_model.html#fig-alm-diagram) for a visual representation of the ALM model.

Table 1: ALM & EXAM Equations

  
|  | **ALM Response Generation** |  |
| --- | --- | --- |
| Input Activation | \\(a\_i(X) = \\frac{e^{-c(X-X\_i)^2}}{\\sum\_{k=1}^M e^{-c(X-X\_k)^2}}\\) | Input nodes activate as a function of Gaussian similarity to stimulus |
| Output Activation | \\(O\_j(X) = \\sum\_{k=1}^M w\_{ji} \\cdot a\_i(X)\\) | Output unit \\(O\_j\\) activation is the weighted sum of input activations and association weights |
| Output Probability | \\(P\[Y\_j\|X\] = \\frac{O\_j(X)}{\\sum\_{k=1}^M O\_k(X)}\\) | The response, \\(Y\_j\\) probabilites computed via Luce’s choice rule |
| Mean Output | \\(m(X) = \\sum\_{j=1}^L Y\_j \\cdot \\frac{O\_j(x)}{\\sum\_{k=1}^M O\_k(X)}\\) | Weighted average of probabilities determines response to X |
|  | **ALM Learning** |  |
| Feedback | \\(f\_j(Z) = e^{-c(Z-Y\_j)^2}\\) | feedback signal Z computed as similarity between ideal response and observed response |
| magnitude of error | \\(\\Delta\_{ji}=(f\_{j}(Z)-o\_{j}(X))a\_{i}(X)\\) | Delta rule to update weights. |
| Update Weights | \\(w\_{ji}^{new}=w\_{ji}+\\eta\\Delta\_{ji}\\) | Updates scaled by learning rate parameter \\(\\eta\\). |
|  | **EXAM Extrapolation** |  |
| Instance Retrieval | \\(P\[X\_i\|X\] = \\frac{a\_i(X)}{\\sum\_{k=1}^M a\_k(X)}\\) | Novel test stimulus \\(X\\) activates input nodes \\(X\_i\\) |
| Slope Computation | \\(S =\\) \\(\\frac{m(X\_{1})-m(X\_{2})}{X\_{1}-X\_{2}}\\) | Slope value, \\(S\\) computed from nearest training instances |
| Response | \\(E\[Y\|X\_i\] = m(X\_i) + S \\cdot \[X - X\_i\]\\) | ALM response \\(m(X\_i)\\) adjusted by slope. |

## Model Fitting

To fit ALM and EXAM to our participant data, we employ a similar method to Mcdaniel et al. ([2009](https://tegorman13.github.io/htw/Model/htw_model.html#ref-mcdanielPredictingTransferPerformance2009)), wherein we examine the performance of each model after being fit to various subsets of the data. Each model was fit to the data in with separate procedures: 1) fit to maximize predictions of the testing data, 2) fit to maximize predictions of both the training and testing data, 3) fit to maximize predictions of the just the training data. We refer to this fitting manipulations as “Fit Method” in the tables and figures below. It should be emphasized that for all three fit methods, the ALM and EXAM models behave identically - with weights updating only during the training phase.Models to were fit separately to the data of each individual participant. The free parameters for both models are the generalization (\\(c\\)) and learning rate (\\(lr\\)) parameters. Parameter estimation was performed using approximate bayesian computation (ABC), which we describe in detail below.

**Approximate Bayesian Computation**

To estimate the parameters of ALM and EXAM, we used approximate bayesian computation (ABC), enabling us to obtain an estimate of the posterior distribution of the generalization and learning rate parameters for each individual. ABC belongs to the class of simulation-based inference methods ([Cranmer et al., 2020](https://tegorman13.github.io/htw/Model/htw_model.html#ref-cranmerFrontierSimulationbasedInference2020)), which have begun being used for parameter estimation in cognitive modeling relatively recently ([Kangasrääsiö et al., 2019](https://tegorman13.github.io/htw/Model/htw_model.html#ref-kangasraasioParameterInferenceComputational2019); [Turner et al., 2016](https://tegorman13.github.io/htw/Model/htw_model.html#ref-turnerBayesianAnalysisSimulationbased2016); [Turner & Van Zandt, 2012](https://tegorman13.github.io/htw/Model/htw_model.html#ref-turnerTutorialApproximateBayesian2012)). Although they can be applied to any model from which data can be simulated, ABC methods are most useful for complex models that lack an explicit likelihood function (e.g. many neural network models).

The general ABC procedure is to 1) define a prior distribution over model parameters. 2) sample candidate parameter values, \\(\\theta^\*\\), from the prior. 3) Use \\(\\theta^\*\\) to generate a simulated dataset, \\(Data\_{sim}\\). 4) Compute a measure of discrepancy between the simulated and observed datasets, \\(discrep\\)(\\(Data\_{sim}\\), \\(Data\_{obs}\\)). 5) Accept \\(\\theta^\*\\) if the discrepancy is less than the tolerance threshold, \\(\\epsilon\\), otherwise reject \\(\\theta^\*\\). 6) Repeat until desired number of posterior samples are obtained.

Although simple in the abstract, implementations of ABC require researchers to make a number of non-trivial decisions as to i) the discrepancy function between observed and simulated data, ii) whether to compute the discrepancy between trial level data, or a summary statistic of the datasets, iii) the value of the minimum tolerance \\(\\epsilon\\) between simulated and observed data. For the present work, we follow the guidelines from previously published ABC tutorials ([Farrell & Lewandowsky, 2018](https://tegorman13.github.io/htw/Model/htw_model.html#ref-farrellComputationalModelingCognition2018); [Turner & Van Zandt, 2012](https://tegorman13.github.io/htw/Model/htw_model.html#ref-turnerTutorialApproximateBayesian2012)). For the test stage, we summarized datasets with mean velocity of each band in the observed dataset as \\(V\_{obs}^{(k)}\\) and in the simulated dataset as \\(V\_{sim}^{(k)}\\), where \\(k\\) represents each of the six velocity bands. For computing the discrepancy between datasets in the training stage, we aggregated training trials into three equally sized blocks (separately for each velocity band in the case of the varied group). After obtaining the summary statistics of the simulated and observed datasets, the discrepancy was computed as the mean of the absolute difference between simulated and observed datasets ([Equation 1](https://tegorman13.github.io/htw/Model/htw_model.html#eq-discrep-test) and [Equation 2](https://tegorman13.github.io/htw/Model/htw_model.html#eq-discrep-train)). For the models fit to both training and testing data, discrepancies were computed for both stages, and then averaged together.

\\\[ discrep\_{Test}(Data\_{sim}, Data\_{obs}) = \\frac{1}{6} \\sum\_{k=1}^{6} |V\_{obs}^{(k)} - V\_{sim}^{(k)}| \\tag{1}\\\]

\\\[ \\begin{aligned} \\\\ discrep\_{Train,constant}(Data\_{sim}, Data\_{obs}) = \\frac{1}{N\_{blocks}} \\sum\_{j=1}^{N\_{blocks}} |V\_{obs,constant}^{(j)} - V\_{sim,constant}^{(j)}| \\\\ \\\\ discrep\_{Train,varied}(Data\_{sim}, Data\_{obs}) = \\frac{1}{N\_{blocks} \\times 3} \\sum\_{j=1}^{N\_{blocks}} \\sum\_{k=1}^{3} |V\_{obs,varied}^{(j,k)} - V\_{sim,varied}^{(j,k)}| \\end{aligned} \\tag{2}\\\]

The final component of our ABC implementation is the determination of an appropriate value of \\(\\epsilon\\). The setting of \\(\\epsilon\\) exerts strong influence on the approximated posterior distribution. Smaller values of \\(\\epsilon\\) increase the rejection rate, and improve the fidelity of the approximated posterior, while larger values result in an ABC sampler that simply reproduces the prior distribution. Because the individual participants in our dataset differed substantially in terms of the noisiness of their data, we employed an adaptive tolerance setting strategy to tailor \\(\\epsilon\\) to each individual. The initial value of \\(\\epsilon\\) was set to the overall standard deviation of each individuals velocity values. Thus, sampled parameter values that generated simulated data within a standard deviation of the observed data were accepted, while worse performing parameters were rejected. After every 300 samples the tolerance was allowed to increase only if the current acceptance rate of the algorithm was less than 1%. In such cases, the tolerance was shifted towards the average discrepancy of the 5 best samples obtained thus far. To ensure the acceptance rate did not become overly permissive, \\(\\epsilon\\) was also allowed to decrease every time a sample was accepted into the posterior.

For each of the 156 participants from Experiment 1, the ABC algorithm was run until 200 samples of parameters were accepted into the posterior distribution. Obtaining this number of posterior samples required an average of 205,000 simulation runs per participant. Fitting each combination of participant, Model (EXAM & ALM), and fitting method (Test only, Train only, Test & Train) required a total of 192 million simulation runs. To facilitate these intensive computational demands, we used the Future Package in R ([Bengtsson, 2021](https://tegorman13.github.io/htw/Model/htw_model.html#ref-bengtssonUnifyingFrameworkParallel2021)), allowing us to parallelize computations across a cluster of ten M1 iMacs, each with 8 cores.

### Modelling Results

#### Group level Patterns

Code

```
post_tabs <- abc_tables(post_dat,post_dat_l)
train_tab <- abc_train_tables(pd_train,pd_train_l)

e1_tab <- rbind(post_tabs$agg_pred_full |> mutate("Task Stage"="Test"), train_tab$agg_pred_full |> mutate("Task Stage"="Train")) |> mutate(Fit_Method=rename_fm(Fit_Method)) 

e1_tab %>%
  group_by(`Task Stage`, Fit_Method, Model, condit) %>%
  summarize(ME = mean(mean_error), .groups = "drop") %>%
  pivot_wider(
    names_from = c(Model, condit),
    values_from = ME,
    names_sep = "_"  # Add this line to specify the separator for column names
  ) %>%
  rename("Fit Method" = Fit_Method) %>%
  gt() %>%
  cols_move_to_start(columns = c(`Task Stage`)) %>%
  cols_label(
    `Task Stage` = "Task Stage"
  ) %>%
  fmt_number(
    columns = starts_with("ALM") | starts_with("EXAM"),
    decimals = 2
  ) %>%
  tab_spanner_delim(delim = "_") %>%
  tab_style(
    style = cell_fill(color = "white"),
     locations = cells_body(columns = everything(), rows = everything())
  ) %>%
  tab_style(
    style = cell_borders(sides = "top", color = "black", weight = px(1)),
    locations = cells_column_labels()
  ) %>%
  tab_options(
    column_labels.font.size = 10,
    heading.title.font.size = 14,
    heading.subtitle.font.size = 12,
    table.font.size = 10, 
    quarto.disable_processing = TRUE
  ) 
``` 

Table 2: Models errors predicting empirical data - aggregated over all participants, posterior parameter values, and velocity bands. Note that Fit Method refers to the subset of the data that the model was trained on, while Task Stage refers to the subset of the data that the model was evaluated on.

| Task Stage | Fit Method | ALM |  | EXAM |  |
| --- | --- | --- | --- | --- | --- |
| Constant | Varied | Constant | Varied |
| Test | Fit to Test Data | 199.93 | 103.36 | 104.01 | 85.68 |
| Test | Fit to Test & Training Data | 216.97 | 170.28 | 127.94 | 144.86 |
| Test | Fit to Training Data | 467.73 | 291.38 | 273.30 | 297.91 |
| Train | Fit to Test Data | 297.82 | 2,016.01 | 53.90 | 184.00 |
| Train | Fit to Test & Training Data | 57.40 | 132.32 | 42.92 | 127.90 |
| Train | Fit to Training Data | 51.77 | 103.48 | 51.43 | 107.03 |

Code

```
c_post <- post_dat_avg %>%
    group_by(id, condit, Model, Fit_Method, rank) %>%
    slice_head(n = 1) |>
    ggplot(aes(y=log(c), x = Fit_Method,col=condit)) + stat_pointinterval(position=position_dodge(.2)) +
    ggh4x::facet_nested_wrap(~Model) + labs(title="c parameter") +
  theme(legend.title = element_blank(), legend.position="right",plot.title=element_text(hjust=.4))

lr_post <- post_dat_avg %>%
    group_by(id, condit, Model, Fit_Method, rank) %>%
    slice_head(n = 1) |>
    ggplot(aes(y=lr, x = Fit_Method,col=condit)) + stat_pointinterval(position=position_dodge(.4)) +
    ggh4x::facet_nested_wrap(~Model) + labs(title="learning rate parameter") +
  theme(legend.title = element_blank(), legend.position = "none",plot.title=element_text(hjust=.5))
c_post + lr_post
```

[![](md_extract/assets/fig-htw-post-dist-1-3.png)](https://tegorman13.github.io/htw/Model/htw_model_files/figure-html/fig-htw-post-dist-1.png "Figure 2: Posterior Distributions of c and lr parameters. Points represent median values, thicker intervals represent 66% credible intervals and thin intervals represent 95% credible intervals around the median. Note that the y axes of the plots for the c parameter are scaled logarithmically.")

Figure 2: Posterior Distributions of \\(c\\) and \\(lr\\) parameters. Points represent median values, thicker intervals represent 66% credible intervals and thin intervals represent 95% credible intervals around the median. Note that the y axes of the plots for the c parameter are scaled logarithmically.

Code

```
train_resid <- pd_train |> group_by(id,condit,Model,Fit_Method, Block,x) |> 
  summarise(y=mean(y), pred=mean(pred), mean_error=abs(y-pred)) |>
  group_by(id,condit,Model,Fit_Method,Block) |>
  summarise(mean_error=mean(mean_error)) |>
  ggplot(aes(x=interaction(Block,Model), y = mean_error, fill=factor(Block))) + 
  stat_bar + 
  ggh4x::facet_nested_wrap(rename_fm(Fit_Method)~condit, scales="free",ncol=2) +
   scale_x_discrete(guide = "axis_nested") +
  scale_fill_manual(values=c("gray10","gray50","gray92"))+
  labs(title="Model Residual Errors - Training Stage", y="RMSE", x= "Model",fill="Training Block") +
  theme(legend.position="top")

test_resid <-  post_dat |> 
   group_by(id,condit,x,Model,Fit_Method,bandType) |>
    summarise(y=mean(y), pred=mean(pred), error=abs(y-pred)) |> 
  mutate(vbLab = factor(paste0(x,"-",x+200))) |>
  ggplot(aes(x = Model, y = abs(error), fill=vbLab,col=ifelse(bandType=="Trained","black",NA),size=ifelse(bandType=="Trained","black",NA))) + 
  stat_bar + 
  #scale_fill_manual(values=wes_palette("AsteroidCity2"))+
  scale_color_manual(values = c("black" = "black"), guide = "none") +
  scale_size_manual(values = c("black" = .5), guide = "none") +
  ggh4x::facet_nested_wrap(rename_fm(Fit_Method)~condit, axes = "all",ncol=2,scale="free") +
  labs(title="Model Residual Errors - Testing Stage",y="RMSE", x="Velocity Band") 

(train_resid / test_resid) +
  #plot_layout(heights=c(1,1.5)) & 
  plot_annotation(tag_levels = list(c('A','B')),tag_suffix = ') ') 
``` 

[![](md_extract/assets/fig-htw-resid-pred-1-2.png)](https://tegorman13.github.io/htw/Model/htw_model_files/figure-html/fig-htw-resid-pred-1.png "Figure 3: Model residuals for each combination of training condition, fit method, and model. Residuals reflect the difference between observed and predicted values. Lower values indicate better model fit. Note that y axes are scaled differently between facets. A) Residuals predicting each block of the training data. B) Residuals predicting each band during the testing stage. Bolded bars indicate bands that were trained, non-bold bars indicate extrapolation bands.")

Figure 3: Model residuals for each combination of training condition, fit method, and model. Residuals reflect the difference between observed and predicted values. Lower values indicate better model fit. Note that y axes are scaled differently between facets. A) Residuals predicting each block of the training data. B) Residuals predicting each band during the testing stage. Bolded bars indicate bands that were trained, non-bold bars indicate extrapolation bands.

The posterior distributions of the \\(c\\) and \\(lr\\) parameters are shown [Figure 2](https://tegorman13.github.io/htw/Model/htw_model.html#fig-htw-post-dist), and model predictions are shown alongside the empirical data in [Figure 4](https://tegorman13.github.io/htw/Model/htw_model.html#fig-cm-vx-pat). There were substantial individual differences in the posteriors of both parameters, with the within-group individual differences generally swamped any between-group or between-model differences. The magnitude of these individual differences remains even if we consider only the single best parameter set for each subject.

We used the posterior distribution of \\(c\\) and \\(lr\\) parameters to generate a posterior predictive distribution of the observed data for each participant, which then allows us to compare the empirical data to the full range of predictions from each model. Aggregated residuals are displayed in [Figure 3](https://tegorman13.github.io/htw/Model/htw_model.html#fig-htw-resid-pred). The pattern of training stage residual errors are unsurprising across the combinations of models and fitting method . Differences in training performance between ALM and EXAM are generally minor (the two models have identical learning mechanisms). The differences in the magnitude of residuals across the three fitting methods are also straightforward, with massive errors for the ‘fit to Test Only’ model, and the smallest errors for the ‘fit to train only’ models. It is also noteworthy that the residual errors are generally larger for the first block of training, which is likely due to the initial values of the ALM weights being unconstrained by whatever initial biases participants tend to bring to the task. Future work may explore the ability of the models to capture more fine grained aspects of the learning trajectories. However for the present purposes, our primary interest is in the ability of ALM and EXAM to account for the testing patterns while being constrained, or not constrained, by the training data. All subsequent analyses and discussion will thus focus on the testing stage.

The residuals of the model predictions for the testing stage ([Figure 3](https://tegorman13.github.io/htw/Model/htw_model.html#fig-htw-resid-pred)) also show an unsurprising pattern across fitting methods - with models fit only to the test data showing the best performance, followed by models fit to both training and test data, and with models fit only to the training data showing the worst performance (note that y axes are scaled different between plots). Although EXAM tends to perform better for both Constant and Varied participants (see also [Figure 5](https://tegorman13.github.io/htw/Model/htw_model.html#fig-ee-e1)), the relative advantage of EXAM is generally larger for the Constant group - a pattern consistent across all three fitting methods. The primary predictive difference between ALM and EXAM is made clear in [Figure 4](https://tegorman13.github.io/htw/Model/htw_model.html#fig-cm-vx-pat), which directly compares the observed data against the posterior predictive distributions for both models. Regardless of how the models are fit, only EXAM can capture the pattern where participants are able to discriminate all 6 target bands.

Code

```
post_dat_l |> 
  group_by(id,condit, Fit_Method,Resp,bandType,x,vb) |> 
 summarize(vx=median(val)) |> 
 #left_join(testAvgE1, by=join_by(id,condit,x==bandInt)) |>
 ggplot(aes(x=Resp,y=vx, fill=vb,col=ifelse(bandType=="Trained","black",NA),size=ifelse(bandType=="Trained","black",NA))) + 
  stat_bar + 
    facet_wrap(~rename_fm(Fit_Method)+condit, ncol=2,strip.position = "top", scales = "free_x") +
        scale_color_manual(values = c("black" = "black"), guide = "none") +
  scale_size_manual(values = c("black" = .5), guide = "none") +
    theme(panel.spacing = unit(0, "lines"), 
         strip.background = element_blank(),
         strip.placement = "outside",
         legend.position = "none",plot.title = element_text(hjust=.50),
         axis.title.x = element_blank(),
         plot.margin = unit(c(10,0,0,0), "pt")) + 
         labs(title="Model Predictions - Experiment 1 Data", y="Vx")
```

[![](md_extract/assets/fig-cm-vx-pat-1.png)](https://tegorman13.github.io/htw/Model/htw_model_files/figure-html/fig-cm-vx-pat-1.png "Figure 4: Empirical data and Model predictions for mean velocity across target bands. Fitting methods (Test Only, Test & Train, Train Only) - are separated across rows, and Training Condition (Constant vs. Varied) are separated by columns. Each facet contains the predictions of ALM and EXAM, alongside the observed data.")

Figure 4: Empirical data and Model predictions for mean velocity across target bands. Fitting methods (Test Only, Test & Train, Train Only) - are separated across rows, and Training Condition (Constant vs. Varied) are separated by columns. Each facet contains the predictions of ALM and EXAM, alongside the observed data.

Code

```
pdl <- post_dat_l |> rename("bandInt"=x) |> left_join(testAvgE1,by=c("id","condit","bandInt")) |> 
  filter(rank<=1,Fit_Method=="Test_Train", !(Resp=="Observed")) |> mutate(aerror = abs(error))

# aerror is model error, which is predicted by Model(ALM vs. EXAM) & condit (Constant vs. Varied)
e1_ee_brm_ae <- brm(data=pdl,
  aerror ~  Model * condit + (1+bandInt|id), 
  file = paste0(here("data/model_cache/e1_ae_modelCond_RFint.rds")),
  chains=4,silent=1, iter=2000, control=list(adapt_delta=0.92, max_treedepth=11))

bct_e1 <- as.data.frame(bayestestR::describe_posterior(e1_ee_brm_ae, centrality = "Mean")) %>%
  select(1,2,4,5,6) %>%
  setNames(c("Term", "Estimate","95% CrI Lower", "95% CrI Upper", "pd")) %>%
  mutate(across(where(is.numeric), \(x) round(x, 2))) %>%
  tibble::remove_rownames() %>%
  mutate(Term = stringr::str_remove(Term, "b_")) #%>% kable(booktabs = TRUE)

#wrap_plots(plot(conditional_effects(e1_ee_brm_ae),points=FALSE,plot=FALSE))

p1 <- plot(conditional_effects(e1_ee_brm_ae, effects="condit"),points=FALSE, plot=FALSE)$condit + 
  ggplot2::xlab("Condition") +ylab("Model Error")
p2 <- plot(conditional_effects(e1_ee_brm_ae, effects="Model"),points=FALSE, plot=FALSE)$Model + 
  labs(x="Model",y=NULL)
p3 <- plot(conditional_effects(e1_ee_brm_ae, effects="Model:condit"),points=FALSE, plot=FALSE)[[ReadItLater]] [[Article]]

# [HTW Project – HTW Modeling](https://tegorman13.github.io/htw/Model/htw_model.html)

Model:condit` + 
  scale_color_manual(values=wes_palette("Darjeeling1")) +
  labs(x="Model",y=NULL,fill=NULL,col=NULL) + theme(legend.position="right") 
  
p_ce_1 <- (p1 + p2+ p3) + plot_annotation(tag_levels = c('A'), tag_suffix=".")

bm1 <- get_coef_details(e1_ee_brm_ae, "conditVaried")
bm2 <- get_coef_details(e1_ee_brm_ae, "ModelEXAM")
bm3 <- get_coef_details(e1_ee_brm_ae, "ModelEXAM:conditVaried")

posterior_estimates <- as.data.frame(e1_ee_brm_ae) %>%
  select(starts_with("b_")) %>%
  setNames(c("Intercept", "ModelEXAM", "conditVaried", "ModelEXAM_conditVaried"))

constant_EXAM <- posterior_estimates$Intercept + posterior_estimates$ModelEXAM
varied_EXAM <- posterior_estimates$Intercept + posterior_estimates$ModelEXAM + posterior_estimates$conditVaried + posterior_estimates$ModelEXAM_conditVaried
comparison_EXAM <- constant_EXAM - varied_EXAM
summary_EXAM <- bayestestR::describe_posterior(comparison_EXAM, centrality = "Mean")

# e1_ee_brm_ae |> emmeans(pairwise ~ Model * condit, re_formula=NULL)
# e1_ee_brm_ae |> emmeans(pairwise ~ Model * condit, re_formula=NA)

# full set of Model x condit contrasts
# ALM - EXAM
btw_model <- e1_ee_brm_ae |> emmeans(pairwise~ Model | condit, re_formula=NULL)  |> 
  pluck("contrasts") |> 
  gather_emmeans_draws() |> 
  group_by(contrast,.draw,condit) |> summarise(value=mean(.value), n=n()) 

# btw_model |> ggplot(aes(x=value,y=contrast,fill=condit)) +stat_halfeye()

# Constant - Varied
emm_condit <- e1_ee_brm_ae |> emmeans(~ condit | Model, re_formula = NULL)
btw_con <- emm_condit |>  pairs() |> gather_emmeans_draws() |> 
  group_by(contrast,.draw, Model) |> summarise(value=mean(.value), n=n()) 
# btw_con |> ggplot(aes(x=value,y=Model,fill=Model)) +stat_halfeye()                              

p_em_1<- e1_ee_brm_ae |> emmeans(pairwise~ Model*condit, re_formula=NA)  |> 
  pluck("contrasts") |>
  gather_emmeans_draws() |> 
  group_by(contrast,.draw) |> summarise(value=mean(.value), n=n()) |> 
  filter(!(contrast %in% c("ALM Constant - EXAM Constant","ALM Constant - EXAM Varied","ALM Varied - EXAM Varied ", "EXAM Constant - ALM Varied" ))) |> 
  ggplot(aes(x=value,y=contrast,fill=contrast)) +stat_halfeye() + labs(x="Model Error Difference",y="Contrast") + theme(legend.position="none") 

p_ce_1 / p_em_1
```

[![](md_extract/assets/fig-ee-e1-1-1.png)](https://tegorman13.github.io/htw/Model/htw_model_files/figure-html/fig-ee-e1-1.png "Figure 5:")

Figure 5

To quantitatively assess whether the differences in performance between models, we fit a bayesian regressions predicting the errors of the posterior predictions of each models as a function of the Model (ALM vs. EXAM) and training condition (Constant vs. Varied).

Model errors were significantly lower for EXAM (\\(\\beta\\) = -37.54, 95% CrI \[-60.4, -14.17\], pd = 99.85%) than ALM. There was also a significant interaction between Model and Condition (\\(\\beta\\) = 60.42, 95% CrI \[36.17, 83.85\], pd = 100%), indicating that the advantage of EXAM over ALM was significantly greater for the constant group. To assess whether EXAM predicts constant performance significantly better for Constant than for Varied subjects, we calculated the difference in model error between the Constant and Varied conditions specifically for EXAM. The results indicated that the model error for EXAM was significantly lower in the Constant condition compared to the Varied condition, with a mean difference of -22.879 (95% CrI \[-46.016, -0.968\], pd = 0.981).

Code

```
post_tabs2 <- abc_tables(e2_model$post_dat,e2_model$post_dat_l)
train_tab2 <- abc_train_tables(e2_model$pd_train,e2_model$pd_train_l)

pdl2 <- e2_model$post_dat_l |> rename("bandInt"=x) |> filter(rank<=1,Fit_Method=="Test_Train", !(Resp=="Observed")) |> mutate(aerror = abs(error))

e2_tab <- rbind(post_tabs2$agg_pred_full |>
 mutate("Task Stage"="Test"), train_tab2$agg_pred_full |> 
 mutate("Task Stage"="Train")) |> 
  mutate(Fit_Method=rename_fm(Fit_Method)) 

post_tabs3 <- abc_tables(e3_model$post_dat,e3_model$post_dat_l)
train_tab3 <- abc_train_tables(e3_model$pd_train,e3_model$pd_train_l)

pdl3 <- e3_model$post_dat_l |> rename("bandInt"=x) |> filter(rank<=1,Fit_Method=="Test_Train", !(Resp=="Observed")) |> mutate(aerror = abs(error))

e3_tab <- rbind(post_tabs3$agg_pred_full |> 
  mutate("Task Stage"="Test"), train_tab3$agg_pred_full |> mutate("Task Stage"="Train")) |> 
  mutate(Fit_Method=rename_fm(Fit_Method)) 

e23_tab <- rbind(e2_tab |> mutate(Exp="E2"), e3_tab |> mutate(Exp="E3")) 
gt_table <- e23_tab %>%
  pivot_wider(
    names_from = c(Exp, Model, condit),
    values_from = mean_error,
    names_glue = "{Exp}_{Model}_{condit}"
  ) %>%
  arrange(Fit_Method, `Task Stage`) %>%
  gt() %>%
  cols_move_to_start(columns = `Task Stage`) %>%
  cols_label(`Task Stage` = "Task Stage") %>%
  fmt_number(columns = matches("E2|E3"), decimals = 1) %>%
  tab_spanner_delim(delim = "_") %>%
  tab_style(
    style = list(
      cell_fill(color = "white"),
      cell_borders(sides = "top", color = "black", weight = px(1))
    ),
    locations = cells_body(columns = everything(), rows = everything())
  ) %>%
  tab_options(
    column_labels.font.size = 10,
    heading.title.font.size = 14,
    heading.subtitle.font.size = 12,
    table.font.size = 10,
    quarto.disable_processing = TRUE
  ) 
gt_table
```

Table 3: Models errors predicting empirical data - aggregated over all participants, posterior parameter values, and velocity bands. Note that Fit Method refers to the subset of the data that the model was trained on, while Task Stage refers to the subset of the data that the model was evaluated on.

|  | E2 |  |  |  | E3 |  |  |  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Task Stage | ALM |  | EXAM |  | ALM |  | EXAM |  |
| Constant | Varied | Constant | Varied | Constant | Varied | Constant | Varied |
| Fit to Test Data |  |  |  |  |  |  |  |  |
| Test | 239.7 | 129.8 | 99.7 | 88.2 | 170.1 | 106.1 | 92.3 | 72.8 |
| Train | 53.1 | 527.1 | 108.1 | 169.3 | 70.9 | 543.5 | 157.8 | 212.7 |
| Fit to Test & Training Data |  |  |  |  |  |  |  |  |
| Test | 266.0 | 208.2 | 125.1 | 126.4 | 197.7 | 189.5 | 130.0 | 128.5 |
| Train | 40.0 | 35.4 | 30.4 | 23.6 | 49.1 | 85.6 | 49.2 | 78.4 |
| Fit to Training Data |  |  |  |  |  |  |  |  |
| Test | 357.4 | 295.9 | 305.1 | 234.5 | 415.0 | 298.8 | 295.5 | 243.7 |
| Train | 42.5 | 23.0 | 43.2 | 22.6 | 51.4 | 63.8 | 51.8 | 65.3 |

Code

```
rbind(e2_model$post_dat_l |> filter( Fit_Method=="Test_Train") |> 
  group_by(id,condit, Fit_Method,Resp,bandType,x,vb) |> 
 summarize(vx=median(val)) |> mutate(Exp="E2",bandOrder="Reverse"), 
 e3_model$post_dat_l |> filter( Fit_Method=="Test_Train") |> 
  group_by(id,condit, Fit_Method,Resp,bandType,x,vb,bandOrder) |>
  summarize(vx=median(val)) |> mutate(Exp="E3")) |>
  ggplot( aes(x=condit,y=vx, fill=vb,col=ifelse(bandType=="Trained","black",NA),size=ifelse(bandType=="Trained","black",NA))) +
  stat_bar + 
    facet_nested_wrap(~Exp+bandOrder+Resp, strip.position = "top", scales = "free_x") +
    scale_color_manual(values = c("black" = "black"), guide = "none") +
  scale_size_manual(values = c("black" = .7), guide = "none") +
    theme(panel.spacing = unit(0, "lines"), 
        #  strip.background = element_blank(),
        #  strip.placement = "outside",
         legend.position = "none",plot.title = element_text(hjust=.50),
         axis.title.x = element_blank(),
         plot.margin = unit(c(20,0,0,0), "pt")) + 
         labs(title="Model Predictions Experiment 2 & 3", y="vx")
```

[![](md_extract/assets/fig-cm-vx-pat-e2-e3-1.png)](https://tegorman13.github.io/htw/Model/htw_model_files/figure-html/fig-cm-vx-pat-e2-e3-1.png "Figure 6: Empirical data and Model predictions from Experiment 2 and 3 for the testing stage. Observed data is shown on the right. Bolded bars indicate bands that were trained, non-bold bars indicate extrapolation bands.")

Figure 6: Empirical data and Model predictions from Experiment 2 and 3 for the testing stage. Observed data is shown on the right. Bolded bars indicate bands that were trained, non-bold bars indicate extrapolation bands.

Code

```
e2_ee_brm_ae <- brm(data=pdl2,
  aerror ~  Model * condit + (1+bandInt|id), 
  file = paste0(here("data/model_cache/e2_ae_modelCond_RFint.rds")),
  chains=4,silent=1, iter=2000, control=list(adapt_delta=0.92, max_treedepth=11))

bm1_e2 <- get_coef_details(e2_ee_brm_ae, "conditVaried")
bm2_e2 <- get_coef_details(e2_ee_brm_ae, "ModelEXAM")
bm3_e2 <- get_coef_details(e2_ee_brm_ae, "ModelEXAM:conditVaried")

bct_e2 <- as.data.frame(bayestestR::describe_posterior(e2_ee_brm_ae, centrality = "Mean")) %>%
  select(1,2,4,5,6) %>%
  setNames(c("Term", "Estimate","95% CrI Lower", "95% CrI Upper", "pd")) %>%
  mutate(across(where(is.numeric), \(x) round(x, 2))) %>%
  tibble::remove_rownames() %>%
  mutate(Term = stringr::str_remove(Term, "b_")) # %>% kable(booktabs = TRUE)

e3_ee_brm_ae <- brm(data=pdl3,
  aerror ~  Model * condit*bandOrder + (1+bandInt|id), 
  file = paste0(here("data/model_cache/e3_ae_modelCondBo_RFint2.rds")),
  chains=4,silent=1, iter=2000, control=list(adapt_delta=0.92, max_treedepth=11))

bm1_e3 <- get_coef_details(e3_ee_brm_ae, "conditVaried")
bm2_e3  <- get_coef_details(e3_ee_brm_ae, "ModelEXAM")
bm3_e3  <- get_coef_details(e3_ee_brm_ae, "ModelEXAM:conditVaried")
bm4_e3  <- get_coef_details(e3_ee_brm_ae, "ModelEXAM:conditVaried:bandOrderReverse")


bct_e3  <- as.data.frame(bayestestR::describe_posterior(e3_ee_brm_ae, centrality = "Mean")) %>%
  select(1,2,4,5,6) %>%
  setNames(c("Term", "Estimate","95% CrI Lower", "95% CrI Upper", "pd")) %>%
  mutate(across(where(is.numeric), \(x) round(x, 2))) %>%
  tibble::remove_rownames() %>%
  mutate(Term = stringr::str_remove(Term, "b_")) #%>% kable(booktabs = TRUE)

bct <- rbind(bct_e1 |> mutate(exp="Exp 1"),bct_e2 |> 
               mutate(exp= "Exp 2"),bct_e3 |> mutate(exp="Exp 3")) |> 
  relocate(exp, .before=Term)

bct_table <- bct %>%
  mutate(
    across(c(Estimate, `95% CrI Lower`, `95% CrI Upper`), ~ round(., 2)),
    pd = round(pd, 2)
  ) %>%
  gt() %>%
  # tab_header(
  #   title = "Bayesian Model Results",
  #   subtitle = "Estimates and Credible Intervals for Each Term Across Experiments"
  # ) %>%
  cols_label(
    exp = "Experiment",
    Term = "Term",
    Estimate = "Estimate",
    `95% CrI Lower` = "95% CrI Lower",
    `95% CrI Upper` = "95% CrI Upper",
    pd = "pd"
  ) %>%
  fmt_number(
    columns = c(Estimate, `95% CrI Lower`, `95% CrI Upper`),
    decimals = 2
  ) %>%
  fmt_number(
    columns = pd,
    decimals = 2
  ) %>%
  tab_spanner(
    label = "Credible Interval",
    columns = c(`95% CrI Lower`, `95% CrI Upper`)
  ) %>%
  tab_style(
    style = list(
      #cell_fill(color = "lightgray"),
      cell_text(weight = "bold"), 
      cell_fill(color = "white"),
      cell_borders(sides = "top", color = "black", weight = px(1))
    ),
    locations = cells_body(
      columns = c(Estimate, pd),
      rows = Term=="ModelEXAM:conditVaried"
    )
  ) %>%
   tab_row_group(
    label = "Experiment 3",
    rows = exp == "Exp 3"
  ) %>%
  tab_row_group(
    label = "Experiment 2",
    rows = exp == "Exp 2"
  ) %>%
  tab_row_group(
    label = "Experiment 1",
    rows = exp == "Exp 1"
  ) %>%
  tab_options(
    table.font.size = 10,
    heading.title.font.size = 16,
    heading.subtitle.font.size = 14,
    quarto.disable_processing = TRUE
    #row_group.background.color = "gray95"
  )
bct_table
```

Table 4: Results of Bayesian Regression models predicting model error as a function of Model (ALM vs. EXAM), Condition (Constant vs. Varied), and the interaction between Model and Condition. The values represent the estimate coefficient for each term, with 95% credible intervals in brackets. The intercept reflects the baseline of ALM and Constant. The other estimates indicate deviations from the baseline for the EXAM mode and varied condition. Lower values indicate better model fit.

| Experiment | Term | Estimate | Credible Interval |  | pd |
| --- | --- | --- | --- | --- | --- |
| 95% CrI Lower | 95% CrI Upper |
| Experiment 1 |  |  |  |  |  |
| Exp 1 | Intercept | 176.30 | 156.86 | 194.59 | 1.00 |
| Exp 1 | ModelEXAM | −88.44 | −104.51 | −71.81 | 1.00 |
| Exp 1 | conditVaried | −37.54 | −60.40 | −14.17 | 1.00 |
| Exp 1 | ModelEXAM:conditVaried | 60.42 | 36.17 | 83.85 | 1.00 |
| Experiment 2 |  |  |  |  |  |
| Exp 2 | Intercept | 245.87 | 226.18 | 264.52 | 1.00 |
| Exp 2 | ModelEXAM | −137.73 | −160.20 | −115.48 | 1.00 |
| Exp 2 | conditVaried | −86.39 | −113.52 | −59.31 | 1.00 |
| Exp 2 | ModelEXAM:conditVaried | 56.87 | 25.26 | 88.04 | 1.00 |
| Experiment 3 |  |  |  |  |  |
| Exp 3 | Intercept | 164.83 | 140.05 | 189.44 | 1.00 |
| Exp 3 | ModelEXAM | −65.66 | −85.97 | −46.02 | 1.00 |
| Exp 3 | conditVaried | −40.61 | −75.90 | −3.02 | 0.98 |
| Exp 3 | bandOrderReverse | 25.47 | −9.34 | 58.68 | 0.93 |
| Exp 3 | ModelEXAM:conditVaried | 41.90 | 11.20 | 72.54 | 0.99 |
| Exp 3 | ModelEXAM:bandOrderReverse | −7.32 | −34.53 | 21.05 | 0.70 |
| Exp 3 | conditVaried:bandOrderReverse | 30.82 | −19.57 | 83.56 | 0.88 |
| Exp 3 | ModelEXAM:conditVaried:bandOrderReverse | −60.60 | −101.80 | −18.66 | 1.00 |

*Model Fits to Experiment 2 and 3.* Data from Experiments 2 and 3 were fit to ALM and EXAM in the same manner as Experiment1 . For brevity, we only plot and discuss the results of the “fit to training and testing data” models - results from the other fitting methods can be found in the appendix. The model fitting results for Experiments 2 and 3 closely mirrored those observed in Experiment 1. The Bayesian regression models predicting model error as a function of Model (ALM vs. EXAM), Condition (Constant vs. Varied), and their interaction (see [Table 4](https://tegorman13.github.io/htw/Model/htw_model.html#tbl-htw-ee-e23)) revealed a consistent main effect of Model across all three experiments. The negative coefficients for the ModelEXAM term (Exp 2: \\(\\beta\\) = -86.39, 95% CrI -113.52, -59.31, pd = 100%; Exp 3: \\(\\beta\\) = -40.61, 95% CrI -75.9, -3.02, pd = 98.17%) indicate that EXAM outperformed ALM in both experiments. Furthermore, the interaction between Model and Condition was significant in both Experiment 2 (\\(\\beta\\) = 56.87, 95% CrI 25.26, 88.04, pd = 99.98%) and Experiment 3 (\\(\\beta\\) = 41.9, 95% CrI 11.2, 72.54, pd = 99.35%), suggesting that the superiority of EXAM over ALM was more pronounced for the Constant group compared to the Varied group, as was the case in Experiment 1. Recall that Experiment 3 included participants in both the original and reverse order conditions - and that this manipulation interacted with the effect of training condition. We thus also controleld for band order in our Bayesian Regression assessing the relative performance of EXAM and ALM in Experiment 3. There was a significant three way interaction between Model, Training Condition, and Band Order (\\(\\beta\\) = -60.6, 95% CrI -101.8, -18.66, pd = 99.83%), indicating that the relative advantage of EXAM over ALM was only more pronounced in the original order condition, and not the reverse order condition (see [Figure 7](https://tegorman13.github.io/htw/Model/htw_model.html#fig-e2_e3_ae)).

Code

```
#wrap_plots(plot(conditional_effects(e1_ee_brm_ae),points=FALSE,plot=FALSE))
p1 <- plot(conditional_effects(e2_ee_brm_ae, effects="condit"),points=FALSE, plot=FALSE)$condit + 
  ggplot2::xlab("Condition") +ylab("Model Error") + labs(title="E2. Model Error")
p2 <- plot(conditional_effects(e2_ee_brm_ae, effects="Model"),points=FALSE, plot=FALSE)$Model + 
  labs(x="Model",y=NULL)
p3 <- plot(conditional_effects(e2_ee_brm_ae, effects="Model:condit"),points=FALSE, plot=FALSE)[[ReadItLater]] [[Article]]

# [HTW Project – HTW Modeling](https://tegorman13.github.io/htw/Model/htw_model.html)

Model:condit` + 
  scale_color_manual(values=wes_palette("Darjeeling1")) +
  labs(x="Model",y=NULL,fill=NULL,col=NULL) + theme(legend.position="right") 
  
 p_e2 <- (p1 + p2+ p3) 
#wrap_plots(plot(conditional_effects(e3_ee_brm_ae),points=FALSE,plot=FALSE))

p_e3 <- plot(conditional_effects(e3_ee_brm_ae, 
                         effects = "Model:condit", 
                         conditions=make_conditions(e3_ee_brm_ae,vars=c("bandOrder"))),
     points=FALSE,plot=FALSE)[[ReadItLater]] [[Article]]

# [HTW Project – HTW Modeling](https://tegorman13.github.io/htw/Model/htw_model.html)

Model:condit` + 
     labs(x="Model",y="Model Error", title="E3. Model Error", fill=NULL, col=NULL) + 
     theme(legend.position="right") + 
     scale_color_manual(values=wes_palette("Darjeeling1")) 

# p1 <- plot(conditional_effects(e3_ee_brm_ae, effects="condit"),points=FALSE, plot=FALSE)$condit + 
#   ggplot2::xlab("Condition") +ylab("Model Error")
# p2 <- plot(conditional_effects(e3_ee_brm_ae, effects="Model"),points=FALSE, plot=FALSE)$Model + 
#   labs(x="Model",y=NULL)
# p3 <- plot(conditional_effects(e3_ee_brm_ae, effects="Model:condit"),points=FALSE, plot=FALSE)[[ReadItLater]] [[Article]]

# [HTW Project – HTW Modeling](https://tegorman13.github.io/htw/Model/htw_model.html)

Model:condit` + 
#   scale_color_manual(values=wes_palette("Darjeeling1")) +
#   labs(x="Model",y=NULL,fill=NULL,col=NULL) + theme(legend.position="right") 
  
 #p2 <- (p1 + p2+ p3)
 (p_e2 / p_e3) + plot_annotation(tag_levels = c('A'), tag_suffix=".")
```

[![](md_extract/assets/fig-e2_e3_ae-1.png)](https://tegorman13.github.io/htw/Model/htw_model_files/figure-html/fig-e2_e3_ae-1.png "Figure 7: Conditional effects of Model (ALM vs EXAM) and Condition (Constant vs. Varied) on Model Error for Experiment 2 and 3 data. Experiment 3 also includes a control for the order of training vs. testing bands (original order vs. reverse order).")

Figure 7: Conditional effects of Model (ALM vs EXAM) and Condition (Constant vs. Varied) on Model Error for Experiment 2 and 3 data. Experiment 3 also includes a control for the order of training vs. testing bands (original order vs. reverse order).

*Computational Model Summary*. Across the model fits to all three experiments, we found greater support for EXAM over ALM (negative coefficients on the ModelEXAM term in [Table 4](https://tegorman13.github.io/htw/Model/htw_model.html#tbl-htw-ee-e23)), and moreover that the constant participants were disproportionately well described by EXAM in comparison to ALM (positive coefficients on ModelEXAM:conditVaried terms in [Table 4](https://tegorman13.github.io/htw/Model/htw_model.html#tbl-htw-ee-e23)). This pattern is also clearly depicted in [Figure 8](https://tegorman13.github.io/htw/Model/htw_model.html#fig-htw-best-model), which plots the difference in model errors between ALM and EXAM for each individual participant. Both varied and constant conditions have a greater proportion of subjects better fit by EXAM (positive error differences), with the magnitude of EXAM’s advantage visibly greater for the constant group. It also bears mention that numerous participants were better fit by ALM, or did not show a clear preference for either model. A subset of these participants are shown in [Figure 9](https://tegorman13.github.io/htw/Model/htw_model.html#fig-htw-indv-pred).

Code

```
tid1 <- post_dat  |> mutate(Exp="E1",bandOrder="Original") |> select(-pred_dist, -dist) |>
  rbind(e2_model$post_dat |> mutate(Exp="E2",bandOrder="Reverse")) |>
  rbind(e3_model$post_dat |> mutate(Exp="E3")) |>
  filter(Fit_Method=="Test_Train") |>
  group_by(id,condit,Model,Fit_Method,x, Exp) |> 
    mutate(e2=abs(y-pred)) |> 
    summarise(y1=median(y), pred1=median(pred),mean_error=abs(y1-pred1)) |>
    group_by(id,condit,Model,Fit_Method,Exp) |> 
    summarise(mean_error=mean(mean_error)) |> 
    arrange(id,condit,Fit_Method) |>
    round_tibble(1) 

best_id <- tid1 |> 
  group_by(id,condit,Fit_Method) |> 
  mutate(best=ifelse(mean_error==min(mean_error),1,0)) 

lowest_error_model <- best_id %>%
  group_by(id, condit,Fit_Method, Exp) %>%
  summarise(Best_Model = Model[which.min(mean_error)],
            Lowest_error = min(mean_error),
            differential = min(mean_error) - max(mean_error)) %>%
  ungroup()

error_difference<- best_id %>%
  select(id, condit, Model,Fit_Method, mean_error) %>%
  pivot_wider(names_from = Model, values_from = c(mean_error)) %>%
  mutate(Error_difference = (ALM - EXAM))

full_comparison <- lowest_error_model |> 
  left_join(error_difference, by=c("id","condit","Fit_Method"))  |> 
  group_by(condit,Fit_Method,Best_Model) |> 
  mutate(nGrp=n(), model_rank = nGrp - rank(Error_difference) ) |> 
  arrange(Fit_Method,-Error_difference)

full_comparison |> 
  filter(Fit_Method=="Test_Train") |> 
  ungroup() |>
  mutate(id = reorder(id, Error_difference)) %>%
  ggplot(aes(y=id,x=Error_difference,fill=Best_Model))+
  geom_col() +
  #ggh4x::facet_grid2(~condit,axes="all",scales="free_y", independent = "y")+
  ggh4x::facet_nested_wrap(~condit+Exp,scales="free") + 
  theme(axis.text.y = element_text(size=8)) +
  labs(fill="Best Model",
  x="Mean Model Error Difference (ALM - EXAM)",
  y="Participant")
```

[![](md_extract/assets/fig-htw-best-model-1-4.png)](https://tegorman13.github.io/htw/Model/htw_model_files/figure-html/fig-htw-best-model-1.png "Figure 8: Difference in model errors for each participant, with models fit to both train and test data. Positive values favor EXAM, while negative values favor ALM.")

Figure 8: Difference in model errors for each participant, with models fit to both train and test data. Positive values favor EXAM, while negative values favor ALM.

Code

```
cId_tr <- c(137, 181, 11)
vId_tr <- c(14, 193, 47)
cId_tt <- c(11, 93, 35)
vId_tt <- c(1,14,74)
cId_new <- c(175, 68, 93, 74)
# filter(id %in% (filter(bestTestEXAM,group_rank<=9, Fit_Method=="Test")

e1_sbjs <- c(49,68,155, 175,74)
e3_sbjs <-  c(245, 280, 249)
e2_sbjs <- c(197, 157, 312, 334)
cFinal <- c(49, 128,202 )
vFinal <- c(68,70,245)


indv_post_l <- post_dat_l  |> mutate(Exp="E1",bandOrder="Original") |> select(-signed_dist) |>
  rbind(e2_model$post_dat_l |> mutate(Exp="E2",bandOrder="Reverse")) |>
  rbind(e3_model$post_dat_l |> mutate(Exp="E3") |> select(-fb)) |>
  filter(Fit_Method=="Test_Train", id %in% c(cFinal,vFinal))

testIndv <- indv_post_l |> 
#filter(id %in% c(cId_tt,vId_tt,cId_new), Fit_Method=="Test_Train") |> 
   mutate(x=as.factor(x), Resp=as.factor(Resp)) |>
  group_by(id,condit,Fit_Method,Model,Resp) |>
   mutate(flab=paste0("Subject: ",id)) |>
  ggplot(aes(x = Resp, y = val, fill=vb, col=ifelse(bandType=="Trained","black",NA),size=ifelse(bandType=="Trained","black",NA))) + 
  stat_bar_sd + 
  ggh4x::facet_nested_wrap(condit~flab, axes = "all",ncol=3) +
  scale_color_manual(values = c("black" = "black"), guide = FALSE) +
  scale_size_manual(values = c("black" = .5), guide = FALSE) + 
  labs(title="Individual Participant fits from Test & Train Fitting Method",
       y="X Velocity",fill="Target Velocity") +
   guides(fill = guide_legend(nrow = 1)) + 
  theme(legend.position = "bottom",axis.title.x = element_blank())

testIndv 
``` 

[![](md_extract/assets/fig-htw-indv-pred-1-3.png)](https://tegorman13.github.io/htw/Model/htw_model_files/figure-html/fig-htw-indv-pred-1.png "Figure 9: Model predictions alongside observed data for a subset of individual participants. A) 3 constant and 3 varied participants fit to both the test and training data. B) 3 constant and 3 varied subjects fit to only the trainign data. Bolded bars indicate bands that were trained, non-bold bars indicate extrapolation bands.")

Figure 9: Model predictions alongside observed data for a subset of individual participants. A) 3 constant and 3 varied participants fit to both the test and training data. B) 3 constant and 3 varied subjects fit to only the trainign data. Bolded bars indicate bands that were trained, non-bold bars indicate extrapolation bands.

## References

Bengtsson, H. (2021). A Unifying Framework for Parallel and Distributed Processing in R using Futures. *The R Journal*, *13*(2), 208. [https://doi.org/10.32614/RJ-2021-048](https://doi.org/10.32614/RJ-2021-048)

Brown, M. A., & Lacroix, G. (2017). Underestimation in linear function learning: Anchoring to zero or x-y similarity? *Canadian Journal of Experimental Psychology/Revue Canadienne de Psychologie Expérimentale*, *71*(4), 274–282. [https://doi.org/10.1037/cep0000129](https://doi.org/10.1037/cep0000129)

Cranmer, K., Brehmer, J., & Louppe, G. (2020). The frontier of simulation-based inference. *Proceedings of the National Academy of Sciences*, *117*(48), 30055–30062. [https://doi.org/10.1073/pnas.1912789117](https://doi.org/10.1073/pnas.1912789117)

Farrell, S., & Lewandowsky, S. (2018). *Computational Modeling of Cognition and Behavior:* (1st ed.). Cambridge University Press. [https://doi.org/10.1017/CBO9781316272503](https://doi.org/10.1017/CBO9781316272503)

Kangasrääsiö, A., Jokinen, J. P. P., Oulasvirta, A., Howes, A., & Kaski, S. (2019). Parameter Inference for Computational Cognitive Models with Approximate Bayesian Computation. *Cognitive Science*, *43*(6), e12738. [https://doi.org/10.1111/cogs.12738](https://doi.org/10.1111/cogs.12738)

Kruschke, J. K. (1992). ALCOVE: An exemplar-based connectionist model of Category Learning. *Psychological Review*, *99*(1). [https://doi.org/10.1037/0033-295X.99.1.22](https://doi.org/10.1037/0033-295X.99.1.22)

Kwantes, P. J., & Neal, A. (2006). Why people underestimate y when extrapolating in linear functions. *Journal of Experimental Psychology: Learning, Memory, and Cognition*, *32*(5), 1019–1030. [https://doi.org/10.1037/0278-7393.32.5.1019](https://doi.org/10.1037/0278-7393.32.5.1019)

Mcdaniel, M. A., Dimperio, E., Griego, J. A., & Busemeyer, J. R. (2009). Predicting transfer performance: A comparison of competing function learning models. *Journal of Experimental Psychology. Learning, Memory, and Cognition*, *35*, 173–195. [https://doi.org/10.1037/a0013982](https://doi.org/10.1037/a0013982)

Page, M. (2000). Connectionist modelling in psychology: A localist manifesto. *Behavioral and Brain Sciences*, *23*(4), 443–467. [https://doi.org/10.1017/S0140525X00003356](https://doi.org/10.1017/S0140525X00003356)

Turner, B. M., Sederberg, P. B., & McClelland, J. L. (2016). Bayesian analysis of simulation-based models. *Journal of Mathematical Psychology*, *72*, 191–199. [https://doi.org/10.1016/j.jmp.2014.10.001](https://doi.org/10.1016/j.jmp.2014.10.001)

Turner, B. M., & Van Zandt, T. (2012). A tutorial on approximate Bayesian computation. *Journal of Mathematical Psychology*, *56*(2), 69–85. [https://doi.org/10.1016/j.jmp.2012.02.005](https://doi.org/10.1016/j.jmp.2012.02.005)