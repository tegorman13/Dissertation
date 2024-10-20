#  The Role of Variability in Learning Transfer: A Similarity-Based Computational Approach


# Abstract

This dissertation seeks to explore the cognitive underpinnings that govern the generalization of learning, focusing specifically on the role of variability during training in shaping subsequent transfer performance. A comprehensive review of the existing literature is presented, emphasizing the methodological complications associated with disentangling the confounding effects of similarity. Through a series of experiments involving several novel visuomotor tasks, this work investigates whether and how variability in training conditions affects performance in novel tasks. To theoretically account for the empirical outcomes, I employ both instance-based and connectionist computational models, both of which incorporate similarity-based mechanisms. These models serve to account for the extent to which variability influences the learners' generalization gradient, and also explain how training variation can produce both beneficial and deleterious outcomes.

# Literature Review

# Variability and Generalization

The factors that influence the generalization of learning are of considerable interest to both researchers exploring the human learning system and practitioners aiming to enhance the effectiveness of educational and training interventions. The present effort will focus specifically on the role of variability in the learning input. Variability manipulations typically regulate either the number of distinct instances presented to learners during training, or the dispersion of these instances. Such manipulations have been empirically demonstrated to affect subsequent generalization performance. This essay will offer an in-depth review of the extant literature on the influence of variability, spanning multiple relevant domains.

# Project 1

## Abstract

Exposing learners to variability during training has been demonstrated
to improve performance in subsequent transfer testing. Such variability
benefits are often accounted for by assuming that learners are
developing some general task schema or structure. However much of this
research has neglected to account for differences in similarity between
varied and constant training conditions. In a between-groups
manipulation, we trained participants on a simple projectile launching
task, with either varied or constant conditions. We replicate previous
findings showing a transfer advantage of varied over constant training.
Furthermore, we show that a standard similarity model is insufficient to
account for the benefits of variation, but, if the model is adjusted to
assume that varied learners are tuned towards a broader generalization
gradient, then a similarity-based model is sufficient to explain the
observed benefits of variation. Our results therefore suggest that some
variability benefits can be accommodated within instance-based models
without positing the learning of some schemata or structure.

## Introduction

The past century of research on human learning has produced ample
evidence that although learners can improve at almost any task, such
improvements are often specific to the trained task, with unreliable or
even nonexistent transfer to novel tasks or conditions
(Barnett & Ceci, 2002; Detterman, 1993). Such
transfer challenges are of noteworthy practical relevance, given that
educators, trainers, and rehabilitators typically intend for their
students to be able to apply what they have learned to new situations.
It is therefore important to better understand the factors that
influence transfer, and to develop cognitive models that can predict
when transfer is likely to occur. The factor of interest to the present
investigation is variation during training. Our experiments add to the
longstanding empirical investigation of the controversial relationship
between training variation, and subsequent transfer. We also offer a
novel explanation for such results in the form of an instance-based
model that accounts for the benefits of variation in simple terms of
psychological similarity. We first review the relevant concepts and
literature.

### Similarity and instance-based approaches to transfer of learning

Notions of similarity have long played a central role in many prominent
models of generalization of learning, as well as in the longstanding
theoretical issue of whether learners abstract an aggregate, summary
representation, or if they simply store individual instances. Early
models of learning often assumed that discrete experiences with some
task or category were not stored individually in memory, but instead
promoted the formation of a summary representation, often referred to as
a prototype or schema, and that exposure to novel examples would then
prompt the retrieval of whichever preexisting prototype was most similar
(Posner & Keele, 1968). Prototype
models were later challenged by the success of instance-based or
exemplar models -- which were shown to provide an account of
generalization as good or better than prototype models, with the
advantage of not assuming the explicit construction of an internal
prototype (Estes, 1994; Hintzman, 1984; Medin & Schaffer, 1978; Nosofsky, 1986 ).
Instance-based models assume that learners encode each experience with a
task as a separate instance/exemplar/trace, and that each encoded trace
is in turn compared against novel stimuli. As the number of stored
instances increases, so does the likelihood that some previously stored
instance will be retrieved to aid in the performance of a novel task.
Stored instances are retrieved in the context of novel stimuli or tasks
if they are sufficiently similar, thus suggesting that the process of
computing similarity is of central importance to generalization.

Similarity, defined in this literature as a function of psychological
distance between instances or categories, has provided a successful
account of generalization across numerous tasks and domains. In an
influential study demonstrating an ordinal similarity effect,
experimenters employed a numerosity judgment task in which participants
quickly report the number of dots flashed on a screen. Performance (in
terms of response times to new patterns) on novel dot configurations
varied as an inverse function of their similarity to previously trained
dot configurations Palmeri (1997). That is, performance was better on
novel configurations moderately similar to trained configurations than
to configurations with low-similarity, and also better on low-similarity
configurations than to even less similar, unrelated configurations.
Instance-based approaches have had some success accounting for
performance in certain sub-domains of motor learning (R. G. Cohen & Rosenbaum, 2004; Crump & Logan, 2010, 2010; Meigh et al., 2018; Poldrack et al., 1999; Wifall et al., 2017) trained participants to type words on an unfamiliar keyboard, while constraining the letters composing the training words to a pre-specified letter set. Following
training, typing speed was tested on previously experienced words
composed of previously experienced letters; novel words composed of
letters from the trained letter set; and novel words composed of letters
from an untrained letter set. Consistent with an instance-based account,
transfer performance was graded such that participants were fastest at
typing the words they had previously trained on, followed by novel words
composed of letters they had trained on, and slowest performance for new
words composed of untrained letters.

## The effect of training variability on transfer

While similarity-based models account for transfer by the degree of
similarity between previous and new experiences, a largely separate body
of research has focused on improving transfer by manipulating
characteristics of the initial training stage. Such characteristics have
included training difficulty, spacing, temporal order, feedback
schedules, and the primary focus of the current work -- variability of
training examples.

Research on the effects of varied training typically compares
participants trained under constant, or minimal variability conditions
to those trained from a variety of examples or conditions (Czyż, 2021; Soderstrom & Bjork, 2015). Varied training has been shown to influence
learning in myriad domains including categorization of simple stimuli (Hahn et al., 2005; Maddox & Filoteo, 2011; Posner & Keele, 1968),
complex categorization (Nosofsky, Sanders, Zhu, et al., 2018), language learning (Jones & Brandt, 2020; Perry et al., 2010; Twomey et al., 2018; Wonnacott et al., 2012), anagram completion (Goode et al., 2008), trajectory
extrapolation (Fulvio et al., 2014), task switching (Sabah et al., 2019), associative learning (J. C. Lee et al., 2019), visual search (George & Egner, 2021; Gonzalez & Madhavan, 2011; Kelley & Yantis, 2009), voice
identity learning (Lavan et al., 2019), simple motor learning (Braun et al., 2009; Kerr & Booth, 1978; Roller et al., 2001; Willey & Liu, 2018a),
sports training North et al. (2019), and training
on a complex video game (Seow et al., 2019).

Training variation has received a particularly large amount of attention
within the domain of visuomotor skill learning. Much of this research
has been influenced by the work of Schmidt (1975), who proposed a
schema-based account of motor learning as an attempt to address the
longstanding problem of how novel movements are produced. According to
Schema Theory, learners possess general motor programs for classes of
movements (e.g. throwing a ball with an underhand movement), as well as
schema rules that determine how a motor program is parameterized or
scaled for a particular movement. Schema theory predicts that varied
training results in the formation of a more general schema-rule, which
can allow for transfer to novel movements within a given movement class.
Experiments that test this hypothesis are often designed to compare the
transfer performance of a constant-trained group against that of a
varied-trained group. Both groups train on the same task, but the varied
group practices from multiple levels of a task-relevant dimension that
remains invariant for the constant group. For example, investigators
might train two groups of participants to throw a projectile at a
target, with a constant group that throws from a single location, and a
varied group that throws from multiple locations. Both groups are then
tested from novel locations. Empirically observed benefits of the
varied-trained group are then attributed to the variation they received
during training, a finding observed in numerous studies (Catalano & Kleiner, 1984; Chua et al., 2019; Goodwin et al., 1998; Kerr & Booth, 1978; Wulf, 1991), and the benefits of this variation are typically
thought to be mediated by the development of a more general schema for
the throwing motion.

Of course, the relationship between training variability and transfer is
unlikely to be a simple function wherein increased variation is always
beneficial. Numerous studies have found null, or in some cases negative
effects of training variation (DeLosh et al., 1997; Sinkeviciute et al., 2019; Wrisberg et al., 1987), and many more have suggested that the
benefits of variability may depend on additional factors such as prior
task experience, the order of training trials, or the type of transfer
being measured (Berniker et al., 2014; Braithwaite & Goldstone, 2015; Hahn et al., 2005; Lavan et al., 2019; North et al., 2019; Sadakata & McQueen, 2014; Zaman et al., 2021).

### Issues with Previous Research

