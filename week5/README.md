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

## Week 5: (Part 2)

intro: (photo: unrolling-matrices-to-vectors-idea.jpg)

In order to vectorize a matrix we can say:
```
A(:) ==> if A is of dimension 4x5 it will be converted to 6x1
```
And if we want to return them back to be a matrix we can say:
```
reshape(A(:),4, 5)  ==> the vector made in previous example now gets back to be a 4x5 matrix.
```
We can also make multiple matrices into one vector:
```
D = [A(:); b(:); c(:)]
```

(photo: unrolling-example.jpg)

In order to implement the learning algorithm we need to keep unrolling initialTheta to a vector to pass into fminunc(the minimizer function).

_AGAIN_:
* If we have initial theta1, theta2, theta3, first we unroll them to get initialTheta vector.
* Then we use this vector in fminunc(@costfunction, initialTheta, options) function.

* In order to compute costFunction we need to have ThetaVec which is all parameters unrolled as a long vector.
* Then reshape thetaVec to get theta1, theta2, theta3, as matrices again.

* Then we use forward prop/back prop to compute D1, D2, D3 (gradients or derivatives) and J(Theta).

* Finally we unroll all D1, D2, D3 into one vector called gradientVec.

(photo: learning-algorithm.jpg)

__Gradient Checking__:
It is a way of checking if our algorithm is really decreasing the cost function or not. For each complicated neural network model we need to run this to make sure it works properly.

It works like this:

If we have j(Theta) then we can add an epsilon to theta and deduct epsilon from it and calculate the J of them then the difference between them divided by the sum of the epsilons should be so close to j(theta).

(Photo: numerical-estimation-of-gradients.jpg)

Epsilon can't be so small becuase it can cause numerical problem. something like 10 ^ -4 can be fine.

it is called _Two Sided Estimate_ while if we just do it with theta+epsion and not minus epsilon then it would be called _One sided Estimate_. Two sided is more accurate.

When Theta is a vector( Unrolled version of all Theta matrices) we can estimate the partial derivative for each theta by implementing the same formula and for each theta we add and subtract an epsilon to the same theta and dont touch the others.
(Photo: estimation-theta-vector.jpg)

We can implement it in octave like the photo:

(photo: grdient-checking-implementation.jpg )

n is actually the number of elements in the unrolled thetas vector.

The outcome of this algorithm is a vector of estimations for gradients that we call it gradApprox and it has to be close enough to DVec which is the vector of gradient we calculated using back propagation method.

(photo: gradient-checking-implementation-note.jpg)

__Theta value random initialization__:

Initializing Zeros as we did in logistic regression would not work in neural networks.
 (photo: initial-theta.jpg)

__Symmetry Breaking__: In this method we initialize each Theta individual value to random value between [-Epsilon, +Epsilon]

This epsilon is different from the epsilon we used for gradinet checking algorithm.

(photo: symmetry-breaking.jpg)

__Conclusion__:

* When we have 10 classes for example each class would be a vertical vector of 0-1 values where the one with value 1 has zeros everywhere except the first index, and 5th index ax 1 will show the values of 5.

 * The number of input units will be equal to the number of X (features)
 * And the number of output units will be equal to the number of classes (y)

* For choosing the hidden layers, the default is to have one hidden layer, and if we have more than one hidden layer its the norm to have the number of units in hidden layers equal.

* deciding how many hidden units, the more hidden units the better but having a lot of them would make the computation expensive and time consuming.

* The number of hidden units in each hidden layer can be between the number of input units and 2-4 times of the input units.

(photo: network-architecture.jpg)

#### Training model steps :
There are 6 steps we can see in the photos:

(photo1: training-1-4.jpg)

J(Theta) in neural network using gradient descent or some advanced method are non-convex and can be stuck in local minimum but in most of the cases the result is reasonable.

(photo1: training-5-6.jpg)
