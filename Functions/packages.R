#### INSTALL AND LOAD PACKAGES ==========================================================
# install pacman package if not installed -----------------------------------------------
suppressWarnings(if (!require("pacman")) install.packages("pacman"))
#remotes::install_github("mattcowgill/ggannotate")
# load packages and install if not installed --------------------------------------------
pacman::p_load(tidyverse,conflicted, tidybayes,brms, lme4, bayesplot,bayestestR,parameters,marginaleffects,
                emmeans, equatiomatic, here, pacman,  broom,
               broom.mixed,lme4,emmeans,here,knitr,gt,
                wesanderson,glue, ggdist,ggforce,patchwork,gghalves,ggh4x,
                pander,RColorBrewer,
                install = TRUE,
                update = FALSE
               )

# show loaded packages ------------------------------------------------------------------
# cat("loaded packages\n")
# print(pacman::p_loaded())

conflict_prefer_all("dplyr", quiet = TRUE)
conflict_prefer_all("purrr", quiet = TRUE)
# select <- dplyr::select
# mutate <- dplyr::mutate
# filter <- dplyr::filter
# map <- purrr::map
# walk(c(here::here("Functions/Display_Functions.R"), here::here("Functions/org_functions.R"), 
#        here::here("Functions/Table_Functions.R")), source)



walk(c("Display_Functions", "org_functions", "Table_Functions"), ~ source(here::here(paste0("Functions/", .x, ".R"))))