Although the benefits of training variation in visuomotor skill learning
have been observed many times, null findings have also been repeatedly
found, leading some researchers to question the veracity of the
variability of practice hypothesis (Newell, 2003; Van Rossum, 1990).
Critics have also pointed out that investigations of the effects of
training variability, of the sort described above, often fail to control
for the effect of similarity between training and testing conditions.
For training tasks in which participants have numerous degrees of
freedom (e.g. projectile throwing tasks where participants control the x
and y velocity of the projectile), varied groups are likely to
experience a wider range of the task space over the course of their
training (e.g. more unique combinations of x and y velocities).
Experimenters may attempt to account for this possibility by ensuring
that the training location(s) of the varied and constant groups are an
equal distance away from the eventual transfer locations, such that
their training throws are, on average, equally similar to throws that
would lead to good performance at the transfer locations. However, even
this level of experimental control may still be insufficient to rule out
the effect of similarity on transfer. Given that psychological
similarity is typically best described as either a Gaussian or
exponentially decaying function of psychological distance (Ennis et al., 1988; Ghahramani et al., 1996; Logan, 1988; Nosofsky, 1992; Shepard, 1987; Thoroughman & Taylor, 2005 ), it is plausible that a subset of the
most similar training instances could have a disproportionate impact on
generalization to transfer conditions, even if the average distance
between training and transfer conditions is identical between groups.
<a href="#fig-toy-model1" class="quarto-xref">Figure 1</a> demonstrates the consequences of a generalization gradient that
drops off as a Gaussian function of distance from training, as compared
to a linear drop-off.




In addition to largely overlooking the potential for non-linear
generalization to confound interpretations of training manipulations,
the visuomotor skill learning literature also rarely considers
alternatives to schema representations (Chamberlin & Magill, 1992b).
Although schema-theory remains influential within certain literatures,
instance or exemplar-based models have accounted for human behavior
across myriad domains (Jamieson et al., 2022; Logan, 2002). As mentioned above, instance based accounts have been shown to perform well on a
variety of different tasks with motoric components (Crump & Logan, 2010; Gandolfo et al., 1996; Meigh et al., 2018; Rosenbaum et al., 1995; van Dam & Ernst, 2015). However, such accounts have received little
attention within the subdomain of visuomotor skill learning focused on
the benefits of varied training.

The present work examines whether the commonly observed benefits of
varied training can be accounted for by between-group differences in
similarity between training and testing throws. We first attempt to
replicate previous work finding an advantage of varied training over
constant training in a projectile launching task. We then examine the
extent to which this advantage can be explained by an instance-based
similarity model.

## Experiment 1

### Methods

#### Sample Size Estimation

To obtain an independent estimate of effect size, we identified previous
investigations which included between-subjects contrasts of varied and
constant conditions following training on an accuracy based projectile
launching task (Chua et al., 2019; Goodwin et al., 1998; Kerr & Booth, 1978; Wulf, 1991). We then averaged effects across these studies,
yielding a Cohens f =.43. The GPower 3.1 software package (Faul et al., 2009),
2009) was then used to determine that a power of 80% requires a sample
size of at least 23 participants per condition. All experiments reported
in the present manuscript exceed this minimum number of participants per
condition.

#### Participants

Participants were recruited from an undergraduate population that is 63%
female and consists almost entirely of individuals aged 18-22 years. A
total of 110 Indiana University psychology students participated in
Experiment 1. We subsequently excluded 34 participants poor performance
at one of the dependent measures of the task (2.5-3 standard deviations
worse than the median subject at the task) or for displaying a pattern
of responses that was clearly indicative of a lack of engagement with
the task (e.g. simply dropping the ball on each trial rather than
throwing it at the target), or for reporting that they completed the
experiment on a phone or tablet device, despite the instructions not to
use one of these devices. A total of 74 participants were retained for
the final analyses, 35 in the varied group and 39 in the constant group.

#### Task

The experimental task was programmed in JavaScript, using packages from
the Phaser physics engine (https://phaser.io) and the jsPsych library
(de Leeuw, 2015). The stimuli, presented on a black background,
consisted of a circular blue ball -- controlled by the participant via
the mouse or trackpad cursor; a rectangular green target; a red
rectangular barrier located between the ball and the target; and an
orange square within which the participant could control the ball before
releasing it in a throw towards the target. Because the task was
administered online, the absolute distance between stimuli could vary
depending on the size of the computer monitor being used, but the
relative distance between the stimuli was held constant. Likewise, the
distance between the center of the target, and the training and testing
locations was scaled such that relative distances were preserved
regardless of screen size. For the sake of brevity, subsequent mentions
of this relative distance between stimuli, or the position where the
ball landed in relation to the center of the target, will be referred to
simply as distance. <a href="#fig-igasTask" class="quarto-xref">Figure 2</a> displays the layout of the task, as
it would appear to a participant at the start of a trial, with the ball
appearing in the center of the orange square. Using a mouse or trackpad,
participants click down on the ball to take control of the ball,
connecting the movement of the ball to the movement of the cursor.
Participants can then "wind up" the ball by dragging it (within the
confines of the orange square) and then launch the ball by releasing the
cursor. If the ball does not land on the target, participants are
presented with feedback in red text at the top right of the screen, on
how many units away they were from the center of the target. If the ball
was thrown outside of the boundary of the screen participants are given
feedback as to how far away from the target center the ball would have
been if it had continued its trajectory. If the ball strikes the barrier
(from the side or by landing on top), feedback is presented telling
participants to avoid hitting the barrier. If participants drag the ball
outside of the orange square before releasing it, the trial terminates,
and they are reminded to release the ball within the orange square. If
the ball lands on the target, feedback is presented in green text,
confirming that the target was hit, and presenting additional feedback
on how many units away the ball was from the exact center of the target.

<a href="https://pcl.sitehost.iu.edu/tg/demos/igas_expt1_demo.html" target="_blank">Link to abbrevaited example of
task</a>.

![](Assets/methodsFig1.png)

### Results

#### Data Processing and Statistical Packages

To prepare the data, we first removed trials that were not easily
interpretable as performance indicators in our task. Removed trials
included: 1) those in which participants dragged the ball outside of the
orange starting box without releasing it, 2) trials in which
participants clicked on the ball, and then immediately released it,
causing the ball to drop straight down, 3) outlier trials in which the
ball was thrown more than 2.5 standard deviations further than the
average throw (calculated separately for each throwing position), and 4)
trials in which the ball struck the barrier. The primary measure of
performance used in all analyses was the absolute distance away from the
center of the target. The absolute distance was calculated on every
trial, and then averaged within each subject to yield a single
performance score, for each position. A consistent pattern across
training and testing phases in both experiments was for participants to
perform worse from throwing positions further away from the target -- a
pattern which we refer to as the difficulty of the positions. However,
there were no interactions between throwing position and training
conditions, allowing us to collapse across positions in cases where
contrasts for specific positions were not of interest. All data
processing and statistical analyses were performed in R version 4.03 (R
Core Team, 2020). ANOVAs for group comparisons were performed using the
rstatix package (Kassambara, 2021)\*\*\*\*.

#### Training Phase

<a href="#fig-IGAS-Training1" class="quarto-xref">Figure 3</a> below shows aggregate training performance binned into three
stages representing the beginning, middle, and end of the training
phase. Because the two conditions trained from target distances that
were not equally difficult, it was not possible to directly compare
performance between conditions in the training phase. Our focus for the
training data analysis was instead to establish that participants did
improve their performance over the course of training, and to examine
whether there was any interaction between training stage and condition.
Descriptive statistics for the intermittent testing phase are provided
in the supplementary materials.

We performed an ANOVA comparison with stage as a within-group factor and
condition as between-group factor. The analysis revealed a significant
effect of training stage F(2,142)=62.4, p\<.001, $\eta^{2}_G$ = .17,
such that performance improved over the course of training There was no
significant effect of condition F(1,71)=1.42, p=.24, $\eta^{2}_G$ = .02,
and no significant interaction between condition and training stage,
F(2,142)=.10, p=.91, $\eta^{2}_G$ \< .01.

### Testing Phase

In Experiment 1, a single constant-trained group was compared against a
single varied-trained group. At the transfer phase, all participants
were tested from 3 positions: 1) the positions(s) from their own
training, 2) the training position(s) of the other group, and 3) a
position novel to both groups. Overall, group performance was compared
with a mixed type III ANOVA, with condition (varied vs. constant) as a
between-subject factor and throwing location as a within-subject
variable. The effect of throwing position was strong, F(3,213) = 56.12,
p\<.001, η2G = .23. The effect of training condition was significant
F(1,71)=8.19, p\<.01, η2G = .07. There was no significant interaction
between group and position, F(3,213)=1.81, p=.15, η2G = .01.



### Discussion

In Experiment 1, we found that varied training resulted in superior
testing performance than constant training, from both a position novel
to both groups, and from the position at which the constant group was
trained, which was novel to the varied condition. The superiority of
varied training over constant training even at the constant training
position is of particular note, given that testing at this position
should have been highly similar for participants in the constant
condition. It should also be noted, though, that testing at the constant
trained position is not exactly identical to training from that
position, given that the context of testing is different in several ways
from that of training, such as the testing trials from the different
positions being intermixed, as well as a simple change in context as a
function of time. Such contextual differences will be further considered
in the General Discussion.

In addition to the variation of throwing position during training, the
participants in the varied condition of Experiment 1 also received
training practice from the closest/easiest position, as well as from the
furthest/most difficult position that would later be encountered by all
participants during testing. The varied condition also had the potential
advantage of interpolating both of the novel positions from which they
would later be tested. Experiment 2 thus sought to address these issues
by comparing a varied condition to multiple constant conditions.

## Experiment 2

In Experiment 2, we sought to replicate our findings from Experiment 1
with a new sample of participants, while also addressing the possibility
of the pattern of results in Experiment 1 being explained by some
idiosyncrasy of the particular training location of the constant group
relative to the varied group. To this end, Experiment 2 employed the
same basic procedure as Experiment 1, but was designed with six separate
constant groups each trained from one of six different locations (400,
500, 625, 675, 800, or 900), and a varied group trained from two
locations (500 and 800). Participants in all seven groups were then
tested from each of the 6 unique positions.

