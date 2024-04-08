---
title: General Discussion
date: today
format:
  html: default
  hugo-md:
    html-math-method: mathjax
    output-file: dissc_hugo.md
    mermaid-format: png
  gfm:
    output-file: dissc_gfm.md
    mermaid-format: png
---


To facilitate ease of comparison between the two projects and their respective tasks, we'll now refer to project 1 as Hit The Target (HTT) and project 2 as Hit The Wall (HTW).

### Empirical and Modeling Summary

Across both projects, we investigated the influence of training variability on learning and generalization in computerized visuomotor skill learning, and function learning tasks. In project 1 (HTT), experiments 1 and 2 demonstrated that varied training led to superior testing performance compared to constant training. In Experiment 1, the varied group even outperformed the constant group even when testing from the constant groups trained position. In contrast, Project 2 (HTW) found the opposite pattern - the varied training groups exhibited poorer performance than the constant groups, both in terms of training accuracy, accuracy in extrapolation testing, and, in a subset of the experiments, the varied group showed a diminished ability to discriminate between bands. This detrimental effect of variability was observed across three experiments, with the exception of the reverse order condition in Experiment 3, where the varied group was able to match the constant group's performance.

Both projects also included computational modeling componenents. In Project 1, the IGAS model was introduced as a means of addressing the lack of control for similarity between training and testing conditions common to previous work in the "benefits of variability" literature. The IGAS model provides a theoretically motivated method of quantifying the similarity between training experience and testing conditions. The resulting similarity metric (i.e. our 1c-similarity) is shown to be a significant predictor of testing performance on its own, and when added as a covariate to the statistical model used to compare the constant and varied training groups. We then showed the group-level effect of training variability on testing performance can be accounted for with the additional assumption that training variability influences the generalization gradient. The contribution of the IGAS model was thus twofold:  1) providing a theoretically justifiable method of quantifying/controlling for similarity between training and testing, and 2) demonstrating the viability of a flexible-similarity based generalization account for the empirically observed benefit of variability in our task. Although similar approaches have been employed in other domains, both contributions are novel additions to the large body of research assessing the effect of constant vs. varied training manipulations in visuomotor skill tasks.

Although theoretically motivated, the IGAS model of Project 1 is best categorized as a descriptive measurement-model. Sufficient to account for group differences, but lacking the machinery necessary to provide a full process-level account of how the empirical quantities of interest are generated. In contrast, Project 2 (HTW) implemented a more robust computational modeling approach, implementing and comparing full process models (ALM & EXAM), capable of generating predictions for both the learning and testing stages of the experiment. ALM and EXAM have been used as models of function learning, cue judgement, and forecasting behavior in numerous studies over the past 25 years (Brown & Lacroix, 2017; DeLosh et al., 1997; Kane & Broomell, 2020; Kelley & Busemeyer, 2008; Kwantes et al., 2012; Mcdaniel et al., 2009; Von Helversen & Rieskamp, 2010). The present work presents the first application of these models to to the study of training variability in a visuomotor function learning task. We fit both models to individual participant data, using a form of simulation-based bayesian parameter estimation that allowed us to generate and compare the full posterior predictive distributions of each model. EXAM provided the best overall account of the testing data, and the advantage of EXAM over ALM was significantly greater for the constant group. Notably, EXAM captured the constant groups' ability to extrapolate linearly to novel velocity bands, despite receiving training from only a single input-output pair. This finding suggests that EXAM's linear extrapolation mechanism, combined with the assumption of prior knowledge about the origin point (0, 0), was sufficient to account for the constant groups' accurate extrapolation performance. Such findings may offer a preliminary suggestion that experience with a more variable set of training examples may be detrimental to performance in simple extrapolation tasks.

### Differences between the two Projects

The HTT and HTW tasks differ across numerous dimensions that may be relevant to the opposing patterns observed in the two projects (see <a href="#tbl-task-diff" class="quarto-xref">Table 1</a> provides for a detailed comparison of the two tasks).

In HTT, the salient perceptual elements of the task (i.e. the launching box, target and barrier) are subject to variation (i.e. different distances between the launching box and target), and the spatial layout of these perceptually variable elements are intrinsically linked to the task objective of striking the target. Conversely, the perceptual task elements in HTW are invariant across trials, and the task objective is specified by the target velocity value specified as a numeral at the top of the screen. If the benefits of training variation do arise from the formation and flexible retrieval of distinct memory traces, then the lack of perceptual salience between training instances in the HTW task may have limited any potential benefits of variability. Future work could investigate this possibility further employing a modified version of the HTW task wherein the correct velocity value is indicated by some perceptual feature of the task (e.g. the color of the wall, or size of the ball), rather than displaying the target velocity numerically.

