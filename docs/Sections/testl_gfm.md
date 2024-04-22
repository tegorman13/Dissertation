# test_types
Thomas Gorman

- [Appendix](#appendix)
- [References](#references)

<details class="code-fold">
<summary>Code</summary>

``` r
pacman::p_load(dplyr,purrr,tidyr,tibble,ggplot2,
  brms,tidybayes, rstanarm,emmeans,broom,bayestestR,
  stringr, here,conflicted, patchwork, knitr,gt)

out_type <- knitr::opts_knit$get("rmarkdown.pandoc.to")
print(out_type)
```

</details>

    [1] "commonmark"

<details class="code-fold">
<summary>Code</summary>

``` r
primary=out_type == "html" || out_type == "pdf" || out_type =="latex"

fmt_out <- knitr::pandoc_to()
print(fmt_out)
```

</details>

    [1] "commonmark"

<details class="code-fold">
<summary>Code</summary>

``` r
out_type %in% c("html","pdf")
```

</details>

    [1] FALSE

<details class="code-fold">
<summary>Code</summary>

``` r
# out_type = "html"
out_type == "html" || out_type == "pdf" || out_type == "docx"
```

</details>

    [1] FALSE

| Sepal.Length | Sepal.Width | Petal.Length | Petal.Width | Species    |
|-------------:|------------:|-------------:|------------:|:-----------|
|          5.1 |         3.5 |          1.4 |         0.2 | setosa     |
|          4.9 |         3.0 |          1.4 |         0.2 | setosa     |
|          4.7 |         3.2 |          1.3 |         0.2 | setosa     |
|          4.6 |         3.1 |          1.5 |         0.2 | setosa     |
|          5.0 |         3.6 |          1.4 |         0.2 | setosa     |
|          5.4 |         3.9 |          1.7 |         0.4 | setosa     |
|          4.6 |         3.4 |          1.4 |         0.3 | setosa     |
|          5.0 |         3.4 |          1.5 |         0.2 | setosa     |
|          4.4 |         2.9 |          1.4 |         0.2 | setosa     |
|          4.9 |         3.1 |          1.5 |         0.1 | setosa     |
|          5.4 |         3.7 |          1.5 |         0.2 | setosa     |
|          4.8 |         3.4 |          1.6 |         0.2 | setosa     |
|          4.8 |         3.0 |          1.4 |         0.1 | setosa     |
|          4.3 |         3.0 |          1.1 |         0.1 | setosa     |
|          5.8 |         4.0 |          1.2 |         0.2 | setosa     |
|          5.7 |         4.4 |          1.5 |         0.4 | setosa     |
|          5.4 |         3.9 |          1.3 |         0.4 | setosa     |
|          5.1 |         3.5 |          1.4 |         0.3 | setosa     |
|          5.7 |         3.8 |          1.7 |         0.3 | setosa     |
|          5.1 |         3.8 |          1.5 |         0.3 | setosa     |
|          5.4 |         3.4 |          1.7 |         0.2 | setosa     |
|          5.1 |         3.7 |          1.5 |         0.4 | setosa     |
|          4.6 |         3.6 |          1.0 |         0.2 | setosa     |
|          5.1 |         3.3 |          1.7 |         0.5 | setosa     |
|          4.8 |         3.4 |          1.9 |         0.2 | setosa     |
|          5.0 |         3.0 |          1.6 |         0.2 | setosa     |
|          5.0 |         3.4 |          1.6 |         0.4 | setosa     |
|          5.2 |         3.5 |          1.5 |         0.2 | setosa     |
|          5.2 |         3.4 |          1.4 |         0.2 | setosa     |
|          4.7 |         3.2 |          1.6 |         0.2 | setosa     |
|          4.8 |         3.1 |          1.6 |         0.2 | setosa     |
|          5.4 |         3.4 |          1.5 |         0.4 | setosa     |
|          5.2 |         4.1 |          1.5 |         0.1 | setosa     |
|          5.5 |         4.2 |          1.4 |         0.2 | setosa     |
|          4.9 |         3.1 |          1.5 |         0.2 | setosa     |
|          5.0 |         3.2 |          1.2 |         0.2 | setosa     |
|          5.5 |         3.5 |          1.3 |         0.2 | setosa     |
|          4.9 |         3.6 |          1.4 |         0.1 | setosa     |
|          4.4 |         3.0 |          1.3 |         0.2 | setosa     |
|          5.1 |         3.4 |          1.5 |         0.2 | setosa     |
|          5.0 |         3.5 |          1.3 |         0.3 | setosa     |
|          4.5 |         2.3 |          1.3 |         0.3 | setosa     |
|          4.4 |         3.2 |          1.3 |         0.2 | setosa     |
|          5.0 |         3.5 |          1.6 |         0.6 | setosa     |
|          5.1 |         3.8 |          1.9 |         0.4 | setosa     |
|          4.8 |         3.0 |          1.4 |         0.3 | setosa     |
|          5.1 |         3.8 |          1.6 |         0.2 | setosa     |
|          4.6 |         3.2 |          1.4 |         0.2 | setosa     |
|          5.3 |         3.7 |          1.5 |         0.2 | setosa     |
|          5.0 |         3.3 |          1.4 |         0.2 | setosa     |
|          7.0 |         3.2 |          4.7 |         1.4 | versicolor |
|          6.4 |         3.2 |          4.5 |         1.5 | versicolor |
|          6.9 |         3.1 |          4.9 |         1.5 | versicolor |
|          5.5 |         2.3 |          4.0 |         1.3 | versicolor |
|          6.5 |         2.8 |          4.6 |         1.5 | versicolor |
|          5.7 |         2.8 |          4.5 |         1.3 | versicolor |
|          6.3 |         3.3 |          4.7 |         1.6 | versicolor |
|          4.9 |         2.4 |          3.3 |         1.0 | versicolor |
|          6.6 |         2.9 |          4.6 |         1.3 | versicolor |
|          5.2 |         2.7 |          3.9 |         1.4 | versicolor |
|          5.0 |         2.0 |          3.5 |         1.0 | versicolor |
|          5.9 |         3.0 |          4.2 |         1.5 | versicolor |
|          6.0 |         2.2 |          4.0 |         1.0 | versicolor |
|          6.1 |         2.9 |          4.7 |         1.4 | versicolor |
|          5.6 |         2.9 |          3.6 |         1.3 | versicolor |
|          6.7 |         3.1 |          4.4 |         1.4 | versicolor |
|          5.6 |         3.0 |          4.5 |         1.5 | versicolor |
|          5.8 |         2.7 |          4.1 |         1.0 | versicolor |
|          6.2 |         2.2 |          4.5 |         1.5 | versicolor |
|          5.6 |         2.5 |          3.9 |         1.1 | versicolor |
|          5.9 |         3.2 |          4.8 |         1.8 | versicolor |
|          6.1 |         2.8 |          4.0 |         1.3 | versicolor |
|          6.3 |         2.5 |          4.9 |         1.5 | versicolor |
|          6.1 |         2.8 |          4.7 |         1.2 | versicolor |
|          6.4 |         2.9 |          4.3 |         1.3 | versicolor |
|          6.6 |         3.0 |          4.4 |         1.4 | versicolor |
|          6.8 |         2.8 |          4.8 |         1.4 | versicolor |
|          6.7 |         3.0 |          5.0 |         1.7 | versicolor |
|          6.0 |         2.9 |          4.5 |         1.5 | versicolor |
|          5.7 |         2.6 |          3.5 |         1.0 | versicolor |
|          5.5 |         2.4 |          3.8 |         1.1 | versicolor |
|          5.5 |         2.4 |          3.7 |         1.0 | versicolor |
|          5.8 |         2.7 |          3.9 |         1.2 | versicolor |
|          6.0 |         2.7 |          5.1 |         1.6 | versicolor |
|          5.4 |         3.0 |          4.5 |         1.5 | versicolor |
|          6.0 |         3.4 |          4.5 |         1.6 | versicolor |
|          6.7 |         3.1 |          4.7 |         1.5 | versicolor |
|          6.3 |         2.3 |          4.4 |         1.3 | versicolor |
|          5.6 |         3.0 |          4.1 |         1.3 | versicolor |
|          5.5 |         2.5 |          4.0 |         1.3 | versicolor |
|          5.5 |         2.6 |          4.4 |         1.2 | versicolor |
|          6.1 |         3.0 |          4.6 |         1.4 | versicolor |
|          5.8 |         2.6 |          4.0 |         1.2 | versicolor |
|          5.0 |         2.3 |          3.3 |         1.0 | versicolor |
|          5.6 |         2.7 |          4.2 |         1.3 | versicolor |
|          5.7 |         3.0 |          4.2 |         1.2 | versicolor |
|          5.7 |         2.9 |          4.2 |         1.3 | versicolor |
|          6.2 |         2.9 |          4.3 |         1.3 | versicolor |
|          5.1 |         2.5 |          3.0 |         1.1 | versicolor |
|          5.7 |         2.8 |          4.1 |         1.3 | versicolor |
|          6.3 |         3.3 |          6.0 |         2.5 | virginica  |
|          5.8 |         2.7 |          5.1 |         1.9 | virginica  |
|          7.1 |         3.0 |          5.9 |         2.1 | virginica  |
|          6.3 |         2.9 |          5.6 |         1.8 | virginica  |
|          6.5 |         3.0 |          5.8 |         2.2 | virginica  |
|          7.6 |         3.0 |          6.6 |         2.1 | virginica  |
|          4.9 |         2.5 |          4.5 |         1.7 | virginica  |
|          7.3 |         2.9 |          6.3 |         1.8 | virginica  |
|          6.7 |         2.5 |          5.8 |         1.8 | virginica  |
|          7.2 |         3.6 |          6.1 |         2.5 | virginica  |
|          6.5 |         3.2 |          5.1 |         2.0 | virginica  |
|          6.4 |         2.7 |          5.3 |         1.9 | virginica  |
|          6.8 |         3.0 |          5.5 |         2.1 | virginica  |
|          5.7 |         2.5 |          5.0 |         2.0 | virginica  |
|          5.8 |         2.8 |          5.1 |         2.4 | virginica  |
|          6.4 |         3.2 |          5.3 |         2.3 | virginica  |
|          6.5 |         3.0 |          5.5 |         1.8 | virginica  |
|          7.7 |         3.8 |          6.7 |         2.2 | virginica  |
|          7.7 |         2.6 |          6.9 |         2.3 | virginica  |
|          6.0 |         2.2 |          5.0 |         1.5 | virginica  |
|          6.9 |         3.2 |          5.7 |         2.3 | virginica  |
|          5.6 |         2.8 |          4.9 |         2.0 | virginica  |
|          7.7 |         2.8 |          6.7 |         2.0 | virginica  |
|          6.3 |         2.7 |          4.9 |         1.8 | virginica  |
|          6.7 |         3.3 |          5.7 |         2.1 | virginica  |
|          7.2 |         3.2 |          6.0 |         1.8 | virginica  |
|          6.2 |         2.8 |          4.8 |         1.8 | virginica  |
|          6.1 |         3.0 |          4.9 |         1.8 | virginica  |
|          6.4 |         2.8 |          5.6 |         2.1 | virginica  |
|          7.2 |         3.0 |          5.8 |         1.6 | virginica  |
|          7.4 |         2.8 |          6.1 |         1.9 | virginica  |
|          7.9 |         3.8 |          6.4 |         2.0 | virginica  |
|          6.4 |         2.8 |          5.6 |         2.2 | virginica  |
|          6.3 |         2.8 |          5.1 |         1.5 | virginica  |
|          6.1 |         2.6 |          5.6 |         1.4 | virginica  |
|          7.7 |         3.0 |          6.1 |         2.3 | virginica  |
|          6.3 |         3.4 |          5.6 |         2.4 | virginica  |
|          6.4 |         3.1 |          5.5 |         1.8 | virginica  |
|          6.0 |         3.0 |          4.8 |         1.8 | virginica  |
|          6.9 |         3.1 |          5.4 |         2.1 | virginica  |
|          6.7 |         3.1 |          5.6 |         2.4 | virginica  |
|          6.9 |         3.1 |          5.1 |         2.3 | virginica  |
|          5.8 |         2.7 |          5.1 |         1.9 | virginica  |
|          6.8 |         3.2 |          5.9 |         2.3 | virginica  |
|          6.7 |         3.3 |          5.7 |         2.5 | virginica  |
|          6.7 |         3.0 |          5.2 |         2.3 | virginica  |
|          6.3 |         2.5 |          5.0 |         1.9 | virginica  |
|          6.5 |         3.0 |          5.2 |         2.0 | virginica  |
|          6.2 |         3.4 |          5.4 |         2.3 | virginica  |
|          5.9 |         3.0 |          5.1 |         1.8 | virginica  |

See <a href="#tbl-alm-exam" class="quarto-xref">Table 1</a> for a full
specification of the equations that define ALM and EXAM, and
**?@fig-alm-diagram** for a visual representation of the ALM model.

<div class="column-page-inset-right">

|                    | **ALM Response Generation**                                        |                                                                                                                   |
|--------------------|--------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| Input Activation   | $a_i(X) = \frac{e^{-c(X-X_i)^2}}{\sum_{k=1}^M e^{-c(X-X_k)^2}}$    | Input nodes activate as a function of Gaussian similarity to stimulus                                             |
| Output Activation  | $O_j(X) = \sum_{k=1}^M w_{ji} \cdot a_i(X)$                        | Output unit $O_j$ activation is the weighted sum of input activations and association weights                     |
| Output Probability | $P[Y_j|X] = \frac{O_j(X)}{\sum_{k=1}^M O_k(X)}$                    | The response, $Y_j$ probabilites computed via Luce’s choice rule                                                  |
| Mean Output        | $m(X) = \sum_{j=1}^L Y_j \cdot \frac{O_j(x)}{\sum_{k=1}^M O_k(X)}$ | Weighted average of probabilities determines response to X                                                        |
|                    | **ALM Learning**                                                   |                                                                                                                   |
| Feedback           | $f_j(Z) = e^{-c(Z-Y_j)^2}$                                         | feedback signal Z computed as similarity between ideal response and observed response                             |
| magnitude of error | $\Delta_{ji}=(f_{j}(Z)-o_{j}(X))a_{i}(X)$                          | Delta rule to update weights.                                                                                     |
| Update Weights     | $w_{ji}^{new}=w_{ji}+\eta\Delta_{ji}$                              | Updates scaled by learning rate parameter $\eta$.                                                                 |
|                    | **EXAM Extrapolation**                                             |                                                                                                                   |
| Instance Retrieval | $P[X_i|X] = \frac{a_i(X)}{\sum_{k=1}^M a_k(X)}$                    | Novel test stimulus $X$ activates input nodes $X_i$                                                               |
| Slope Computation  | $S =$ $\frac{m(X_{1})-m(X_{2})}{X_{1}-X_{2}}$                      | Slope value, $S$ computed from nearest training instances                                                         |
| Response           | $E[Y|X_i] = m(X_i) + S \cdot [X - X_i]$                            | Final EXAM response is the ALM response for the nearest training stimulus, $m(X_i)$, adjusted by local slope $S$. |

</div>

> [!NONE]
>
> ** Approximate Bayesian Computation**
>
> To estimate the parameters of ALM and EXAM, we used approximate
> Bayesian computation (ABC), enabling us to obtain an estimate of the
> posterior distribution of the generalization and learning rate
> parameters for each individual. ABC belongs to the class of
> simulation-based inference methods (Cranmer et al., 2020), which have
> begun being used for parameter estimation in cognitive modeling
> relatively recently (Kangasrääsiö et al., 2019; Turner et al., 2016;
> Turner & Van Zandt, 2012). Although they can be applied to any model
> from which data can be simulated, ABC methods are most useful for
> complex models that lack an explicit likelihood function (e.g., many
> neural network models).
>
> The general ABC procedure is to 1) define a prior distribution over
> model parameters. 2) sample candidate parameter values, $\theta^*$,
> from the prior. 3) Use $\theta^*$ to generate a simulated dataset,
> $Data_{sim}$. 4) Compute a measure of discrepancy between the
> simulated and observed datasets, $discrep$($Data_{sim}$,
> $Data_{obs}$). 5) Accept $\theta^*$ if the discrepancy is less than
> the tolerance threshold, $\epsilon$, otherwise reject $\theta^*$. 6)
> Repeat until desired number of posterior samples are obtained.
>
> Although simple in the abstract, implementations of ABC require
> researchers to make a number of non-trivial decisions as to i) the
> discrepancy function between observed and simulated data, ii) whether
> to compute the discrepancy between trial level data, or a summary
> statistic of the datasets, iii) the value of the minimum tolerance
> $\epsilon$ between simulated and observed data. For the present work,
> we follow the guidelines from previously published ABC tutorials
> (Farrell & Lewandowsky, 2018; Turner & Van Zandt, 2012). For the test
> stage, we summarized datasets with mean velocity of each band in the
> observed dataset as $V_{obs}^{(k)}$ and in the simulated dataset as
> $V_{sim}^{(k)}$, where $k$ represents each of the six velocity bands.
> For computing the discrepancy between datasets in the training stage,
> we aggregated training trials into three equally sized blocks
> (separately for each velocity band in the case of the varied group).
> After obtaining the summary statistics of the simulated and observed
> datasets, the discrepancy was computed as the mean of the absolute
> difference between simulated and observed datasets
> (<a href="#eq-discrep-test" class="quarto-xref">Equation 1</a> and
> <a href="#eq-discrep-train" class="quarto-xref">Equation 2</a>). For
> the models fit to both training and testing data, discrepancies were
> computed for both stages, and then averaged together.
>
> <div class="column-page-inset-left">
>
> <span id="eq-discrep-test">$$
> discrep_{Test}(Data_{sim}, Data_{obs}) = \frac{1}{6} \sum_{k=1}^{6} |V_{obs}^{(k)} - V_{sim}^{(k)}|
>  \qquad(1)$$</span>
>
> <span id="eq-discrep-train">$$
> \begin{aligned} \\
> discrep_{Train,constant}(Data_{sim}, Data_{obs}) = \frac{1}{N_{blocks}} \sum_{j=1}^{N_{blocks}} |V_{obs,constant}^{(j)} - V_{sim,constant}^{(j)}| \\ \\
> discrep_{Train,varied}(Data_{sim}, Data_{obs}) = \frac{1}{N_{blocks} \times 3} \sum_{j=1}^{N_{blocks}} \sum_{k=1}^{3} |V_{obs,varied}^{(j,k)} - V_{sim,varied}^{(j,k)}|
> \end{aligned}
>  \qquad(2)$$</span>
>
> </div>
>
> The final component of our ABC implementation is the determination of
> an appropriate value of $\epsilon$. The setting of $\epsilon$ exerts
> strong influence on the approximated posterior distribution. Smaller
> values of $\epsilon$ increase the rejection rate, and improve the
> fidelity of the approximated posterior, while larger values result in
> an ABC sampler that simply reproduces the prior distribution. Because
> the individual participants in our dataset differed substantially in
> terms of the noisiness of their data, we employed an adaptive
> tolerance setting strategy to tailor $\epsilon$ to each individual.
> The initial value of $\epsilon$ was set to the overall standard
> deviation of each individuals velocity values. Thus, sampled parameter
> values that generated simulated data within a standard deviation of
> the observed data were accepted, while worse performing parameters
> were rejected. After every 300 samples the tolerance was allowed to
> increase only if the current acceptance rate of the algorithm was less
> than 1%. In such cases, the tolerance was shifted towards the average
> discrepancy of the 5 best samples obtained thus far. To ensure the
> acceptance rate did not become overly permissive, $\epsilon$ was also
> allowed to decrease every time a sample was accepted into the
> posterior.

