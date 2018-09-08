# Coursera Course for Machine Learning:


## Week 2: (Part 1)

Accessed Matlab online and waiting for the end of this week to read more of documentation on how to submit the assignments.

## Week 2: (Part 2)

### Multiple Features
---
__some notations__:

n: number of features

m: number of rows or examples


X(i): It is the vector of all features of exmple i out of m examples. X is an n dimensional vector.


X(i)j: means jth feature of ith example's features vector.


* Our hypothesis for 4 features will be h(x)=T0+T1(x1)+T2(x2)+T3(x3)+T4(x4)

__**Important**__: When we have minus teta it means that the associated feature will have negative effect on the target and if we have positive teta it means the associated feature will affect in a positive way to the target.


for convenience of notation we say always x(i)0 = 0

When we do this, we will have our features vector as a ZERO INDEXED vector.

then we will have our parameters as a ZERO INDEXED vector same size as features vector.


By defining our features as a vector (X) and our parameters as a vector (Teta) now we can say:

h(x) = (teta)T * X  ==> means teta vector transposed and multiply it to X which is features vector.

The dimension of X and Teta is (n+1)x1


This mode is called __Multivariate Linear Regression__.

(Check a photo called multiveriate-regression.jpg)

### Gradient descent for Multivariate Regression
---

In this episode we found out that we can come up with one formula for all partial derivatives in the gradient descent formula and since we have x(i)0 = 1, for all cases we have a formula that we can see in a photo saved in the folder called gradient-descent-derivative-formula.jpg.

### Gradient descent for Multivariate Regression in practice 1
---
__feature scaling__: If the features all take similar range of values, it make the gradient descent algorithm converge more easily.

If we have one large scaled feature and one too small scaled variable, the contour plot of the cost function would look so tall and skinny and it makes the gradient descent move so much more back and forth and takes a lot longer for it to find the global minimum.

* __How we do feature scaling__?

    We try to make every variable into approcimately between -1 and 1. They don't have to be necessary between -1, 1 they must be small enough like -3 to +1 or -2 to +0.5, etc.
    Also they shouldn't be so much smaller than 1-to 1 for example -0.00001 to +0.00001 is equally bad.

```
Seems like all values between -3 to +3 is acceptable.
```

   In order to make feature scaling one of the techniques is to divide all values to the maximum.

**__Mean Normalization__**:  it is also another technique to get values become the same scale. The way we do it is to replace xi with:
```
(xi-mean)/maximum.
```
We dont apply it to x0 which is always 1.

Another formula for normalization is
```
(xi-average)/(max-min)  
```
### Gradient descent for Multivariate Regression in practice 2
---

__Debugging__: The rule is that J or the cost function has to reduce after __EVERY__ iteration.


 A graph of J per iterations shows if the cost function is reducing as we iterate more or not.

 We can design automatic convergence test, but the graph sounds easier and more reliable because we can't easily find the threshold of how much decrease is considered acceptable or not.

 *  If the plot shows that the j is increasing as we iterate more it means that the gradient descent is  not working. and usually means that we need to pick a smaller alpha.

* Also simetimes we have J plot keeps going up and down several times, it's also a sign that Alpha has to be a smaller amount.
*  If Alpha is so small it makes the conversion so slow.

* A good approach is to keep changing alphas to the scale of ten. for example we can start with 0.0001, then 0.001, then 0.01, then 0.1 and 1.

__(check a photo called gradient-descent-j-per-iteration.jpg)__

### Features and Polynomial
---

* Sometimes we should come up with new features that are more likely to predict the label. for example instead of using the width and depth of a house we can make a new feature and call it the area by multiplying the depth into the width.


* Some times we may have to fit a non-linear regression line and in order to it maybe we need to have X^2 or x^3 features. When we have this situation we can define x^2 as a new feature and x^3 as a new feature and again keep doing the gradient descent but we need to be careful about the feature scaling because the results of features to the power of 2 and 3 would be so much bigger than x itself.