## Methods

### Participants

A total of 306 Indiana University psychology students participated in
Experiment 2, which was also conducted online. As was the case in
experiment 1, the undergraduate population from which we recruited
participants was 63% female and primarily composed of 18--22-year-old
individuals. Using the same procedure as experiment 1, we excluded 98
participants for exceptionally poor performance at one of the dependent
measures of the task, or for displaying a pattern of responses
indicative of a lack of engagement with the task. A total of 208
participants were included in the final analyses with 31 in the varied
group and 32, 28, 37, 25, 29, 26 participants in the constant groups
training from location 400, 500, 625, 675, 800, and 900, respectively.
All participants were compensated with course credit.

### Task and Procedure

The task of Experiment 2 was identical to that of Experiment 1, in all
but some minor adjustments to the height of the barrier, and the
relative distance between the barrier and the target. Additionally, the
intermittent testing trials featured in experiment 1 were not utilized
in experiment 2, and all training and testing trials were presented with
feedback. An abbreviated demo of the task used for Experiment 2 can be
found at (https://pcl.sitehost.iu.edu/tg/demos/igas_expt2_demo.html).

The procedure for Experiment 2 was also quite similar to experiment 1.
Participants completed 140 training trials, all of which were from the
same position for the constant groups and split evenly (70 trials each -
randomized) for the varied group. In the testing phase, participants
completed 30 trials from each of the six locations that had been used
separately across each of the constant groups during training. Each of
the constant groups thus experience one trained location and five novel
throwing locations in the testing phase, while the varied group
experiences 2 previously trained, and 4 novel locations.

## Results

#### Data Processing and Statistical Packages

After confirming that condition and throwing position did not have any
significant interactions, we standardized performance within each
position, and then average across position to yield a single performance
measure per participant. This standardization did not influence our
pattern of results. As in experiment 1, we performed type III ANOVA's
due to our unbalanced design, however the pattern of results presented
below is not altered if type 1 or type III tests are used instead. The
statistical software for the primary analyses was the same as for
experiment 1. Individual learning rates in the testing phase, compared
between groups in the supplementary analyses, were fit using the TEfit
package in R (Cochrane, 2020).

#### Training Phase

The different training conditions trained from positions that were not
equivalently difficult and are thus not easily amenable to comparison.
As previously stated, the primary interest of the training data is
confirmation that some learning did occur. <a href="#fig-e2train" class="quarto-xref">Figure 5</a> depicts the training
performance of the varied group alongside that of the aggregate of the
six constant groups (5a), and each of the 6 separate constant groups
(5b). An ANOVA comparison with training stage (beginning, middle, end)
as a within-group factor and group (the varied condition vs. the 6
constant conditions collapsed together) as a between-subject factor
revealed no significant effect of group on training performance,
F(1,206)=.55,p=.49, $\eta^{2}_G$ \<.01, a significant effect of training
stage F(2,412)=77.91, p\<.001, $\eta^{2}_G$ =.05, and no significant
interaction between group and training stage, F(2,412)=.489 p=.61,
$\eta^{2}_G$ \<.01. We also tested for a difference in training
performance between the varied group and the two constant groups that
trained matching throwing positions (i.e., the constant groups training
from position 500, and position 800). The results of our ANOVA on this
limited dataset mirrors that of the full-group analysis, with no
significant effect of group F(1,86)=.48, p=.49, $\eta^{2}_G$ \<.01, a
significant effect of training stage F(2,172)=56.29, p\<.001,
$\eta^{2}_G$ =.11, and no significant interaction between group and
training stage, F(2,172)=.341 p=.71, $\eta^{2}_G$ \<.01.


| Position | Constant       | Varied         |
|:---------|:---------------|:---------------|
| 400      | 100.59(46.3)   | 83.92(33.76)   |
| 500      | 152.28(69.82)  | 134.38(61.38)  |
| 625      | 211.21(90.95)  | 183.51(75.92)  |
| 675      | 233.32(93.35)  | 206.32(94.64)  |
| 800      | 283.24(102.85) | 242.65(89.73)  |
| 900      | 343.51(114.33) | 289.62(110.07) |

Next, we compared the testing performance of constant and varied groups
from only positions that participants had not encountered during
training. Constant participants each had 5 novel positions, whereas
varied participants tested from 4 novel positions (400,625,675,900). We
first standardized performance within in each position, and then
averaged across positions. Here again, we found a significant effect of
condition (constant vs. varied): F(1,206)=4.30, p=.039, $\eta^{2}_G$ =
.02 .


| Position | Constant       | Varied         |
|:---------|:---------------|:---------------|
| 400      | 98.84(45.31)   | 83.92(33.76)   |
| 500      | 152.12(69.94)  |                |
| 625      | 212.91(92.76)  | 183.51(75.92)  |
| 675      | 232.9(95.53)   | 206.32(94.64)  |
| 800      | 285.91(102.81) |                |
| 900      | 346.96(111.35) | 289.62(110.07) |

Finally, corresponding to the comparison of position 760 from experiment
1, we compared the test performance of the varied group against the
constant group from only the positions that the constant groups trained.
Such positions were novel to the varied group (thus this analysis
omitted two constant groups that trained from positions 500 or 800 as
those positions were not novel to the varied group). <a href="#fig-e2test1" class="quarto-xref">Figure 7</a> displays
the particular subset of comparisons utilized for this analysis. Again,
we standardized performance within each position before performing the
analyses on the aggregated data. In this case, the effect of condition
did not reach statistical significance F(1,149)=3.14, p=.079,
$\eta^{2}_G$ = .02. Table 4 provides descriptive statistics.


| Position | Constant      | Varied         |
|:---------|:--------------|:---------------|
| 400      | 108.85(50.63) | 83.92(33.76)   |
| 625      | 204.75(84.66) | 183.51(75.92)  |
| 675      | 235.75(81.15) | 206.32(94.64)  |
| 900      | 323.5(130.9)  | 289.62(110.07) |

### Discussion

The results of experiment 2 largely conform to the findings of
experiment 1. Participants in both varied and constant conditions
improved at the task during the training phase. We did not observe the
common finding of training under varied conditions producing worse
performance during acquisition than training under constant conditions (Catalano & Kleiner, 1984; Wrisberg et al., 1987), which has been
suggested to relate to the subsequent benefits of varied training in
retention and generalization testing (Soderstrom & Bjork, 2015). However
our finding of no difference in training performance between constant
and varied groups has been observed in previous work (Chua et al., 2019; Moxley, 1979; Pigott & Shapiro, 1984).

In the testing phase, our varied group significantly outperformed the
constant conditions in both a general comparison, and in an analysis
limited to novel throwing positions. The observed benefit of varied over
constant training echoes the findings of many previous visuomotor skill
learning studies that have continued to emerge since the introduction of
Schmidt's influential Schema Theory (Catalano & Kleiner, 1984; Chua et al., 2019; Goodwin et al., 1998; McCracken & Stelmach, 1977; Moxley, 1979; Newell & Shapiro, 1976; Pigott & Shapiro, 1984; Roller et al., 2001; Schmidt, 1975; Willey & Liu, 2018b; Wrisberg et al., 1987; Wulf, 1991). We also join a much smaller set of research to observe this
pattern in a computerized task (Seow et al., 2019). One departure from
the experiment 1 findings concerns the pattern wherein the varied group
outperformed the constant group even from the training position of the
constant group, which was significant in experiment 1, but did not reach
significance in experiment 2. Although this pattern has been observed
elsewhere in the literature (Goode et al., 2008; Kerr & Booth, 1978),
the overall evidence for this effect appears to be far weaker than for
the more general benefit of varied training in conditions novel to all
training groups.

### Computational Model

Controlling for the similarity between training and testing The primary
goal of Experiment 2 was to examine whether the benefits of variability
would persist after accounting for individual differences in the
similarity between trained and tested throwing locations. To this end,
we modelled each throw as a two-dimensional point in the space of x and
y velocities applied to the projectile at the moment of release. For
each participant, we took each individual training throw, and computed
the similarity between that throw and the entire population of throws
within the solution space for each of the 6 testing positions. We
defined the solution space empirically as the set of all combinations of
x and y throw velocities that resulted in hitting the target. We then
summed each of the trial-level similarities to produce a single
similarity for each testing position score relating how the participant
threw the ball during training and the solutions that would result in
target hits from each of the six testing positions -- thus resulting in
six separate similarity scores for each participant. <a href="#fig-taskSpace1" class="quarto-xref">Figure 8</a>
visualizes the solution space for each location and illustrates how
different combinations of x and y velocity result in successfully
striking the target from different launching positions. As illustrated
in <a href="#fig-taskSpace1" class="quarto-xref">Figure 8</a>, the solution throws represent just a small fraction of the
entire space of velocity combinations used by participants throughout
the experiment.


For each individual trial, the Euclidean distance (Equation 1) was
computed between the velocity components (x and y) of that trial and the
velocity components of each individual solution throw for each of the 6
positions from which participants would be tested in the final phase of
the study. The P parameter in Equation 1 is set equal to 2, reflecting a
Gaussian similarity gradient. Then, as per an instance-based model of
similarity (Logan, 2002; Nosofsky, 1992), these distances were
multiplied by a sensitivity parameter, c, and then exponentiated to
yield a similarity value. The parameter c controls the rate with which
similarity-based generalization drops off as the Euclidean distance
between two throws in x- and y-velocity space increases. If c has a
large value, then even a small difference between two throws' velocities
greatly decreases the extent of generalization from one to the other. A
small value for c produces broad generalization from one throw to
another despite relatively large differences in their velocities. The
similarity values for each training individual throw made by a given
participant were then summed to yield a final similarity score, with a
separate score computed for each of the 6 testing positions. The final
similarity score is construable as index of how accurate the throws a
participant made during the training phase would be for each of the
testing positions.

**Equation 1:** $$ Similarity_{I,J} = \sum_{i=I}\sum_{j=J}
(e^{-c^\cdot d^{p}_{i,j}}) $$

**Equation 2:**
$$ d_{i,j} = \sqrt{(x_{Train_i}-x_{Solution_j})^2 + (y_{Train_i}-y_{Solution_j})^2 } $$

A simple linear regression revealed that these similarity scores were
significantly predictive of performance in the transfer stage, t
=-15.88, p\<.01, $r^2$=.17, such that greater similarity between
training throws and solution spaces for each of the test locations
resulted in better performance. We then repeated the group comparisons
above while including similarity as a covariate in the model. Comparing
the varied and constant groups in testing performance from all testing
positions yielded a significant effect of similarity, F(1, 205)=85.66,
p\<.001, $\eta^{2}_G$ =.29, and also a significant effect of condition
(varied vs. constant), F(1, 205)=6.03, p=.015, $\eta^{2}_G$ =.03. The
group comparison limited to only novel locations for the varied group
pit against trained location for the constant group resulted in a
significant effect of similarity, F(1,148)=31.12, p\<.001, $\eta^{2}_G$
=.18 as well as for condition F(1,148)=11.55, p\<.001, $\eta^{2}_G$
=.07. For all comparisons, the pattern of results was consistent with
the initial findings from experiment 2, with the varied group still
performing significantly better than the constant group.

#### Fitting model parameters separately by group

To directly control for similarity in Experiment 2, we developed a
model-based measure of the similarity between training throws and
testing conditions. This similarity measure was a significant predictor
of testing performance, e.g., participants whose training throws were
more similar to throws that resulted in target hits from the testing
positions, tended to perform better during the testing phase.
Importantly, the similarity measure did not explain away the group-level
benefits of varied training, which remained significant in our linear
model predicting testing performance after similarity was added to the
model. However, previous research has suggested that participants may
differ in their level of generalization as a function of prior
experience, and that such differences in generalization gradients can be
captured by fitting the generalization parameter of an instance-based
model separately to each group (Hahn et al., 2005; Lamberts, 1994).
Relatedly, the influential Bayesian generalization model developed by Tenenbaum & Griffiths (2001) predicts that the breadth of generalization
will increase when a rational agent encounters a wider variety of
examples. Following these leads, we assume that in addition to learning
the task itself, participants are also adjusting how generalizable their
experience should be. Varied versus constant participants may be
expected to learn to generalize their experience to different degrees.
To accommodate this difference, the generalization parameter of the
instance-based model (in the present case, the c parameter) can be
allowed to vary between the two groups to reflect the tendency of
learners to adaptively tune the extent of their generalization. One
specific hypothesis is that people adaptively set a value of c to fit
the variability of their training experience (Nosofsky & Johansen, 2000; Sakamoto et al., 2006). If one's training experience is relatively
variable, as with the variable training condition, then one might infer
that future test situations will also be variable, in which case a low
value of c will allow better generalization because generalization will
drop off slowly with training-to-testing distance. Conversely, if one's
training experience has little variability, as found in the constant
training conditions, then one might adopt a high value of c so that
generalization falls off rapidly away from the trained positions.

To address this possibility, we compared the original instance-based
model of similarity fit against a modified model which separately fits
the generalization parameter, c, to varied and constant participants. To
perform this parameter fitting, we used the optim function in R, and fit
the model to find the c value(s) that maximized the correlation between
similarity and testing performance.

Both models generate distinct similarity values between training and
testing locations. Much like the analyses in Experiment 2, these
similarity values are regressed against testing performance in models of
the form shown below. As was the case previously, testing performance is
defined as the mean absolute distance from the center of the target
(with a separate score for each participant, from each position).

Linear models 1 and 3 both show that similarity is a significant
predictor of testing performance (p\<.01). Of greater interest is the
difference between linear model 2, in which similarity is computed from
a single c value fit from all participants (Similarity1c), with linear
model 4, which fits the c parameter separately between groups
(Similarity2c). In linear model 2, the effect of training group remains
significant when controlling for Similarity1c (p\<.01), with the varied
group still performing significantly better. However, in linear model 4
the addition of the Similarity2c predictor results in the effect of
training group becoming nonsignificant (p=.40), suggesting that the
effect of varied vs. constant training is accounted for by the
Similarity2c predictor. Next, to further establish a difference between
the models, we performed nested model comparisons using ANOVA, to see if
the addition of the training group parameter led to a significant
improvement in model performance. In the first comparison, ANOVA(Linear
Model 1, Linear Model 2), the addition of the training group predictor
significantly improved the performance of the model (F=22.07, p\<.01).
However, in the second model comparison, ANOVA (Linear model 3, Linear
Model 4) found no improvement in model performance with the addition of
the training group predictor (F=1.61, p=.20).

Finally, we sought to confirm that similarity values generated from the
adjusted Similarity2c model had more predictive power than those
generated from the original Similarity1c model. Using the BIC function
in R, we compared BIC values between linear model 1 (BIC=14604.00) and
linear model 3 (BIC = 14587.64). The lower BIC value of model 3 suggests
a modest advantage for predicting performance using a similarity measure
computed with two c values over similarity computed with a single c
value. When fit with separate c values, the best fitting c parameters
for the model consistently optimized such that the c value for the
varied group (c=.00008) was smaller in magnitude than the c value for
the constant group(c= .00011). Recall that similarity decreases as a
Gaussian function of distance (equation 1 above), and a smaller value of
c will result in a more gradual drop-off in similarity as the distance
between training throws and testing solutions increases.

In summary, our modeling suggests that an instance-based model which
assumes equivalent generalization gradients between constant and varied
trained participants is unable to account for the extent of benefits of
varied over constant training observed at testing. The evidence for this
in the comparative model fits is that when a varied/constant dummy-coded
variable for condition is explicitly added to the model, the variable
adds a significant contribution to the prediction of test performance,
with the variable condition yielding better performance than the
constant conditions. However, if the instance-based generalization model
is modified to assume that the training groups can differ in the
steepness of their generalization gradient, by incorporating a separate
generalization parameter for each group, then the instance-based model
can account for our experimental results without explicitly taking
training group into account. Henceforth this model will be referred to
as the Instance-based Generalization with Adaptive Similarity (IGAS)
model.

### General Discussion

Across two experiments, we found evidence in support of the benefits of
variability hypothesis in a simple, computerized projectile throwing
task. Generalization was observed in both constant and varied
participants, in that both groups tended to perform better at novel
positions in the testing phase than did participants who started with
those positions in the training phase. However, varied trained
participants consistently performed better than constant trained
participants, in terms of both the testing phase in general, and in a
comparison that only included untrained positions. We also found some
evidence for the less commonly observed pattern wherein varied-trained
participants outperform constant-trained participants even from
conditions identical to the constant group training (Goode et al., 2008; Green et al., 1995; Kerr & Booth, 1978). In experiment 1 varied
participants performed significantly better on this identity comparison.
In Experiment 2, the comparison was not significant initially, but
became significant after controlling for the similarity measure that
incorporates only a single value for the steepness of similarity-based
generalization (c). Furthermore, we showed that the general pattern of
results from Experiment 2 could be parsimoniously accommodated by an
instance-based similarity model, but only with the assumption that
constant and varied participants generalize their training experience to
different degrees. Our results thus suggest that the benefits of
variation cannot be explained by the varied-trained participants simply
covering a broader range of the task space. Rather, the modeling
suggests that varied participants also learn to adaptively tune their
generalization function such that throwing locations generalize more
broadly to one another than they do in the constant condition. A
learning system could end up adopting a higher c value in the constant
than variable training conditions by monitoring the trial-by-trial
variability of the training items. The c parameter would be adapted
downwards when adjacent training items are dissimilar to each other and
adapted upwards when adjacent training items are the same. In this
fashion, contextually appropriate c values could be empirically learned.
This learning procedure would capture the insight that if a situation
has a high amount variability, then the learner should be predisposed
toward thinking that subsequent test items will also show considerable
variability, in which case generalization gradients should be broad, as
is achieved by low values for c.

Also of interest is whether the IGAS model can predict the pattern of
results wherein the varied condition outperforms the constant condition
even from the position on which the constant condition trained. Although
our models were fit using all of the Experiment 2 training and testing
data, not just that of the identity comparisons, in <a href="#fig-Toy-Model2" class="quarto-xref">Figure 9</a> we
demonstrate how a simplified version of the IGAS model could in
principle produce such a pattern. In addition to the assumption of
differential generalization between varied and constant conditions, our
simplified model makes explicit an assumption that is incorporated into
the full IGAS model -- namely that even when being tested from a
position identical to that which was trained, there are always some
psychological contextual differences between training and testing
throws, resulting in a non-zero dissimilarity.


As mentioned above, the idea that learners flexibly adjust their
generalization gradient based on prior experience does have precedent in
the domains of category learning (Aha & Goldstone, 1992; Briscoe & Feldman, 2011; Hahn et al., 2005; Lamberts, 1994; Op de Beeck et al., 2008), and sensorimotor adaptation (Marongelli & Thoroughman, 2013; Taylor & Ivry, 2013; Thoroughman & Taylor, 2005). Lamberts (1994) showed
that a simple manipulation of background knowledge during a
categorization test resulted in participants generalizing their training
experience more or less broadly, and moreover that such a pattern could
be captured by allowing the generalization parameter of an
instance-based similarity model to be fit separately between conditions.
The flexible generalization parameter has also successfully accounted
for generalization behavior in cases where participants have been
trained on categories that differ in their relative variability (Hahn et al., 2005; Sakamoto et al., 2006). However, to the best of our
knowledge, IGAS is the first instance-based similarity model that has
been put forward to account for the effect of varied training in a
visuomotor skill task. Although IGAS was inspired by work in the domain
of category learning, its success in a distinct domain may not be
surprising in light of the numerous prior observations that at least
certain aspects of learning and generalization may operate under common
principles across different tasks and domains (Censor et al., 2012; Hills et al., 2010; Jamieson et al., 2022; Law & Gold, 2010; Roark et al., 2021; Rosenbaum et al., 2001; Vigo et al., 2018; Wall et al., 2021; Wu et al., 2020; Yang et al., 2020).

Our modelling approach does differ from category learning
implementations of instance-based models in several ways. One such
difference is the nature of the training instances that are assumed to
be stored. In category learning studies, instances are represented as
points in a multidimensional space of all of the attributes that define
a category item (e.g. size/color/shape). Rather than defining instances
in terms of what stimuli learners experience, our approach assumes that
stored, motor instances reflect how they act, in terms of the velocity
applied to the ball on each throw. An advantage of many motor learning
tasks is the relative ease with which task execution variables can be
directly measured (e.g. movement force, velocity, angle, posture) in
addition to the decision and response time measures that typically
exhaust the data generated from more classical cognitive tasks. Of
course, whether learners actually are storing each individual motor
instance is a fundamental question beyond the scope of the current work
-- though as described in the introduction there is some evidence in
support of this idea (Chamberlin & Magill, 1992a; Crump & Logan, 2010; Hommel, 1998; Meigh et al., 2018; Poldrack et al., 1999). A particularly
noteworthy instance-based model of sensory-motor behavior is the
Knowledge II model of Rosenbaum and colleagues (R. G. Cohen & Rosenbaum, 2004; Rosenbaum et al., 1995). Knowledge II explicitly defines instances as
postures (joint combinations), and is thus far more detailed than IGAS
in regards to the contents of stored instances. Knowledge II also
differs from IGAS in that learning is accounted for by both the
retrieval of stored postures, and the generation of novel postures via
the modification of retrieved postures. A promising avenue for future
research would be to combine the adaptive similarity mechanism of IGAS
with the novel instance generation mechanisms of Knowledge II.

Our findings also have some conceptual overlap with an earlier study on
the effects of varied training in a coincident timing task (Catalano & Kleiner, 1984). In this task, participants observe a series of lamps
lighting up consecutively, and attempt to time a button press with the
onset of the final lamp. The design consisted of four separate constant
groups, each training from a single lighting velocity, and a single
varied group training with all four of the lighting velocities used by
the individual constant groups. Participants were then split into four
separate testing conditions, each of which were tested from a single
novel lighting velocity of varying distance from the training
conditions. The result of primary interest was that all participants
performed worse as the distance between training and testing velocity
increased -- a typical generalization decrement. However, varied
participants showed less of a decrement than did constant participants.
The authors take this result as evidence that varied training results in
a less-steep generalization gradient than does constant training.
Although the experimental conclusions of Catalano and Kleiner are
similar to our own, our work is novel in that we account for our results
with a cognitive model, and without assuming the formation of a schema.
Additionally, the way in which Catalano and Kleiner collapse their
separate constant groups together may result in similarity confounds
between varied and constant conditions that leaves their study open to
methodological criticisms, especially in light of related work which
demonstrated that the extent to which varied training may be beneficial
can depend on whether the constant group they are compared against
trained from similar conditions to those later tested (Wrisberg et al., 1987). Our study alleviates such concerns by explicitly controlling for
similarity.

## Limitations

A limitation of this study concerns the ordering of the testing/transfer
trials at the conclusion of both experiments. Participants were tested
from each separate position (4 in Experiment 1, 6 in Experiment 2) in a
random, intermixed order. Because the varied group was trained from two
positions that were also randomly ordered, they may have benefited from
experience with this type of sequencing, whereas the constant groups had
no experience with switching between positions trial to trial. This
concern is somewhat ameliorated by the fact that the testing phase
performance of the constant groups from their trained position was not
significantly worse than their level of performance at the end of the
training phase, suggesting that they were not harmed by random ordering
of positions during testing. It should also be noted that the
computerized task utilized in the present work is relatively simple
compared to many of the real-world tasks utilized in prior research. It
is thus conceivable that the effect of variability in more complex tasks
is distinct from the process put forward in the present work. An
important challenge for future work will be to assess the extent to
which IGAS can account for generalization in relatively complex tasks
with far more degrees of freedom.

It is common for psychological process models of categorization learning
to use an approach such as multidimensional scaling so as to transform
the stimuli from the physical dimensions used in the particular task
into the psychological dimensions more reflective of the actual human
representations (Nosofsky, 1992; Shepard, 1987). Such scaling typically entails having participants rate the similarity between individual items
and using these similarity judgements to then compute the psychological
distances between stimuli, which can then be fed into a subsequent
model. In the present investigation, there was no such way to scale the
x and y velocity components in terms of the psychological similarity,
and thus our modelling does rely on the assumption that the
psychological distances between the different throwing positions are
proportional to absolute distances in the metric space of the task (e.g.
the relative distance between positions 400 and 500 is equivalent to
that between 800 and 900). However, an advantage of our approach is that
we are measuring similarity in terms of how participants behave
(applying a velocity to the ball), rather than the metric features of
the task stimuli.

## Conclusion

Our experiments demonstrate a reliable benefit of varied training in a
simple projectile launching task. Such results were accounted for by an
instance-based model that assumes that varied training results in the
computation of a broader similarity-based generalization gradient.
Instance-based models augmented with this assumption may be a valuable
approach towards better understanding skill generalization and transfer.


# Project 2 - HTW


# Introduction

In project 1, I applied model-based techniques to quantify and control for the similarity between training and testing experience, which in turn enabled us to account for the difference between varied and constant training via an extended version of a similarity based generalization model. In project 2, we will go a step further, implementing a full process model capable of both 1) producing novel responses and 2) modeling behavior in both the learning and testing stages of the experiment. Project 2 also places a greater emphasis on extrapolation performance following training. Although varied training has often been purported to be particularly beneficial for generalization or transfer, few experiments have compared varied and constant training in contexts with unambiguous extrapolation testing.

