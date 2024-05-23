# The Role of Variability in Learning Generalization: A Computational
Modeling Approach
Thomas Gorman

## Introduction

- Investigate effects of training variability on learning and
  generalization
- Focus areas: visuomotor skill learning and function learning tasks

------------------------------------------------------------------------

## Background and Motivation

- Importance of training variability
- Research gaps in visuomotor skill learning
- Previous research in category learning, language learning, and
  function learning

------------------------------------------------------------------------

## Common Empirical Patterns

<div class="columns">

<div class="column" width="60%">

### Training

- Both training conditions complete the same number of training trials
- Varied group has worse training performance.

![](assets/train_pattern.png)

</div>

<div class="column" width="40%">

<div class="fragment">

### Testing

- Tested from novel conditions
- Varied group has better test performance

![](assets/test_pattern.png)

</div>

</div>

</div>

------------------------------------------------------------------------

## Theoretical Frameworks

- Schema Theory (Schmidt, 1975)
- Desirable Difficulties Framework (Bjork & Bjork, 2011)
- Challenge Point Framework (Guadagnoli & Lee, 2004)

![](assets/fig-toy-model1-1-1.png)

------------------------------------------------------------------------

## Overview of Current Work

- Project 1: Visuomotor projectile launching task
- Project 2: Visuomotor extrapolation task

------------------------------------------------------------------------

## Project 1 - Hit The Target (HTT)

- Influence of varied practice in a projectile launching task
- Experiments 1 & 2:
  - Constant vs. varied training groups
  - Performance metrics and transfer testing

------------------------------------------------------------------------

## Project 1 - Methodology

- Task description and experimental design
- Participants and procedures
- IGAS model introduction

![](assets/methodsFig1.png)

------------------------------------------------------------------------

## Project 1 - Results and Discussion

- Varied training group’s superior performance
- Computational modeling results with IGAS
- Theoretical implications

------------------------------------------------------------------------

## Computational Model

**Equation 1:**
$$ Similarity_{I,J} = \sum_{i=I}\sum_{j=J} (e^{-c^\cdot d^{p}_{i,j}}) $$

**Equation 2:**
$$ d_{i,j} = \sqrt{(x_{Train_i}-x_{Solution_j})^2 + (y_{Train_i}-y_{Solution_j})^2 } $$

------------------------------------------------------------------------

## Project 2 - Hit The Wall (HTW)

- Influence of varied practice in a function learning task
- Experiments 1, 2, and 3:
  - Training regimes and testing conditions
  - Learning, discrimination, and extrapolation performance metrics

------------------------------------------------------------------------

## Project 2 - Methodology

- Task description and experimental design
- Participants and procedures
- Application of ALM and EXAM models

------------------------------------------------------------------------

## Project 2 - Results and Discussion

- Training variability’s mixed results
- Modeling analysis with ALM and EXAM
- Theoretical implications

------------------------------------------------------------------------

## Project 2 - ALM

![](assets/fig-alm-diagram-1-1.png)

------------------------------------------------------------------------

## General Discussion

- Compare HTT and HTW
- Empirical findings summary
- Computational modeling contributions

------------------------------------------------------------------------

## Comparison

| Dimension | HTT (Project 1) | HTW (Project 2) |
|----|----|----|
| Task Description | Projectile launching to hit a target | Projectile launching to hit wall at a specific velocity |
| Task Complexity | More complex parabolic trajectory, both x and y velocities relevant to outcome | Simpler 1D mapping of force to outcome. Only x velocity is relevant. |
| Task Space | More complex: xy velocity combinations closer to the solution space may still result in worse feedback due to striking the barrier. | Simpler: smooth, linear mapping between velocity and feedback. |
| Perceptual salience of Varied Conditions | Varied conditions (# of throwing distances) are perceptually distinct, i.e. salient differences in distance between launching box and target. | Varied conditions (# of velocity bands) are less salient - only difference is the numeral displayed on screen. |
| Testing Feedback | Testing always included feedback | Primary testing stage had no feedback. |
| Potential for Learning during Testing | Limited potential for learning during testing due to feedback. | Some potential for learning during no-feedback testing by observing ball trajectory. |
| Training Experience | Varied group gets half as much experience on any one position as the constant group. | Varied group gets 1/3 as much experience on any one velocity band as the constant group. |
| Testing Structure | Random interleaving of trained/transfer testing distances. | Blocked structure, separately testing trained vs extrapolation testing bands. |

------------------------------------------------------------------------

## Theoretical Contributions

- Insights into training variability effects on learning and
  generalization
- Computational models applications

------------------------------------------------------------------------

## Practical Implications

- Training programs design implications
- Future research considerations

------------------------------------------------------------------------

## Limitations and Future Directions

- Study limitations
- Future research suggestions

------------------------------------------------------------------------

## Conclusion

- Recap of key findings
- Final thoughts on training variability’s role in learning

------------------------------------------------------------------------

## Questions and Discussion

- Open floor for questions from the committee and audience

<!-- create slide with 2 columns and add text -->

## Future Research Directions

<div class="columns">

<div class="column" width="50%">

<div class="fragment">

### Theoretical Extensions

- Investigate the role of individual differences in training variability
  effects.
- Explore the impact of different types of feedback on learning and
  generalization.
- Examine the influence of task complexity on the benefits of varied
  training.

</div>

<div class="fragment">

### Methodological Innovations

- Develop new experimental paradigms to test training variability in
  more complex tasks.
- Utilize advanced computational models to simulate learning processes
  under varied conditions.
- Implement longitudinal studies to assess long-term effects of training
  variability.

</div>

</div>

<div class="column" width="50%">

<div class="fragment">

### Practical Applications

- Design adaptive training programs that adjust variability based on
  learner performance.
- Apply findings to educational settings to enhance learning outcomes.
- Use insights to improve training protocols in professional skill
  development.

</div>

<div class="fragment">

### Collaborative Opportunities

- Partner with educational institutions to test training variability in
  classroom settings.
- Collaborate with industry professionals to apply research findings in
  real-world training programs.
- Engage with interdisciplinary teams to explore the broader
  implications of training variability.

</div>

</div>

</div>

------------------------------------------------------------------------
