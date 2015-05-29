
# http://ww2.coastal.edu/kingw/statistics/R-tutorials/simplelinear.html
library("MASS")
data(cats)
with(cats, plot(Bwt, Hwt))
title(main="Heart Weight (g) vs. Body Weight (kg)\nof Domestic Cats")
with(cats, plot(Hwt ~ Bwt))

# The scatterplot shows a fairly strong and reasonably linear
# relationship between the two variables.
# A Pearson product-moment correlation coefficient can be calculated
# using the cor( ) function... 
with(cats, cor(Bwt, Hwt))
# [1] 0.8041274
with(cats, cor(Bwt, Hwt))^2
#[1] 0.6466209

# If a test of significance is required, this is also easily enough
# done using the cor.test( ) function. The function does a t-test,
# a 95% confidence interval for the population correlation
# (use "conf.level=" to change the confidence level),
# and reports the value of the sample statistic.
# The alternative hypothesis can be set to "two.sided" (the default),
# "less", or "greater"... 
with(cats, cor.test(Bwt, Hwt))

# Since we would expect a positive correlation here,
# we might have set the alternative to "greater"... 
with(cats, cor.test(Bwt, Hwt, alternative="greater", conf.level=.8))

# Using the formula interface makes it easy to subset the data
# by rows of the data frame... 
with(cats, cor.test(~ Bwt + Hwt, subset=(Sex=="F")))

# For a more revealing scatterplot, try this... 

with(cats, plot(Bwt, Hwt, type="n", xlab="Body Weight in kg",
                                    ylab="Heart Weight in g",
                                    main="Heart Weight vs. Body Weight of Cats"))
with(cats,points(Bwt[Sex=="F"],Hwt[Sex=="F"],pch=16,col="red"))
with(cats,points(Bwt[Sex=="M"],Hwt[Sex=="M"],pch=17,col="blue"))


# Correlation and Covariance Matrices
rm(cats)                             # if you haven't already
data(cement)                         # also in the MASS library
str(cement)
summary(cement)
cor(cement)
cov(cement)
# If you have a covariance matrix and want a correlation matrix... 
cov.matr = cov(cement)
cov2cor(cov.matr)
# If you want a visual representation of the correlation matrix
# (i.e., a scatterplot matrix)... 
pairs(cement)
# or just: plot(cement)

# Correlations for Ranked Data
rm(cement, cov.matr) # clean up
coach1 = c(1,2,3,4,5,6,7,8,9,10)
coach2 = c(4,8,1,5,9,2,10,7,3,6)
cor(coach1, coach2, method="spearman")
cor.test(coach1, coach2, method="spearman")
cor.test(coach1, coach2, method="kendall")
rm(coach1, coach2)

# Simple Linear Regression
data(cats)
str(cats)

# linear regression is done using the lm( ) function
# the formula takes the form DV ~ IV
# It's critical to remember that the DV or response variable
# must come before the tilde and IV or explanatory variables after
attach(cats)
lm(Hwt ~ Bwt)
# So the regression equation is: Hwt = 4.0341 (Bwt) - 0.3567.
# A better idea is to store the output into a data object and
# then to extract information from that with various extractor functions... 
lm.out = lm(Hwt ~ Bwt)               # name the output anything you like
lm.out                               # gives the default output
summary(lm.out)

# Personally, I don't like those significance stars, so I'm going to turn them off... 
options(show.signif.stars=F)
anova(lm.out)                        # shows an ANOVA table

# plot
plot(Hwt ~ Bwt, main="Kitty Cat Plot")
abline(lm.out, col="red")

# Various regression diagnostics are also available.
# a graphic display of how good the model fit is can be achieved as follows...
par(mfrow=c(2,2))
plot(lm.out)



























