## Function Learning and Extrapolation

The study of human function learning investigates how people learn relationships between continuous input and output values. Function learning is studied both in tasks where individuals are exposed to a sequence of input/output pairs (DeLosh et al., 1997; McDaniel et al., 2013), or situations where observers are presented with a an incomplete scatterplot or line graph and make predictions about regions of the plot that don't contain data (Ciccione & Dehaene, 2021; Courrieu, 2012; Said & Fischer, 2021; Schulz et al., 2020).

Carroll (1963) conducted the earliest work on function learning. Input stimuli and output responses were both lines of varying length. The correct output response was related to the length of the input line by a linear, quadratic, or random function. Participants in the linear and quadratic performed above chance levels during extrapolation testing, with those in the linear condition performing the best overall. Carroll argued that these results were best explained by a ruled based model wherein learners form an abstract representation of the underlying function. Subsequent work by Brehmer (1974),testing a wider array of functional forms, provided further evidence for superior extrapolation in tasks with linear functions. Brehmer argued that individuals start out with an assumption of a linear function, but given sufficient error will progressively test alternative hypothesis with polynomials of greater degree. Koh & Meyer (1991) employed a visuomotor function learning task, wherein participants were trained on examples from an unknown function relating the length of an input line to the duration of a response (time between keystrokes). In this domain, participants performed best when the relation between line length and response duration was determined by a power, as opposed to linear function. Koh & Meyer developed the log-polynomial adaptive-regression model to account for their results.

