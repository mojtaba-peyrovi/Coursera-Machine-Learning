# Coursera Course for Machine Learning:


## Week 10: (Part 1)

__Gradient Descent with large datasets:__

"It's not who has the best algorithm wins, it's who has the most data!"

Working with large datasets is great but it has its own unique problems, especially computational problems.

Imagine we have m=100,000,000 samples. then having one iteration to calculate the partial derivative would be so costly and time consuming.

Instead we can pick 1000 random samples among all 100,000,000 and do a sanity check on how 1000 samples would work. In order to do this we can plot the value of J (cost function) as a function of m. we do it for both CV and Test data and if it looks like the graph on the left side of the photo: variance-bias.jpg  then we can see we have high variance with 1000 and most probably if we add more examples, it would improve the results. but if it looks like the graph on the right side, it means it has high bias and adding more than 1000 samples wouldn't help much.

#### Stochastic Gradient Descent:

In a normal machine learning algorithm we try to find a cost function and try to use techniques such as gradient descent to minimize the cost function. However, in large datasets gradient descent would be so expensive and not cost-efficient.

There are some ways to make algorithms on small datasets and scale them to large datasets.

__When we use all the samples for calculating gradient descent iterations, we call it Batch Gradient Decsnt.__

when we use big data it doesn't make sense to use batch gradient descent. so there are techniques that look at only a single training example.

(photo: linear-regression-gradient-descent.jpg)

What Stochastic gradient descent does, is it first shuffles the whole dataset. then calculates the cost of examples one by one.

What is does, it doesn't go through all samples for each iteration of gradient descent.

(photo: stochastic-gradient-descent.jpg) , (stochastic-graph.jpg)

#### Mini Batch Gradient Descent:

This is another method that sometimes can even be faster than stochastic gradient descent.

It is something between batch gradient descent and stochastic gradient descent. In this method for each iteration we pick b number of samples. b can be something like 10 samples. typically we say it can be something between 2 to 100.

(photo: mini-batch-1.jpg)

In mini-batch gradient descent, it is so important to have the proper __VECTORIZATION__ and if we do so it can outperform the stochastic gradient descent.

__How to know that gradient descent is converging in stochastic gradient descent?__

In batch gradient descent we have to plot J as a function of number of iterations.

In stochastic gradient descent what we can do, is to calculate the cost of each sample at the same time with the learning, before updating Theta.

Then we plot the cost for each 1000 iteration to make sure its decreasing.
(photo: check-for-convergence.jpg)

In the next photo there are some graphs that show how the J per iteration graphs would possibly look like.
(photo: convergance-graphs.jpg)

__IMPORTANT:__ as we use the stochastic algorithm and it converrges towards the global minimum, it may get close to it but never exactly match to it. in order to have the stochastic get exactly there, we should decrease the value of learning rate Alpha overtime.

We can see in the photo stochastic-gd-learning-rate.jpg we can have alpha calculated as it is shown in the photo. const1, const2 are to contants that we may have to play around with them a little bit.


## Week 10: (Part2)

__Online Learning Setting:__ It is a new large-scale machine learning setting. It helps us model data that are continuously being fed to the online system and we want to have an algorithm to learn from that.

Nowadays, big websites use these types of algorithms to learn from the flood of user data coming to their websites on a daily basis.

Here is how it works: first it never stops learning.

Then for each exmaple: (X,y) X can have multiple features such as the price, the destination, the origin, etc. and y is the lable 0 or 1 whether the user buys the service or not. (in the example of shipping website) then the website will run the algorithm and learn from that single example and then throws it away.

So we don't have any fixed dataset.

- What is important is, when we have a small website, we dont need to use online machine learning system, instead it's better to save all the information in a database and use learning algorithm based on that.

#### Map-reduce and Parallelism:
sometimes the alorithm and data are so big to run on one computer.

The map-reduce idea is to split the dataset into different smaller datasets. Imagine we have one computer for each of these datasets. then the first computer will work on the first set of data and second one gets the second set of data, and so on. then in order to calculate the batch gradient descent, we have each computer calculate a portion of the summation and save them as a temporary variable. Then those computers send that computed temporary variables to the main server and the server will combine them together.
(photo: map-reduce-idea.jpg)

Good news is, when we have one computer even, we can have different computational cores within the computer and still use map-reduce to make the algorithm run faster.