The HTT and HTW tasks also differed in terms of general task complexity. The HTT task was designed to mimic projectile launching tasks commonly employed in visuomotor learning studies, and the parabolic trajectories necessary to strike the target in HTT were sensitive to both the x and y dimensions of the projectiles velocity (and to a lesser extent, the position within the launching box at which the ball was released). Conversely the HTW task was influenced to a greater extent by the tasks commonly utilized in the function learning literature, wherein the correct output respones are determined by a single input dimension. In HTW,the relationship between feedback and optimal behavioral adjustment is also almost perfectly smooth, if participants produce a throw that is 100 units too hard, they'll be told that they were 100 units away from the target band. Whereas in HTT, the presence of the barrier in introduces irregularities in the task space. Even throws close to the solution space might result in failure, creating a less predictable learning environment.

<div id="tbl-task-diff">

| Dimension                                | HTT (Project 1)                                                                                                                               | HTW (Project 2)                                                                                                |
|------------|----------------------------------|---------------------------|
| Task Description                         | Projectile launching to hit a target                                                                                                          | Projectile launching to hit wall at a specific velocity                                                        |
| Task Complexity                          | More complex parabolic trajectory, both x and y velocities relevant to outcome                                                                | Simpler 1D mapping of force to outcome. Only x velocity is relevant.                                           |
| Task Space                               | More complex: xy velocity combinations closer to the solution space may still result in worse feedback due to striking the barrier.           | Simpler: smooth, linear mapping between velocity and feedback.                                                 |
| Perceptual salience of Varied Conditions | Varied conditions (# of throwing distances) are perceptually distinct, i.e. salient differences in distance between launching box and target. | Varied conditions (# of velocity bands) are less salient - only difference is the numeral displayed on screen. |
| Testing Feedback                         | Testing always included feedback                                                                                                              | Primary testing stage had no feedback.                                                                         |
| Potential for Learning during Testing    | Limited potential for learning during testing due to feedback.                                                                                | Some potential for learning during no-feedback testing by observing ball trajectory.                           |
| Position/Velocity Experience             | Varied group gets half as much experience on any one position as the constant group.                                                          | Varied group gets 1/3 as much experience on any one velocity band as the constant group.                       |
| Testing Structure                        | Random interleaving of trained/transfer testing distances.                                                                                    | Blocked structure, separately testing trained vs extrapolation testing bands.                                  |

Table 1: Comparison of the tasks in Project 1 (HTT) and Project 2 (HTW).
</div>

### Conclusion

In summary, this dissertation provides a comprehensive examination of the effects of training variability on learning and generalization in visuomotor and function learning tasks. The contrasting results obtained from the Hit The Target (HTT) and Hit The Wall (HTW) tasks underscore the complexity inherent to the longstanding pedagogical and scientific goal of identifying training manipulations that consistently benefit learning and generalization. Moreover, through the development and application of computational models, we provide novel theoretical accounts for both the beneficial and detrimental effects of training variability observed in our experiments. These findings highlight the importance of considering task characteristics when designing experiments intended to assess the influence of training interventions, and demonstrate the value of combining empirical and computational modeling approaches to uncover the cognitive mechanisms that support learning and generalization. Future research should continue to investigate the complex interplay between task demands, training manipulations, and individual differences, with the ultimate goal of optimizing educational and training outcomes across a wide range of domains.

    

### test

Brown, M. A., & Lacroix, G. (2017). Underestimation in linear function learning: Anchoring to zero or x-y similarity? *Canadian Journal of Experimental Psychology/Revue Canadienne de Psychologie Expérimentale*, *71*(4), 274--282. <https://doi.org/10.1037/cep0000129>

DeLosh, E. L., McDaniel, M. A., & Busemeyer, J. R. (1997). Extrapolation: The Sine Qua Non for Abstraction in Function Learning. *Journal of Experimental Psychology: Learning, Memory, and Cognition*, *23*(4), 19. <https://doi.org/10.1037/0278-7393.23.4.968>

Kane, P. B., & Broomell, S. B. (2020). Applications of the biasvariance decomposition to human forecasting. *Journal of Mathematical Psychology*, *98*, 102417. <https://doi.org/10.1016/j.jmp.2020.102417>

Kelley, H., & Busemeyer, J. (2008). A comparison of models for learning how to dynamically integrate multiple cues in order to forecast continuous criteria. *Journal of Mathematical Psychology*, *52*(4), 218--240. <https://doi.org/10.1016/j.jmp.2008.01.009>

Kwantes, P. J., Neal, A., & Kalish, M. (2012). Item order matters in a function learning task. *Canadian Journal of Experimental Psychology/Revue Canadienne de Psychologie Expérimentale*, *66*(2), 90--97. <https://doi.org/10.1037/a0026639>

Mcdaniel, M. A., Dimperio, E., Griego, J. A., & Busemeyer, J. R. (2009). Predicting transfer performance: A comparison of competing function learning models. *Journal of Experimental Psychology. Learning, Memory, and Cognition*, *35*, 173--195. <https://doi.org/10.1037/a0013982>

Von Helversen, B., & Rieskamp, J. (2010). *Learning in multiple-cue judgment tasks*. <https://doi.org/10.5167/UZH-135898>