The first significant challenge to the rule-based accounts of function learning was put forth by DeLosh et al. (1997) . In their task, participants learned to associate stimulus magnitudes with response magnitudes that were related via either linear, exponential, or quadratic function. Participants approached ceiling performance by the end of training in each function condition, and were able to correctly respond in interpolation testing trials. All three conditions demonstrated some capacity for extrapolation, however participants in the linear condition tended to underestimate the true function, while exponential and quadratic participants reliably overestimated the true function on extrapolation trials. Extrapolation and interpolation performance are depicted in <a href="#fig-delosh-extrap" class="quarto-xref">Figure 10</a>.

The authors evaluated both of the rule-based models introduced in earlier research (with some modifications enabling trial-by-trial learning). The polynomial hypothesis testing model (Brehmer, 1974; Carroll, 1963) tended to mimic the true function closely in extrapolation, and thus offered a poor account of the human data. The log-polynomial adaptive regression model (Koh & Meyer, 1991) was able to mimic some of the systematic deviations produced by human subjects, but also predicted overestimation in cases where underestimation occurred.

The authors also introduced two new function-learning models. The Associative Learning Model (ALM) and the extrapolation-association model (EXAM). ALM is a two layer connectionist model adapted from the ALCOVE model in the category learning literature (Kruschke, 1992). ALM belongs to the general class of radial-basis function neural networks, and can be considered a similarity-based model in the sense that the nodes in the input layer of the network are activated as a function of distance. The EXAM model retains the same similarity based activation and associative learning mechanisms as ALM, while being augmented with a linear rule response mechanism. When presented with novel stimuli, EXAM will retrieve the most similar input-output examples encountered during training, and from those examples compute a local slope. ALM was able to provide a good account of participant training and interpolation data in all three function conditions, however it was unable to extrapolate. EXAM, on the other hand, was able to reproduce both the extrapolation underestimation, as well as the quadratic and exponential overestimation patterns exhibited by the human participants. Subsequent research identified some limitations in EXAM's ability to account for cases where human participants learn and extrapolate sinusoidal function Bott & Heit (2004) or to scenarios where different functions apply to different regions of the input space Kalish et al. (2004), though EXAM has been shown to provide a good account of human learning and extrapolation in tasks with bi-linear, V shaped input spaces Mcdaniel et al. (2009).


