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

### Normal Equation
---
__Normal Equation__: sometimes instead of iterating gradient descent algorithm, we can find teta(parameters) analytically in one step.

* How we do it? well, in mathematics in order to find minimum of a function we just calculate the derivative and set it to zero and calculate the variable.

* But in case of machine learning and linear regression the parameter or teta is not a single number, it is a vector of n+1 features.
* One way to deal with the vector of features we can take partial derivate of j function based on each feature and one by one set them to zero and calculate tetas or parameters.

* another way is making a matrix of all features and their values in all examples and we add a column of ONEs for x0 values. we call this matrix X. Then we make a vector of all lable values and we call it y. this way here is the value of teta to minimize z function:
```
teta =(XT * 8X)^-1XT*y       (XT:Transposed matrix of X)

for calculating it in Octave: pinv(X'*X)*X'*y

in octave:   
-X' means X  transposed
-pinv() function calculates the inverse.
```

When we use normal equation instead of gradient descent we don't need to do __feature scaling__. so features can be in any scale.

__Gradiant Descent vs Normal Equations (Only for linear regression):__

- in GD we need to chose learning rate alpha while in NE we don't.

- in GD we need to have many iterations while in NE we don't need any iteration.

- when we have too many features (large n), GD works so well while NE is so slow and costly.
- (__the idea about too many features__:  when we have features more than 10,000 we can start using GD, otherwise for the features less than that, NE works well)

**_normal equation doesn't work for classification and some other algorithms. for those algorithms we need to used gradient descent._**

(Check a photo called normal-equation.jpg)

### Normal Equation Noninvertibility (Optional)
---
Sometimes the XT*X is non-invertible and cant be inverted (it's called _singular_ or _degenerate_). in 2 cases it is possible to happen:

1- redundant features: when one feature is a linear function of the other feature for each if a feature is square meter and the other is square feet, their relationship would be always: X1 = (3.28)^X2

**_the solution is to see if there is any redundancy in data and try to resolve it by deleting one of the features._**

2- when m<=n  when we have 10 samples and 100 features.

**_in this case we can delete some features or use a technique called  Regulization._**
