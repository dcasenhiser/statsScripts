
##Factor Analysis##

##R Packages##
install.packages("corpcor") #
require(corpcor)
install.packages("GPArotation") #for rotated factor loadings
require(GPArotation)
install.packages("psych") #cortest.bartlett(), KMO(), principal() etc/
require(psych)

##Load data and call it raqData
##Create a correlation matrix
raqMatrix = cor(raqData) #if there is missing data: cor(dataSetName,use="pairwise.complete.obs")
round(raqMatrix,2) #round the data to 2 decimals to make it easier to display
##Run Bartletts to make sure it's not an identity matrix (in which case there are some relationships among the variables) -- should be sig diff from zero
cortest.bartlett(raqData)
## Run KMO to test adequacy of the sample size: .5 = fair, .7 = good, .8 great, .9+ awesome
KMO(raqData)
## Get determinant of correlation matrix |R|: should be greater than .000001 to show that we do not have a problem with multicollinearity
## If |R| is less than .000001, then look at cor matrix and eliminate items that have correlations that are too high -- they are "identical"
det(raqMatrix) # can also run det(cor(raqData))
##Use principal components analysis to extract factors
pc1 = principal(raqData,nfactors=23,rotate="none") #h2 are communalities (equal 1 since we've extracted all the variance)
pc1 #u2=amount of unique variance for each variable (essentially 0)
## ss loadings are the eigenvalues -- the amount of variation explained by each linear component
## ss loadings are stored in pc1$values
## look for eigenvalues > 1
## plot the values for a skew plot
plot(pc1$values, type="b")
## Revise your model to inclde only the selected number of factors (4 in this case)
pc2=principal(raqData,nfactors=4,rotate="none")
pc2 #communalities tells how much variance can be explained by the 4 retained factors
## Check the correctness of the analysis: fit should be greater than .95
## Rotate your factors: varimax if uncorrelated factors; oblimin or promax if they are expected to be correlated
pc3=principal(raqData,nfactors=4,rotate="varimax")
pc3
print.psych(pc3,cut=.3,sort=TRUE)
## since all the factors seem to relate to fear -- probably need a oblimin rotation
pc4=principal(raqData,nfactors=4,rotate="oblimin")
print.psych(pc4, cut=.3,sort=TRUE) #note we now have correlations among factors reported -- if unrelated these should be near 0 t/f this is probably the correct solution