# Project 2 - HTW- Methods

## Participants

Data was collected from 647 participants (after exclusions). The results shown below consider data from subjects in our initial experiment, which consisted of 196 participants (106 constant, 90 varied). The follow-up experiments entailed minor manipulations: 1) reversing the velocity bands that were trained on vs. novel during testing; 2) providing ordinal rather than numerical feedback during training (e.g. correct, too low, too high). The data from these subsequent experiments are largely consistently with our initial results shown below.

## Task

We developed a novel visuomotor extrapolation task, termed the Hit The Wall task, wherein participants learned to launch a projectile such that it hit a rectangle at the far end of the screen with an appropriate amount of force. Although the projectile had both x and y velocity components, only the x-dimension was relevant for the task.  <a href="https://pcl.sitehost.iu.edu/tg/HTW/HTW_Index.html?sonaid=" target="_blank">Link to task demo</a>

## Project 2 - HTW - Procedure

The HTW task involved launching projectiles to hit a target displayed on the computer screen. Participants completed a total of 90 trials during the training stage. In the varied training condition, participants encountered three velocity bands (800-1000, 1000-1200, and 1200-1400). In contrast, participants in the constant training condition encountered only one velocity band (800-1000).

During the training stage, participants in both conditions also completed "no feedback" trials, where they received no information about their performance. These trials were randomly interleaved with the regular training trials.

Following the training stage, participants proceeded to the testing stage, which consisted of three phases. In the first phase, participants completed "no-feedback" testing from three novel extrapolation bands (100-300, 350-550, and 600-800), with each band consisting of 15 trials.

In the second phase of testing, participants completed "no-feedback" testing from the three velocity bands used during the training stage (800-1000, 1000-1200, and 1200-1400). In the constant training condition, two of these bands were novel, while in the varied training condition, all three bands were encountered during training.

The third and final phase of testing involved "feedback" testing for each of the three extrapolation bands (100-300, 350-550, and 600-800), with each band consisting of 10 trials. Participants received feedback on their performance during this phase.

Throughout the experiment, participants' performance was measured by calculating the distance between the produced x-velocity of the projectiles and the closest edge of the current velocity band. Lower distances indicated better performance.

After completing the experiment, participants were debriefed and provided with an opportunity to ask questions about the study.


## Analyses Strategy

All data processing and statistical analyses were performed in R version 4.31 Team (2020). To assess differences between groups, we used Bayesian Mixed Effects Regression. Model fitting was performed with the brms package in R Bürkner (2017), and descriptive stats and tables were extracted with the BayestestR package Makowski et al. (2019). Mixed effects regression enables us to take advantage of partial pooling, simultaneously estimating parameters at the individual and group level. Our use of Bayesian, rather than frequentist methods allows us to directly quantify the uncertainty in our parameter estimates, as well as circumventing convergence issues common to the frequentist analogues of our mixed models. For each model, we report the median values of the posterior distribution, and 95% credible intervals.

Each model was set to run with 4 chains, 5000 iterations per chain, with the first 2500 of which were discarded as warmup chains. Rhat values were generally within an acceptable range, with values \<=1.02 (see appendix for diagnostic plots). We used uninformative priors for the fixed effects of the model (condition and velocity band), and weakly informative Student T distributions for for the random effects.

We compared varied and constant performance across two measures, deviation and discrimination. Deviation was quantified as the absolute deviation from the nearest boundary of the velocity band, or set to 0 if the throw velocity fell anywhere inside the target band. Thus, when the target band was 600-800, throws of 400, 650, and 1100 would result in deviation values of 200, 0, and 300, respectively. Discrimination was measured by fitting a linear model to the testing throws of each subjects, with the lower end of the target velocity band as the predicted variable, and the x velocity produced by the participants as the predictor variable. Participants who reliably discriminated between velocity bands tended to have positive slopes with values ~1, while participants who made throws irrespective of the current target band would have slopes ~0.



| Band      | Band Type     | Mean | Median |  Sd |
|:----------|:--------------|-----:|-------:|----:|
| 100-300   | Extrapolation |  254 |    148 | 298 |
| 350-550   | Extrapolation |  191 |    110 | 229 |
| 600-800   | Extrapolation |  150 |     84 | 184 |
| 800-1000  | Trained       |  184 |    106 | 242 |
| 1000-1200 | Extrapolation |  233 |    157 | 282 |
| 1200-1400 | Extrapolation |  287 |    214 | 290 |



| Band      | Band Type     | Mean | Median |  Sd |
|:----------|:--------------|-----:|-------:|----:|
| 100-300   | Extrapolation |  386 |    233 | 426 |
| 350-550   | Extrapolation |  285 |    149 | 340 |
| 600-800   | Extrapolation |  234 |    144 | 270 |
| 800-1000  | Trained       |  221 |    149 | 248 |
| 1000-1200 | Trained       |  208 |    142 | 226 |
| 1200-1400 | Trained       |  242 |    182 | 235 |

## Results

### Testing Phase - No feedback.

In the first part of the testing phase, participants are tested from each of the velocity bands, and receive no feedback after each throw.

#### Deviation From Target Band

Descriptive summaries testing deviation data are provided in <a href="#tbl-e1-test-nf-deviation" class="quarto-xref">Table 4</a> and <a href="#fig-e1-test-dev" class="quarto-xref">Figure 12</a>. To model differences in accuracy between groups, we used Bayesian mixed effects regression models to the trial level data from the testing phase. The primary model predicted the absolute deviation from the target velocity band (dist) as a function of training condition (condit), target velocity band (band), and their interaction, with random intercepts and slopes for each participant (id).




| Term         | Estimate | 95% CrI Lower | 95% CrI Upper |   pd |
|:-------------|---------:|--------------:|--------------:|-----:|
| Intercept    |   205.09 |        136.86 |        274.06 | 1.00 |
| conditVaried |   157.44 |         60.53 |        254.90 | 1.00 |
| Band         |     0.01 |         -0.07 |          0.08 | 0.57 |
| condit\*Band |    -0.16 |         -0.26 |         -0.06 | 1.00 |

| contrast          | Band |   value |  lower |  upper |   pd |
|:------------------|-----:|--------:|-------:|-------:|-----:|
| Constant - Varied |  100 | -141.49 | -229.2 | -53.83 | 1.00 |
| Constant - Varied |  350 | -101.79 | -165.6 | -36.32 | 1.00 |
| Constant - Varied |  600 |  -62.02 | -106.2 | -14.77 | 1.00 |
| Constant - Varied |  800 |  -30.11 |  -65.1 |   6.98 | 0.94 |
| Constant - Varied | 1000 |    2.05 |  -33.5 |  38.41 | 0.54 |
| Constant - Varied | 1200 |   33.96 |  -11.9 |  81.01 | 0.92 |

The model predicting absolute deviation (dist) showed clear effects of both training condition and target velocity band (Table X). Overall, the varied training group showed a larger deviation relative to the constant training group (β = 157.44, 95% CI \[60.53, 254.9\]). Deviation also depended on target velocity band, with lower bands showing less deviation. See <a href="#tbl-e1-bmm-dist" class="quarto-xref">Table 5</a> for full model output.

#### Discrimination between bands

In addition to accuracy/deviation, we also assessed the ability of participants to reliably discriminate between the velocity bands (i.e. responding differently when prompted for band 600-800 than when prompted for band 150-350). <a href="#tbl-e1-test-nf-vx" class="quarto-xref">Table 6</a> shows descriptive statistics of this measure, and Figure 1 visualizes the full distributions of throws for each combination of condition and velocity band. To quantify discrimination, we again fit Bayesian Mixed Models as above, but this time the dependent variable was the raw x velocity generated by participants on each testing trial.


| Band      | Band Type     | Mean | Median |  Sd |
|:----------|:--------------|-----:|-------:|----:|
| 100-300   | Extrapolation |  524 |    448 | 327 |
| 350-550   | Extrapolation |  659 |    624 | 303 |
| 600-800   | Extrapolation |  770 |    724 | 300 |
| 800-1000  | Trained       | 1001 |    940 | 357 |
| 1000-1200 | Extrapolation | 1167 |   1104 | 430 |
| 1200-1400 | Extrapolation | 1283 |   1225 | 483 |

| Band      | Band Type     | Mean | Median |  Sd |
|:----------|:--------------|-----:|-------:|----:|
| 100-300   | Extrapolation |  664 |    533 | 448 |
| 350-550   | Extrapolation |  768 |    677 | 402 |
| 600-800   | Extrapolation |  876 |    813 | 390 |
| 800-1000  | Trained       | 1064 |   1029 | 370 |
| 1000-1200 | Trained       | 1180 |   1179 | 372 |
| 1200-1400 | Trained       | 1265 |   1249 | 412 |



