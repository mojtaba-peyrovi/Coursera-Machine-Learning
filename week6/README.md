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
