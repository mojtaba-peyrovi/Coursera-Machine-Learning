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