| Term         | Estimate | 95% CrI Lower | 95% CrI Upper |   pd |
|:-------------|---------:|--------------:|--------------:|-----:|
| Intercept    |   408.55 |        327.00 |        490.61 | 1.00 |
| conditVaried |   164.05 |         45.50 |        278.85 | 1.00 |
| Band         |     0.71 |          0.62 |          0.80 | 1.00 |
| condit\*Band |    -0.14 |         -0.26 |         -0.01 | 0.98 |

| Term         | Estimate | 95% CrI Lower | 95% CrI Upper |   pd |
|:-------------|---------:|--------------:|--------------:|-----:|
| Intercept    |   478.47 |        404.00 |        551.45 | 1.00 |
| conditVaried |   142.04 |         37.17 |        247.59 | 1.00 |
| Band         |     0.50 |          0.42 |          0.57 | 1.00 |
| condit\*Band |    -0.07 |         -0.17 |          0.04 | 0.89 |

See <a href="#tbl-e1-bmm-vx" class="quarto-xref">Table 7</a> for the full model results. The estimated coefficient for training condition ($B$ = 164.05, 95% CrI \[45.5, 278.85\]) suggests that the varied group tends to produce harder throws than the constant group, but is not in and of itself useful for assessing discrimination. Most relevant to the issue of discrimination is the slope on Velocity Band ($B$ = 0.71, 95% CrI \[0.62, 0.8\]). Although the median slope does fall underneath the ideal of value of 1, the fact that the 95% credible interval does not contain 0 provides strong evidence that participants exhibited some discrimination between bands. The estimate for the interaction between slope and condition ($B$ = -0.14, 95% CrI \[-0.26, -0.01\]), suggests that the discrimination was somewhat modulated by training condition, with the varied participants showing less senitivity between vands than the constant condition. This difference is depicted visually in **?@fig-e1-bmm-vx.Slope** coefficients are broken down by quartile in <a href="#tbl-e1-slope-quartile" class="quarto-xref">Table 8</a>. The constant participant participants appear to have larger slopes across quartiles, but the difference between conditions may be less pronounced for the top quartiles of subjects who show the strongest discrimination. Figure <a href="#fig-e1-bmm-bx2" class="quarto-xref">Figure 15</a> shows the distributions of slope values for each participant, and the compares the probability density of slope coefficients between training conditions. <a href="#fig-e1-indv-slopes" class="quarto-xref">Figure 16</a>

The second model, which focused solely on extrapolation bands, revealed similar patterns. The Velocity Band term ($B$ = 0.5, 95% CrI \[0.42, 0.57\]) still demonstrates a high degree of discrimination ability. However, the posterior distribution for interaction term ($B$ = -0.07, 95% CrI \[-0.17, 0.04\] ) does across over 0, suggesting that the evidence for decreased discrimination ability for the varied participants is not as strong when considering only the three extrapolation bands.




# Project 2 - HTW Modeling Approach

In project 1, I applied model-based techniques to quantify and control for the similarity between training and testing experience, which in turn enabled us to account for the difference between varied and constant training via an extended version of a similarity based generalization model. In project 2, I will go a step further, implementing a full process model capable of both 1) producing novel responses and 2) modeling behavior in both the learning and testing stages of the experiment. For this purpose, we will apply the associative learning model (ALM) and the EXAM model of function learning (DeLosh et al., 1997). ALM is a simple connectionist learning model which closely resembles Kruschke's ALCOVE model (Kruschke, 1992), with modifications to allow for the generation of continuous responses.

## ALM & Exam Description

ALM is a localist neural network model (Page, 2000), with each input node corresponding to a particular stimulus, and each output node corresponding to a particular response value. The units in the input layer activate as a function of their Gaussian similarity to the input stimulus. So, for example, an input stimulus of value 55 would induce maximal activation of the input unit tuned to 55. Depending on the value of the generalization parameter, the nearby units (e.g. 54 and 56; 53 and 57) may also activate to some degree. ALM is structured with input and output nodes that correspond to regions of the stimulus space, and response space, respectively. The units in the input layer activate as a function of their similarity to a presented stimulus. As was the case with the exemplar-based models, similarity in ALM is exponentially decaying function of distance. The input layer is fully connected to the output layer, and the activation for any particular output node is simply the weighted sum of the connection weights between that node and the input activations. The network then produces a response by taking the weighted average of the output units (recall that each output unit has a value corresponding to a particular response). During training, the network receives feedback which activates each output unit as a function of its distance from the ideal level of activation necessary to produce the correct response. The connection weights between input and output units are then updated via the standard delta learning rule, where the magnitude of weight changes are controlled by a learning rate parameter. The EXAM model is an extension of ALM, with the same learning rule and representational scheme for input and output units. The primary difference is that EXAM includes a linear extrapolation mechanism for generating novel responses during testing, a modification necessary to account for human extrapolation patterns in past research Brown & Lacroix (2017). Although this extrapolation rule departs from a strictly similarity-based generalization mechanism, EXAM is distinct from pure rule-based models in that it remains constrained by the weights learned during training.

See <a href="#tbl-alm-exam" class="quarto-xref">Table 1</a> for a full specification of the equations that define ALM and EXAM.

|                    | **ALM Response Generation**                                        |                                                                                               |
|-------------------|-----------------------------|-------------------------|
| Input Activation   | $a_i(X) = \frac{e^{-c(X-X_i)^2}}{\sum_{k=1}^M e^{-c(X-X_k)^2}}$    | Input nodes activate as a function of Gaussian similarity to stimulus                         |
| Output Activation  | $O_j(X) = \sum_{k=1}^M w_{ji} \cdot a_i(X)$                        | Output unit $O_j$ activation is the weighted sum of input activations and association weights |
| Output Probability | $P[Y_j|X] = \frac{O_j(X)}{\sum_{k=1}^M O_k(X)}$                    | The response, $Y_j$ probabilites computed via Luce's choice rule                              |
| Mean Output        | $m(X) = \sum_{j=1}^L Y_j \cdot \frac{O_j(x)}{\sum_{k=1}^M O_k(X)}$ | Weighted average of probabilities determines response to X                                    |
|                    | **ALM Learning**                                                   |                                                                                               |
| Feedback           | $f_j(Z) = e^{-c(Z-Y_j)^2}$                                         | feedback signal Z computed as similarity between ideal response and observed response         |
| magnitude of error | $\Delta_{ji}=(f_{j}(Z)-o_{j}(X))a_{i}(X)$                          | Delta rule to update weights.                                                                 |
| Update Weights     | $w_{ji}^{new}=w_{ji}+\eta\Delta_{ji}$                              | Updates scaled by learning rate parameter $\eta$.                                             |
|                    | **EXAM Extrapolation**                                             |                                                                                               |
| Instance Retrieval | $P[X_i|X] = \frac{a_i(X)}{\sum_{k=1}^M a_k(X)}$                    | Novel test stimulus $X$ activates input nodes $X_i$                                           |
| Slope Computation  | $S =$ $\frac{m(X_{1})-m(X_{2})}{X_{1}-X_{2}}$                      | Slope value, $S$ computed from nearest training instances                                     |
| Response           | $E[Y|X_i] = m(X_i) + S \cdot [X - X_i]$                            | ALM response $m(X_i)$ adjusted by slope.                                                      |

## Model Fitting Strategy

To fit ALM and EXAM to our participant data, we employ a similar method to Mcdaniel et al. (2009), wherein we examine the performance of each model after being fit to various subsets of the data. Each model was fit to the data in with separate procedures: 1) fit to maximize predictions of the testing data, 2) fit to maximize predictions of both the training and testing data, 3) fit to maximize predictions of the just the training data. We refer to this fitting manipulations as "Fit Method" in the tables and figures below. It should be emphasized that for all three fit methods, the ALM and EXAM models behave identically - with weights updating only during the training phase.Models to were fit separately to the data of each individual participant. The free parameters for both models are the generalization ($c$) and learning rate ($lr$) parameters. Parameter estimation was performed using approximate bayesian computation (ABC), which we describe in detail below.

### Approximate Bayesian Computation

To estimate parameters, we used approximate bayesian computation (ABC), enabling us to obtain an estimate of the posterior distribution of the generalization and learning rate parameters for each individual. ABC belongs to the class of simulation-based inference methods (Cranmer et al., 2020), which have begun being used for parameter estimation in cognitive modeling relatively recently (Kangasrääsiö et al., 2019; Turner et al., 2016; Turner & Van Zandt, 2012). Although they can be applied to any model from which data can be simulated, ABC methods are most useful for complex models that lack an explicit likelihood function (e.g. many neural network and evidence accumulation models).

The general ABC procedure is to 1) define a prior distribution over model parameters. 2) sample candidate parameter values, $\theta^*$, from the prior. 3) Use $\theta^*$ to generate a simulated dataset, $Data_{sim}$. 4) Compute a measure of discrepancy between the simulated and observed datasets, $discrep$($Data_{sim}$, $Data_{obs}$). 5) Accept $\theta^*$ if the discrepancy is less than the tolerance threshold, $\epsilon$, otherwise reject $\theta^*$. 6) Repeat until desired number of posterior samples are obtained.

