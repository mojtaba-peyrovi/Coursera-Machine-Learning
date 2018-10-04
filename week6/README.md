# Coursera Course for Machine Learning:


## Week 6: (Part 1)

This whole section is about deciding which algorithm can be use for the problem and how to use it efficiently.

For example if we have a linear regression example of housing prices prediction, after applying the linear regression, we will see that there is a huge error or difference between Hypothesis and the training labels, what should we do to improve it?

- One solution is to get more training examples: for example in the case of the housing prices we can make online surveys or having people going door to door and asking questions of people in the neighborhood.
- Also sometimes collection more data wouldn't help any improvement. (we will see some examples) and since collection data takes time and cost, its so important not to waste resources on gathering data that finally don't improve the predictions.
- Another way to improve is to reduce the number of features.
- Sometimes we need to add more features if the current features are not informative enough.
- Sometimes adding polynomial features like X^2, or X1X2, etc. would help.
- Decreasing/Increasing Lmabda.

Unfortunately there is no algorithm to prioritize any of the mentioned methods. People normally follow their own guts and go kind of randomly trial on the methods.

However there are some simple techniques that can guide us to see which of them are not so useful right at the beginning.

These techniques are called __Machine Learning Diagonstic__.

Diagnostic technique is simply a test you can run to gain insight what is/isn't working with a learning algorithm, and gain guidance as to how best to improve its performance.

Diagnostic techniques can take time to implement, but doing so can be a very good use of your time. because you can understand more about the situation and later you will save a lot of time and expenses on directly doing the right technique.

__Evaluating the Hypothesis__:

Imagine we have a set of training data with 10 examples. We can split it into 2 parts, _Training_ and _test_ sets. A typical split between these 2 is __%70__ on train and __%30__ on test data.

In order to have the most natural situation its better to select the 70-30 subsets randomly.

__Training/testing procedure for linear regression__:

* Learn parameter Theta from training data (minimizing training error J(theta)) this J function is calculated based on %70 of training data.
* Then we calculate J(Theta) for test data, where we already calculated Theta from the previous step. (photo: train-test-split-linear-reg)
* If we have classification problem like logistic regression we can see it in the photo here: train-test-split-classification.JPG

__Model Selection:__

How to see which polynomial function can fit better on the training data.

We introduce an new parameter called "d" which is the degree of the polynomial hypothesis for example for linear function d=1, for quadratic function d=2, for cubic function d=3, etc.

Then we can start fitting data from the top with d=1, 2,3, 4, etc. and for each function we have a Theta fitted parameters. we call them Theta(1), Theta(2), ... Theta(10) if we want to try 10 degrees of polynomials.

Then we can use each Theta to find J(Theta) on test data. like: J(Theta(1)), J(Theta(2)), ... J(Theta(10)).

Now, based on which model has the __lowest cost__ we can pick one of them.

Let's imagine we picked the 5th degree polynomial (d=5) it is the most likely hypothesis among all 10 of them to be estimating the values, however its not a fair conclusion on how well the hypothesis generalizes.

Since we are using the test set, our hypothesis is too optimistic to work well. But when we use a new dataset that the model hasn't seen ever, it won't work as well as it did on the test set.

(photo: model-selection.jpg)

In order to evaluate the hypothesis in a fair way, this time we split the dataset to 3 parts:

	* Training test(%60)
	* Cross validation (CV) ==> sometimes called as validation set (%20)
	* Test set (%20)
(photo: evaluating-hypothesis.jpg)

Using these datasets, then we will have 3 different types of errors. J(train), J(cv), J(test)

 (phoro: train-validation-test-errors.jpg)

Now what we need to do is:
```
Instead of using test set to select a model, (model-selection.jpg),
we should use cross-validation set and pick a model based on that.
```

Doing this helps us to preserve test dataset for later when we want to test the model and don't reuse them so, this way our judgment would be more fair and close to reality.

## Week 6: (part 2)

If we run an algorithm and it doesn't work as expected its most of the time the case that we have high bias or high variance. (Underfitting or overfitting)

(Photo: bias-vs-variance.jpg) and (bias-vs-variance-graph.jpg)

