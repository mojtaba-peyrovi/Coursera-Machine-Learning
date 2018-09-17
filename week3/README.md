# Coursera Course for Machine Learning:


## Week 3: (Part 1)

### Classification
---
We use classification methods for the situations where the target has discrete values.

* _sometimes we call 0 in target class as __negative class__ and 1 as __positive class___.

* _Also sometimes we say class 0 is the absence of something and 1 is the existence of it.

If we use linear regression hypothesis to estimate   the class, we end up having a line just like linear regression but we can define the threshold of 0.5 and say the values less than 0.5 are considered 0 and higher will be one.

However, this algorithm only works in some cases and in most of the cases it wouldn't work. (see the photo called linear-regression-fault.jpg)

__IMPORTANT__: In classification algorithms h(x) is always between 0-1

### Hypothesis Representation
---
In classification problems we cal the model __Classifier__.

When we want to define the hypothesis for classification we have the same function as linear regression ( theta' * X) except that we introduce a new function called __Sigmoid Function__ or __Logistic Function__ which is like this:
```
			    g(z) = 1 / (1 + e ^ z)   ==> and h(X) = g(theta'*X)
```

_Alternitively_:

								h(X) = 1 / (1 + e^(theta'*x))

* fitting data to the model means the process of finding the proper thetas.

(Check a photo called classification-hypothesis.jpg)

The meaning of h(x) is the estimated probability that y=1 on input x. or:
```
						    	h(x) = p(y=1|x;theta)
```

X is parameterized by theta.

As we can conclude based on probability rules:
```
					P(y=1|x;theta) +  P(y=0|x;theta) = 1
```
### Decision Boundary
---
In general we can consider whenever the h(x) or p >= 0.5 we predict y=1 and for h(X) < 0.5  we can predict y=0.
* the sigmoid function shows that in g(z) whenever z >=0 then the sigmoid value is bigger than 0.5. Using this, we can conclude that for  classification prediction to be 1 (y=1)  we must have:
```
										theta'*X >= 0
```
Decision boundary:
```
										Theta' * X = 0
```
(Check a photo called decision-boundary.jpg)

__Non-linear decision boundaries:__

for seeing how it works we can define a hypothesis as this:

h(x) = g(thetea0 + theta1 * x1 + theta2 * x2 + theta3 * x1^2 + theta4 * x2^2)

by giving thetas the values of  -1, 0, 0, 1, 1 we can see that the decision boundary will be like this:

                 x1^2 + x^2 = 1  ==> a circle around (0,0) of radius 1

(Check the photo called non-linear-decision-boundary.jpg)

## Week 3: (Part 2)
### Cost Function
---
The cost function can be derived from linear regression. we can write it this way:
```
cost(h(x),y) = 1/2(h(x)-y)^2
```
we need to minimize this function but we remember that h(x) is equal to 1/2(1+exp(-theta(T)*x)

When we plot the cost function using the logistic regression definition, we end up having a __Non-Convex__ plot, which means it has so many local minimums and there is no guaranty that gradient descent would find the global minimum.

What we need is to find a __Convex__ function that looks like a bowl with only one minimum.

(check a photo called cost-function-non-convex.jpg)

What we can conclude is, the squared cost function is not a good choice for cost function and we need to come up with something else.

Here is the new cost function:

```
1- Cost(h(x),y) = -log(h(x))  if   y=1

2- Cost(h(x),y) = -log(1-h(x))   if  y=0
```
(for first situation check a photo called new-cost-function-y-one.jpg)
(for second situation check a photo called new-cost-function-y-zero.JPG)

### Simplified Cost Function and Gradient Descent
---
We can write the two lines of cost function in one line like this:
```
cost(h(x),y) = -ylog((h(x))-(1-y)log(i-h(x))
```
And we can put this in J as cost function and then use gradient descent to minimize it.
(Check a photo called gradient-descent.jpg)

We now conclude that the cost function and gradient descent algorithm are all the same for linear regression and logistic regression, the only thing changed is the defintion of h(x).

* Again for this algorithm we can vectorize the calculation instead of using for loops.

* Feature scaling is something we can use to make gradient descent converge faster, just like linear regression.

### Advanced Optimization
---
There are other ways and sometimes more sophisticated but effective compared to gradient descent, such as :
```
- Conjugate gradient
- BFGS
- L-BFGS
```
* Advantages of these algorithms:

1- no need to manually pick learning rate alpha.

2- often faster than gradient descent

* Disadvantages:
- They are more complex

In Octave there is a function called fminunc() that can use these algorithms and automatically minimize the cost function. This function doesn't work if the parameter is only one number, it has to be at least a 2x1 vector.

(Check a photo called octave-implementation-other-ways.jpg)


## Week 3: (Part 3)
### Multiclass Classification One-vs-all
---
Some examples of multiclass classification:
* Email foldering/tagging: Work, Friends, Family, Hobby.
* In medical exams: Not ill, Cold, Flu.
* Weather forecast: Sunny, Cloudy, Rain, Snow.

The algorithm we use is called
__One-vs- all__ or __one-vs-rest__.

This is how it works:

```
We convert the dataset to multiple biinary classification cases where
each time we make one of the classes 1 and the rest of the dataset 0.
And we keep doing it for each class.
```
(Check a photo called multiple-classifiers.jpg)

At the end we need to pick a classifier that maximizes the value of h(x).