Although simple in the abstract, implementations of ABC require researchers to make a number of non-trivial decisions as to i) the discrepancy function between observed and simulated data, ii) whether to compute the discrepancy between trial level data, or a summary statistic of the datasets, iii) the value of the minimum tolerance $\epsilon$ between simulated and observed data. For the present work, we follow the guidelines from previously published ABC tutorials (Farrell & Lewandowsky, 2018; Turner & Van Zandt, 2012). For the test stage, we summarized datasets with mean velocity of each band in the observed dataset as $V_{obs}^{(k)}$ and in the simulated dataset as $V_{sim}^{(k)}$, where $k$ represents each of the six velocity bands. For computing the discrepancy between datasets in the training stage, we aggregated training trials into three equally sized blocks (separately for each velocity band in the case of the varied group). After obtaining the summary statistics of the simulated and observed datasets, the discrepancy was computed as the mean of the absolute difference between simulated and observed datasets (<a href="#eq-discrep-test" class="quarto-xref">Equation 1</a> and <a href="#eq-discrep-train" class="quarto-xref">Equation 2</a>). For the models fit to both training and testing data, discrepancies were computed for both stages, and then averaged together.

<span id="eq-discrep-test">$$
discrep_{Test}(Data_{sim}, Data_{obs}) = \frac{1}{6} \sum_{k=1}^{6} |V_{obs}^{(k)} - V_{sim}^{(k)}|
 \qquad(1)$$</span>

<span id="eq-discrep-train">$$
\begin{aligned} \\
discrep_{Train,constant}(Data_{sim}, Data_{obs}) = \frac{1}{N_{blocks}} \sum_{j=1}^{N_{blocks}} |V_{obs,constant}^{(j)} - V_{sim,constant}^{(j)}| \\ \\
discrep_{Train,varied}(Data_{sim}, Data_{obs}) = \frac{1}{N_{blocks} \times 3} \sum_{j=1}^{N_{blocks}} \sum_{k=1}^{3} |V_{obs,varied}^{(j,k)} - V_{sim,varied}^{(j,k)}|
\end{aligned}
 \qquad(2)$$</span>

The final component of our ABC implementation is the determination of an appropriate value of $\epsilon$. The setting of $\epsilon$ exerts strong influence on the approximated posterior distribution. Smaller values of $\epsilon$ increase the rejection rate, and improve the fidelity of the approximated posterior, while larger values result in an ABC sampler that simply reproduces the prior distribution. Because the individual participants in our dataset differed substantially in terms of the noisiness of their data, we employed an adaptive tolerance setting strategy to tailor $\epsilon$ to each individual. The initial value of $\epsilon$ was set to the overall standard deviation of each individuals velocity values. Thus, sampled parameter values that generated simulated data within a standard deviation of the observed data were accepted, while worse performing parameters were rejected. After every 300 samples the tolerance was allowed to increase only if the current acceptance rate of the algorithm was less than 1%. In such cases, the tolerance was shifted towards the average discrepancy of the 5 best samples obtained thus far. To ensure the acceptance rate did not become overly permissive, $\epsilon$ was also allowed to decrease every time a sample was accepted into the posterior.

For each of the 156 participants from Experiment 1, the ABC algorithm was run until 200 samples of parameters were accepted into the posterior distribution. Obtaining this number of posterior samples required an average of 205,000 simulation runs per participant. Fitting each combination of participant, Model (EXAM & ALM), and fitting method (Test only, Train only, Test & Train) required a total of 192 million simulation runs. To facilitate these intensive computational demands, we used the Future Package in R (Bengtsson, 2021), allowing us to parallelize computations across a cluster of ten M1 iMacs, each with 8 cores.

### Modelling Results

### Group level aggregations


    --------------------------------------------
      condit    Model   Fit_Method   mean_error 
    ---------- ------- ------------ ------------
     Constant    ALM       Test        276.7    

     Constant    ALM    Test_Train     288.2    

     Constant    ALM      Train        528.1    

     Constant   EXAM       Test        215.9    

     Constant   EXAM    Test_Train     228.6    

     Constant   EXAM      Train        340.3    

      Varied     ALM       Test        231.2    

      Varied     ALM    Test_Train     268.3    

      Varied     ALM      Train        368.7    

      Varied    EXAM       Test         215     

      Varied    EXAM    Test_Train     250.7    

      Varied    EXAM      Train        370.9    
    --------------------------------------------

The posterior distributions of the $c$ and $lr$ parameters are shown <a href="#fig-htw-post-dist" class="quarto-xref">Figure 2</a> (i.e. these plots combine all the posterior samples from all of the subjects). There were substantial individual differences in the posteriors of both parameters, with the within-group individual differences generally swamped any between-group or between-model differences. The magnitude of these individual differences remains even if we consider only the single best parameter set for each subject.

We used the posterior distribution of $c$ and $lr$ parameters to generate a posterior predictive distribution of the observed data for each participant, which then allows us to compare the empirical data to the full range of predictions from each model. Model residuals are shown in the upper panels of <a href="#fig-htw-resid-pred" class="quarto-xref">Figure 1</a>. The pattern of training stage residual errors are unsurprising across the combinations of models and fitting method . Differences between ALM and EXAM are generally minor (the two models have identical learning mechanisms). The differences in the magnitude of residuals across the three fitting methods are also straightforward, with massive errors for the 'fit to Test Only' model, and the smallest errors for the 'fit to train only' models. It is also noteworthy that the residual errors are generally larger for the first block of training, which is likely due to the initial values of the ALM weights being unconstrained by whatever initial biases participants tend to bring to the task. Future work may explore the ability of the models to capture more fine grained aspects of the learning trajectories. However for the present purposes, our primary interest is in the ability of ALM and EXAM to account for the testing patterns while being constrained, or not constrained, by the training data. All subsequent analyses and discussion will thus focus on the testing stage.

The residuals of the model predictions for the testing stage (<a href="#fig-htw-resid-pred" class="quarto-xref">Figure 1</a>) also show a sensible pattern across fitting methods - with models fit only to the test data showing the best performance, followed by models fit to both training and test data, and with models fit only to the training data showing the worst performance (note that y axes are scaled different between plots). Unsurprisingly, the advantage of EXAM is strongest for extrapolation positions (the three smallest bands for both groups - as well as the two highest bands for the Constant group). Although EXAM tends to perform better for both Constant and Varied participants (see also <a href="#tbl-htw-modelError" class="quarto-xref">Table 2</a>), the relative advantage of EXAM is generally larger for the Constant group - a pattern consistent across all three fitting methods.

Panel B of <a href="#fig-htw-resid-pred" class="quarto-xref">Figure 1</a> directly compares the aggregated observed data to the posterior predictive distributions for the testing stage. Of interest are a) the extent to which the median estimates of the ALM and EXAM posteriors deviate from the observed medians for each velocity band; b) the ability of ALM and EXAM to discriminate between velocity bands; c) the relative performance of models that are constrained by the training data (i.e. the 'fit to train only' and 'fit to both' models) compared to the 'fit to test only' models; and d) the extent to which the variance of the posterior predictive distributions mimics the variance of the observed data.

Considering first the models fit to only the testing data, which reflect the best possible performance of ALM and EXAM at capturing the group-aggregated testing patterns. For the varied group, both ALM and EXAM are able to capture the median values of the observed data within the 66% credible intervals, and the spread of model predictions generally matches that of the observed data. For the constant group, only EXAM is able to capture the median range of values across the velocity bands, with ALM generally underestimating human velocoties in the upper bands, and overestimating in the lower bands. In the case of band 100, the median ALM prediction appears to match that of our participants - however this is due to a large subset of participants have ALM predictions near 0 for band 100, a pattern we will explore further in our considertation of individual patterns below. Models fit to both training and testing data show a similar pattern to only the testing data display the same basic pattern as those fit to only the testing data, albeit with slightly larger residuals. However models fit to only the training data display markedly worse performance at accounting for the key testing patterns.

-   \*\* explain how the constant group ALM predictions for band 100 look deceptively good due to aggregation of a large subset of subjects having ALM predictions of 0 for vb100, and a large subset with ALM predictions close to their position 800 value. This is relected by much greater variance of the ALM esimates in the posterior predictive plot

-   \*\* comment on how much constrained by the training data has a worse impact on the EXAM predictions for varied than for constant - perhaps due to the varied training data being much noisier than the constant training data.

-   \*\* comment on EXAM doing a better job mimicing the within-condition variance of the observed data

-   \*\* comment on the % of Constant subjects being best accounted for by EXAM being higher.

-   \*\* does EXAM do better for the Constant group because the constant group performs better? Or does training with a single example encourage an exam sort of strategy?

![](htw_model.markdown_strict_files/figure-markdown_strict/fig-htw-resid-pred-1.jpeg)

![](htw_model.markdown_strict_files/figure-markdown_strict/fig-htw-post-dist-1.jpeg)

### Accounting for individual patterns

To more accurately assess the relative abilities of ALM and EXAM to capture important empirical patterns - we will now examine the predictions of both models for the subset of individual participants shown in <a href="#fig-htw-indv-pred" class="quarto-xref">Figure 3</a>. Panel A presents three varied and constant participants who demonstrated a reasonable degree of discrimination between the 6 velocity bands during testing.

-   \*\* comment on the different ways ALM can completely fail to mimic discrimination patterns (sbj. 35; sbj. 137),and on how it can sometimes partially succeed (sbj. 11; 14,74)

-   \*\* comment on how EXAM can somtimes mimic non-monotonic spacing between bands due to associative stregth from training (i.e. subject 47)

-   \*\* compare c values to slope parameters from the statistical models earlier in paper

