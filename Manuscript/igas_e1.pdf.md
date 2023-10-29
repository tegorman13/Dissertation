---
code-repo: "Access the code, data, and analysis at <https://github.com/tegorman13/Dissertation>"
bibliography: ../Assets/Bib/Dissertation.bib
link-citations: true
# keep-md: true
toc: false
# toc-depth: 3
# toc-location: body
execute: 
  warning: false
  eval: true
  include: false
---




::: {.content-visible when-format="html"}

<div style="text-align: center; margin-top: 50px; font-size: 24px; font-weight: bold;">
  The Role of Variability in Learning Transfer: A Similarity-Based Computational Approach
</div>

<div style="text-align: center; margin-top: 300px; font-size: 32px;">
  Thomas E. Gorman
</div>

<!-- Second Page and so on... -->
<div style="text-align: justify; margin-top: 700px;">
  Submitted to the faculty of the University Graduate School in partial fulfillment of the
  requirements for the degree Doctor of Philosophy in the Department of Psychology and Brain
  Sciences and the Cognitive Science Program, Indiana University
  Indiana University
</div>

<div style="margin-top: 400px;">
  <!-- Your page numbering if needed -->
</div>

<div style="page-break-before: always;"></div>

<!-- Committee Members Page -->
<div style="text-align: center; margin-top: 300px;">
  Accepted by the Graduate Faculty, Indiana University, in partial fulfillment of the
  requirements for the degree of Doctor of Philosophy.
</div>

<div style="text-align: center; margin-top: 300px;">
  _____________________________  Robert L. Goldstone, PhD<br><br>
  _____________________________  Robert Nosofsky, PhD<br><br>
  _____________________________  Peter Todd, PhD<br><br>
  _____________________________  Mike Jones, PhD
</div>

<div style="page-break-before: always;"></div>



<div style="page-break-before: always;"></div>

<!-- Acknowledgements -->
<div style="text-align: center; font-weight: bold; font-size: 24px;">
  Acknowledgements
</div>
<div style="text-align: center; margin-top: 700px; font-size: 24px;">
   
</div>


<div style="page-break-before: always;"></div>



:::

::: {.content-visible when-format="pdf"}

\begin{centering}
\LARGE
{The Role of Variability in Learning Transfer: A Similarity-Based Computational Approach}

 
\vspace*{1.5cm}

\LARGE
{Thomas E. Gorman}

\vspace{16.5cm}

\end{centering}

Submitted to the faculty of the University Graduate School in partial fulfillment of the
requirements for the degree Doctor of Philosophy in the Department of Psychology and Brain
Sciences and the Cognitive Science Program, Indiana University
Indiana University

\vspace{6cm}

\pagenumbering{gobble}


\newpage

Accepted by the Graduate Faculty, Indiana University, in partial fulfillment of the
requirements for the degree of Doctor of Philosophy.
\vspace{4cm}

\
\_____________________________  Robert L. Goldstone, PhD
\vspace{2.5cm}
\
\
\_____________________________  Robert Nosofsky, PhD
\vspace{2.5cm}
\
\_____________________________  Peter Todd, PhD
\vspace{2.5cm}
\
\_____________________________  Mike Jones, PhD

\newpage

\begin{centering}

\vspace*{6.5cm}

@2023 \\
\vspace{1cm} 

Thomas E. Gorman
\vspace{.2cm}

\vspace{5cm}

\end{centering}

\newpage
\begin{center}
\textbf{Acknowledgements}
\end{center}
\newpage




:::

::: {.content-visible when-format="docx"}


# The Role of Variability in Learning Transfer: A Similarity-Based Computational Approach

## Thomas E. Gorman

Submitted to the faculty of the University Graduate School in partial fulfillment of the
requirements for the degree Doctor of Philosophy in the Department of Psychology and Brain
Sciences and the Cognitive Science Program, Indiana University.

---

Accepted by the Graduate Faculty, Indiana University, in partial fulfillment of the
requirements for the degree of Doctor of Philosophy.

- Robert L. Goldstone, PhD
- Robert Nosofsky, PhD
- Peter Todd, PhD
- Mike Jones, PhD

---

## @2023

### Thomas E. Gorman

---

## Acknowledgements

---



:::




{{< pagebreak >}}







# Abstract

