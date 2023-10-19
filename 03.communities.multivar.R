#useremo vegan e overlap

library(overlap)
library(vegan)
data(dune) #a function that recalls data
#to look at data we can use different methods
dune
head(dune) #it shows the first 5 rows generally
tail(dune) #final part of the dataset

ord <- decorana(dune)  #finds the main actors or gradients in large, species-rich but usually sparse data matrices
ord

#decorana --> Performs detrended correspondence analysis
# and basic reciprocal averaging or orthogonal correspondence analysis.

#let's see the lenght of the first dca
ldc1 = 3.7004
ldc2 = 3.1166
ldc3 = 1.30055
ldc4 = 1.47888

total = ldc1 + ldc2 + ldc3 + ldc4
#percentages
pldc1 = ldc1 *100 / total
pldc2 = ldc2 *100 / total
pldc3 = ldc3 *100 / total
pldc4 = ldc4 *100 / total

#sum of the percentage
pldc1 + pldc2
#they explay 71 % of the obserations

plot(ord)