* As we can see in the chart for bias and variance, if we have high bias, which is corresponding to the left side of the chart, we will have both train and cross-validation errors (J) high and actually these two error values are close.
If we have this case then we can conclude that the learning algorithm is suffering from __high bias or underfitting__.
* On the contrary, when we have J(train) very low and J(cv) much higher than J(train), it means that our learning algorithm is suffering from __high variance or overfitting__.

(photo: optimal-value-for-bias-variance.jpg)

__Remind:__ Regularization helps overfitting.

Now let's see how can we analyze bias/variance with regularization.

check photo: linear-regression-regularization.jpg

As we can see, if we have a big lambda, we will have all thetas heavily penalized and they will get almost zero compared to the big regularization term.

Then we will have h(x) = Theta(0) because its not included in regularization term.
and since the chart for h(x)=Theta(0) is a straight horizontal line, then we will have __underfitting__ problem. (High bias)

On the other side if we have lambda=0 then we won't have any effect by regularization and the model would be overfitted or __High variance__.

It seems like if we pick the lambda between those two values then we may have a good regularization. But how to pick a good lambda?

We can pick a set of values starting from 0 and then 0.01 and try to multiply by 2 and try the next one until we get a value like 10. like the photo:
(photo: choose-lambda.jpg)

Now we can use these lambdas and minimize the cost function for each of them and find the thetas that minimize the J.

Then we find J(cv) for each case using the calculated thetas.

And finally we pick the lambda that returns the lowest J(vc).

The last thing is to use the picked Theta and calculated J(test) to see how it can generalize with the test data.

to generalize this:

* when we have big lambda we have high bias problem. (underfit) So, J(train) and J(cv) will increase when lambdas increases.
* On J(cv) when we have small lambda it means the regularization wouldn't make a big difference and we will have the risk of overfitting.

(photo: J-train-cv-per-lambda-graph.jpg)

As we can see in the photo we need to find a lambda that minimizes the values J(cv).

__Learning Curve__: A very useful technique to see if the model is suffering from high bias or high variance or both.

This curve is based on error J(train) and J(cv) versus the samples size(m). But m is constant. We should artificially use less samples for example 10 out of 100 and then plot.
(photo: learning-curve.jpg)

* As we can see in the photo, for small values of m its easy for the learning model to  find a good fit to the data but as we get m bigger and bigger it would be harder to find a curve that passes through all points and the cost will get higher.
* On the other hand when we have larger data size the cross validation data will do better and get lower error.

Let's see what happens to the learning curve if we have high bias.

If we want to for a linear model to some data that won't be able to fit in a line, then the J(cv) would get flat so easily in leaning curve because there won't be much room for improvement. and training cost J(train) also would increase based on "m" but again flats easily as it will be doing similar to cv data. So we end up having the similar values for J(cv) and J(train).

(Photo: high-bias-learning-curve.jpg)

What the photo also shows is important:
```
If the learning algorithm is already suffering from high bias,
adding more data wouldn't improve the performance.
```

If we have high variance, the more data we have the harder it will be to fit the data but still the cost of training would be fairly small.

Also J(cv) will decrease a bit but still too high as the model can't predict well. The key to be able to guess there is a high variance is the __big gap between J(cv) and J(train)__ as we can see in the photo:  high-variance-learning-curve.jpg

### Debugging the Learning Algorithm:

Here is all the original solutions we learned in the beginning of this week. Let's see which one helps in which situation:

* Getting more training examples: would help fixing _high variance_.
* Trying smaller set of features: Again would help fixing _high variance_.
* Trying to get additional features in most of cases will help fixing _high bias_ because high bias shows that the model is too simple.
* Adding polynomial features: also another way to help _high bias_ problem.
*  Decreasing lambda: will help fixing _high bias_.
*  And Increasing lambsa fixed _high variance_.

#### Neural Network and Overfitting:

If we have few hidden nodes and hidden layers, it normally gets into __underfitting__, but it would be computationally cheaper.

On the other hand if we have a lot of hidden layers or hidden nodes, the chance of having the model __overfitting__ and its also computationally more expensive.

In the case of overfitting we can use regularization to improve it.
```
In most cases, having the larger neural network with regularization,
works better than having a small neural network.
```
Sometimes we don't know how many hidden layers we need, again we can try the model with 1,2,3,4 etc. layers and compare the cost of J(Theta) and pick the minimum value.