This dissertation seeks to explore the cognitive underpinnings that govern the generalization of learning, focusing specifically on the role of variability during training in shaping subsequent transfer performance. A comprehensive review of the existing literature is presented, emphasizing the methodological complications associated with disentangling the confounding effects of similarity. Through a series of experiments involving several novel visuomotor tasks, this work investigates whether and how variability in training conditions affects performance in novel tasks. To theoretically account for the empirical outcomes, I employ both instance-based and connectionist computational models, both of which incorporate similarity-based mechanisms. These models serve to account for the extent to which variability influences the learners' generalization gradient, and also explain how training variation can produce both beneficial and deleterious outcomes. 




{{< pagebreak >}}







::: {.content-visible when-format="html"}


# Table of contents
<div id="html-toc"></div>


```{=html}
<script>
<!-- document.addEventListener("DOMContentLoaded", function(){ -->
<!--   var toc = document.getElementById("TOC"); -->
<!--   var placeholder = document.getElementById("toc-placeholder"); -->
<!--   if (toc && placeholder) { -->
<!--     placeholder.appendChild(toc); -->
<!--   } -->
<!-- }); -->


<!-- document.addEventListener("DOMContentLoaded", function(){ -->
<!--     var tocDiv = document.getElementById("html-toc"); -->
<!--     var headings = document.querySelectorAll('h1, h2, h3'); // adjust if you need more depth -->
<!--     var tocList = document.createElement("ul"); -->

<!--     headings.forEach(function(heading) { -->
<!--         var listItem = document.createElement("li"); -->
<!--         var link = document.createElement("a"); -->
<!--         link.textContent = heading.textContent; -->
<!--         link.href = "#" + heading.id; -->
<!--         listItem.appendChild(link); -->

<!--         if (heading.tagName == "H2") { -->
<!--             listItem.style.marginLeft = "20px"; -->
<!--         } else if (heading.tagName == "H3") { -->
<!--             listItem.style.marginLeft = "40px"; -->
<!--         } -->
<!--         tocList.appendChild(listItem); -->
<!--     }); -->

<!--     tocDiv.appendChild(tocList); -->
<!-- }); -->

document.addEventListener("DOMContentLoaded", function(){
    var tocDiv = document.getElementById("html-toc");
    var headings = document.querySelectorAll('h1, h2, h3'); // adjust if you need more depth
    var tocList = document.createElement("ul");

    headings.forEach(function(heading, index) {
        // Create or get the ID for the heading
        if (!heading.id) {
            heading.id = heading.textContent.replace(/[^a-z0-9]+/gi, '-').toLowerCase() + "-" + index;
        }
        var listItem = document.createElement("li");
        var link = document.createElement("a");
        link.textContent = heading.textContent;
        link.href = "#" + heading.id;
        listItem.appendChild(link);

        if (heading.tagName == "H2") {
            listItem.style.marginLeft = "20px";
        } else if (heading.tagName == "H3") {
            listItem.style.marginLeft = "40px";
        }
        tocList.appendChild(listItem);
    });
    
    tocDiv.appendChild(tocList);
});

</script>
```





:::

::: {.content-visible when-format="pdf"}

\tableofcontents
\newpage
\listoffigures
\newpage
\listoftables
\newpage



:::






{{< pagebreak >}}








## Main body

Following the procedure used by @mcdanielPredictingTransferPerformance2009, we will assess the ability of both ALM and EXAM to account for the empirical data when fitting the models to 1) only the training data, and 2) both training and testing data. Models will be fit directly to the trial by trial data of each individual participants, both by minimizing the root-mean squared deviation (RMSE), and by maximizing log likelihood. Because ALM has been shown to do poorly at accounting for human patterns extrapolation [@deloshExtrapolationSineQua1997], we will also fit the extended EXAM version of the model, which operates identically to ALM during training, but includes a linear extrapolation mechanism for generating novel responses during testing.

quarto pandoc --citeproc --pdf-engine xelatex -t pdf \
  --bibliography=../Assets/Bib/Dissertation.bib \
  --standalone \
  -f markdown igas_e1.pdf.md \
  -o refer-test.pdf

quarto render igas_e1.qmd --citeproc --pdf-engine xelatex -t pdf \
  --bibliography=../Assets/Bib/Dissertation.bib \
  --standalone \
  -o refer-test.pdf


# Appendix



### Appendix - Project 2 - Experiment 1 










## E1 Appendix

### Posterior Predictive Distributions







### Empirical vs. Predicted






### Different Aggregations













::: {.content-visible when-format="pdf"}

# References

:::