# Appendix

[Apppendix](Appendix/Full_Appendix.qmd) available at
tegorman13.github.io/Dissertation/Sections/Appendix.html

# References

<div id="refs" class="references csl-bib-body hanging-indent"
entry-spacing="0" line-spacing="2">

<div id="ref-cranmerFrontierSimulationbasedInference2020"
class="csl-entry">

Cranmer, K., Brehmer, J., & Louppe, G. (2020). The frontier of
simulation-based inference. *Proceedings of the National Academy of
Sciences*, *117*(48), 30055–30062.
<https://doi.org/10.1073/pnas.1912789117>

</div>

<div id="ref-farrellComputationalModelingCognition2018"
class="csl-entry">

Farrell, S., & Lewandowsky, S. (2018). *Computational Modeling of
Cognition and Behavior:* (1st ed.). Cambridge University Press.
<https://doi.org/10.1017/CBO9781316272503>

</div>

<div id="ref-kangasraasioParameterInferenceComputational2019"
class="csl-entry">

Kangasrääsiö, A., Jokinen, J. P. P., Oulasvirta, A., Howes, A., & Kaski,
S. (2019). Parameter Inference for Computational Cognitive Models with
Approximate Bayesian Computation. *Cognitive Science*, *43*(6), e12738.
<https://doi.org/10.1111/cogs.12738>

</div>

<div id="ref-turnerBayesianAnalysisSimulationbased2016"
class="csl-entry">

Turner, B. M., Sederberg, P. B., & McClelland, J. L. (2016). Bayesian
analysis of simulation-based models. *Journal of Mathematical
Psychology*, *72*, 191–199. <https://doi.org/10.1016/j.jmp.2014.10.001>

</div>

<div id="ref-turnerTutorialApproximateBayesian2012" class="csl-entry">

Turner, B. M., & Van Zandt, T. (2012). A tutorial on approximate
Bayesian computation. *Journal of Mathematical Psychology*, *56*(2),
69–85. <https://doi.org/10.1016/j.jmp.2012.02.005>

</div>

</div>
