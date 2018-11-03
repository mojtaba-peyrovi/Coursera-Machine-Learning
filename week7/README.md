# Coursera Course for Machine Learning:


## Week 7: (Part 1)

__Support Vector Machine(SVM)__:

In order to learn how it works we imagine the typical logistic regression definition, with sigmoid activation function
```
h(x) = 1/(1+e^-theta'*X)   where z = theta'*X
```
Then two cases would happen:
```
If y=1 we want the hypothesis to be close enough to 1, and z>>0 which means
z so much bigger than 0
```
AND
```
If y=0 we want the hypothesis to be close enough to 0, and z<<0 which means
z so much smaller than 0
```
(photo: logistic-regression-review.png)

as we can see in the next photo called cost-function-for-each-example.png, the cost of example is written there that means how much each example contribute to the cost function.

Then let's plot the cost amount based on z = theta'*X in the case y=1 and y=0. As we can see when y=1 the second part of the formula will be zero because (1-y=0) and when we have y=0 the first part will be zero.


Now we call each of the functions in magenta as:
```
cost1(z) meaning cost of z if y=1 and cost0(z) meaning cost of z if y=0
```
next photo is support-vector-machine.png and we can see that how the svm will be calculated. In this photo we we got rid of i/m because its a constant and doesn't change the data the result in finding the minimum.

For requlization we do it a bit differently. instead of saying A+lambda*B we introduce C and we say CA+B. it is another way for trade of between how much we care for either first or second terms.

Also we can say C will have a role similar to 1/lambda

(photo: svm-hypothesis.png)


Sometimes people refer SVM as *__Large Margin Classifier__*. We are going to see why.

as we can see in the photo called SMV-large-margin.jpg the cost1(z) and const0(z) are plotted and if y=1 we want z to be greater than 1 (in logistic regression we said that's good enough if z is bigger than zero) in fact we give it some margin. also for y=1 instead of saying z<0  we say z has to be less  
than -1 so we added another margin for that.

In order to see whats the difference we imagine C is so big for example 100,000.
then we would like to have the second part multiplied to C to be zero to minimize the cost.

(photo: SVM-decision-boundary.jpg)

Check the photo called svm-decision-boundary-2.jpg  as we can see when we have separable samples and we can pass so many decision boundaries to separate samples as we see the green one and magenta one, however the black one comes from SVM that is doing this job better. why?
Because it has more margin between the line and the closest samples.
Thats the reason why SVM sometimes is called Large Margin Classifier.

Sometimes we will have outliers (samples that are so much out of the boundary) then we dont want the SVM to change the decision boundary based on one outlier sample. It happens when we have a large C, otherwise SVM will know not to care of every single outlier and get confused. So, normally its not a good idea to have a big C.

(photo: SVM-outliers.jpg)

##### OPTIONAL PART:

__Vector Inner Product__:


when we have u = [u1 u2] and v=[v1 v2]  then:
```
U(T) * V is called the inner product of two vectors.
```
Watch the tutorial for the rest.

## Week 7: (Part 2)

__Kernels__: In this tutorial he is going to adapt SVM in order to make complicated non-linear classification classifiers. This technique is called Kernels.

(photo: non-linear-decision-boundary.jpg)

In the photo he called each combination of features in the hypothesis as 'f'.

The technique is to pick up 3 points randomly and manually and call them landmarks. and we show them by L1, L2, L3.

Then we will define 'f' values as a sort of similarity between example X and landmark L.

there are different types of similarity functions. The one he is using in this tutorial is called 'Gaussian  Kernel'.

(photo: kernel-1.jpg)

#### _what is important is, to calculate the similarity function we need to sum up the difference between all features of X and L._

(Photo: Kernels-and-similiarity.jpg)

As we can see in the photo, when X is close to any L, the value for f would be close to 1, and when it is far from L, the value of f will be close to 0.

__IMPORTANT__: these 'f' values we are making are actually new features and for each landmark we will have a feature. for example for 5 landmarks we will have 5 features. Each feature will be calculated the way we did based on the similarity function.

(photo: kernel-example-1.jpg)

#### How we choose the landmark points?

Answer: Actually the landmarks would be the same points EXACTLY as the training examples. So, if we have 'm' training examples we will have 'm' landmarks.

__IMPORTANT__: f(0) is always equal to 1.

(photo: SVM-with-kernel.jpg)

__How to pick C in SVM?__ (C=1/lambda)

```
large C happens when we have lower bias and high variance. because it means small lambda.
```
AND

```
small C corresponds to higher bias and lower variance. because it means big lambda.
```
In order to see how to pick other parameter (Sigma^2) check this photo:
(SVM-parameters.jpg)


## Week 7: (Part 3)

For SVM we dont normally write the whole software, instead we use packages like 'Liblinear' or 'Libsvm' , etc.

__Important__: sometimes we dont use any kernel, and we call it "__Linear Kernel__".

```
when we have large n (features) and small m (samples) we can use linear kernel
```

But if we want to use kernels one of the functions would be Gaussian kernel:

```
When n is small and m is large Gaussian may work well
```

#### IMPORTANT: Before using Guassian Kernel sometimes we need to do feature scaling, when we have features with big differences in numbers.

__Mercer's Theorem__:
similarity functions we use have to satisfy a technical condition called Mercer's theorem to make sure SVM packages optimization run correctly and do not diverge.

__other kernels__: check photo: other-kernels.jpg

__Logistic regression vs SVM:__ check photo: logistic-regression-vs-svm.jpg.
