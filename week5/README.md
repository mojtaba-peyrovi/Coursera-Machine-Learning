# Coursera Course for Machine Learning:


## Week 5: (Part 1)

Here is a lesson about a learning algorithm for fitting parameters to a neural network. In order to do this as usual we have to start with cost function.

__Notations__:

L: total No of layers in a network.

s(l): number of units in layer l excluding the bias unit.

__Important__: the output layer's units always equals the number of classes. We show this with K.

* for binary classification, the output layer is only ONE which is equal to h(x) and its a number.

* when we have multiclass classification, the output  or h(x) will be K vectors which are K dimensioned each. S(l) = K

(Photo: intro.jpg)

The cost function for classification neural network is the generalized version of what we used for logistic regression.

__Important__: we don't include theta(0) in regularization as we did before.

(photo: nn_cont_function)

**_Explanation about nested summations in cost function_**:

The double sum simply adds up the logistic regression costs calculated for each cell in the __output layer__.

The triple sum simply adds up the squares of all the individual Thetas in the entire network.

The i in the triple sum does not refer to training example.

__Backpropagation algorithm__:

(Important lession)

We use this technique to minimize the cost function.

based on the cost function formula our ultimate goal is to find  Theta matrix in order to minimize j(Theta). So, it means that we need to compute J(Theta) and partials derivatives of J based on all thetas.
(photo: gradient-computation)

_Intuition_: we need to calculate the error of node j in layer l and we call it delta(l)j.

for each out put unit in __OUTPUT LAYER__ we say:
```
Delta(l)j = a(l)j - yj
```
for example in the example we have 4 layers and we say:
```
Delta(4)j = a(4)j - yj
```
yj is the jth element of the vector called y that has the right answers in training set.

A better approach to this is to have a vectorized implementation and say:

```
Delta(4) = a(4) - y
```
_Important_: the dimension of all vectors above are the same as the number of output units in the output layer.

In the coming photo there is a formula to calculate the error for each layers' units.
g'(z(3)) means:
```
a(3) .* (1-a(3))   where 1 is a vector of ones same size as a(3)
```
It is the same for g'(z(2))

__NOTE:__ We dont have Delta(1). Because layer one corresponds to the features and has no error.

* the word Backpropagation comes from the fact that we start computing Delta (errors) from the last layer and then come back and calculate the delta of previous layers.

The whole point for calculating Deltas is to find the partial derivative values that based on deltas we can calculate them like this:

```
a(l)j * delta(l+1)i
```
(photo: backpropagation.jpg)

The vectorized implementation of Delta:
```
Delta(l) = delta(l) + delta(l+1) * a(l)'
```

(photo: bp-algorithm.jpg)

__Forward Propagation__: It refers to the process of calculating all layer units by multiplying thetas into x's and implementing sigmoid function on them to calculate a's and going through all layers to finally finding the final answer.

Forward propagation calculation is so similar to back propagation's just the direction is from left to right for forward-prop and right to left to back-prop.

(photo: what-is-bp-doing.jpg)
