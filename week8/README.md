# Coursera Course for Machine Learning:


## Week 8: (Part 1)

__Unsupervised Learning__:

Clustering is one of unsupervised learning algorithms.
In unsupervised learning, we don't have any labels. it means our learning data are not pairs of (x,y) but they are just a vector of X values, then the algorithm will have to find some structure in the data.

__Some cases we use Clustering techniques for:__

1) Market segmentation
2) Social network analysis: finding coherence is different groups of people, like who has read an article, who has sent email, etc.
3) Organize computers in a data center and decide how to design data center and which computers better to be in the same group.
4) Astronomy: finding an structure in galaxies formation.

#### The most popular algorithm for clustering is K Means algorithm:

How it works?

First, we pick two random points and call them __Cluster Centroids__. (why two? because we want to find two clusters. if we want more we need more centroids.)
(photo: k-means-clusters.jpg)

K means is an iterative algorithm with two steps:

1) Cluster assignment: for each point in data depending on which centroid the point is closer to, it will be assigned to one of the centroids. (photo: k-means-cluster-assignment.jpg)
2) Move centroids: now we move the centroids to the average of the associated assigned points.

we keep doing these 2 steps and finally we get to the point that it doesn't improve anymore, so we cluster the data successfully.

K-means inputs are K as the number of clusters, a training set of X which is one dimensional (no y)
(photo: k-means-inputs.jpg)

the algorithm is like this:

for each example (i=1 to m) we define c(i) which is the index of the closest centroid to x(i).
it will calculate the distances between the specific point and all centroids and finds the index that minimizes the distance.


The next step is for each centroids (from 1 to k) we make the centroids equal to the average of the points assigned to the cluster.

(photo: k-means-explanation.jpg)

__IMPORTANT__: Dont forget that each of x(i) values and the centroids are (n) dimensional vectors.


##### If a centroid has no assignment to it, we can eliminate it and then we will have k-1 clusters. (sometimes people re-initialize that point but more common way is to delete it)


__Example__: when we have a list of people's data of their heights and weights, then we want to see which people will fit to S, M, L sizes. see the results in the photo called: market-segmentation-example.jpg)


We use capital K to show the whole centroids and lowercase k to show one centroid.

K-means clustering also has a cost function J that we see in the photo called: k-means-cost-function.jpg)

the cost function is sometimes called DISTORTION.


__WRT: means with respect to__


## Week 8: (Part 2)

Second algorithm for unsupervised learning is called "Dimensionality reduction".

__One of the most important reasons we need to have this alogorithm:__
It helps for data compression and having data take up less space, also it can help the other learning algorithms run faster.

In other words, say we have two features that measure the same length in cm and inches, we have to dismiss one of them. or when we have a project that 3 different teams are working on and we get data from different sources, we might have to find redundancies and eliminate them.
(for more info check the slides.)

## Week 8: (Part 3)

__Principle component analysis(PCA):__
It's goal is to lower the dimension again just like the previous algorithm. we want to formulate how PCA works.

When we have a 2d dataset and want to do PCA on it, we have to have a line similar to linear regression that passes the closest to the points. and then we project all the points on the line.

The distance between each point and the line is called __Projection Error__.

We want to minimize projection errors.

__Important__: before applying PCA we should use normalization and feature scaling to make sure two features x1,x2 have mean of zero and comparable values.

(photo: PCA-line.jpg) and pca-problem-formulation.jpg

-  The difference between linear regression and PCA is that in LR we want to minimize the vertical line between points and the line, while in PCA we want to minimize the orthogonal line between the line and points.

- Also in LR we have a special feature that we call y and we try to predict it, whereas in PCA we treat all features equally.

(photo: pca-vs-lr.jpg)

##### How to apply PCA?

first we need to do data pre-processing. it includes feature-scaling and mean normalization.

Then we need to think how to find the two items below:

- the lower dimension vector(s)
- the value of z for each example. z(i) for example x(i)

(photo: pca-algorithm-1.jpg)


Imagine we want to reduce the dimension of n-dimensional to k-dimensional data. After doing the pre-processing stage, we need to calculate something called __"Covariance Matrix"__.
we show it with Sigma letter, but its different from the summation sigma although they both look the same. here is how we calculate it:
```
Sigma = (1/m)* sum(x(i) * x(i)')
```

Then we have to calculate something called __"Eigenvectors"__ (eye-gen). It is pre-built in octave like this:
```
[U, S, V] = svd(Sigma)   svd stands for "singular value decomposition"

OR
[U, S, V] = eig(Sigma)
```

by the way Sigma is nxn dimensional.

The output of svd shows U as an nxn matrix with each column as U vectors we wanted to calculate, and when we want to reduce the dimension to K we just need to pick the __FIRST__ k vectors from U matrix.

(photo: pca-algorithm-2.jpg)

Now in order to calculate the vector Zn (k x 1), we need to get the first k vectors and have them as a new matrix (n x k), then transpose it (k x n), and multiply it to vector X (n x 1), this way we calculate Z vector.
(photo: pca-algorithm-3.jpg)

## Week 8: (Part 4)

Sometimes after calculating z (k x 1), and reducing the dimensions of the data, we want to get back direction and have original n dimensions. in order to do it we can do it this way:
```
X(approx) = U(reduce) * Z    
```
U(reduce) is the U matrix that we picked the first k columns of it.

(photo: reconstruction-from-compressed-representation.jpg)

##### How to pick K for PCA?

The ideal way is to have 99% of variance retained. between 95-99 per cent is so common.
more info in the photo called: choose-k-theory.jpg

In practice, we have to start with k=1 and calculate all U(reduce), Z vector, X(approx) and check if 99% of variance is retained. if yes, we use k=1, if not we try k=2, and k=3, k=4 until we find the best number.
An easier way is to use svd function and after doing it once, we calculate the values shown in the photo and increase k values until we get to have 99% of variance retained.

(photo: choose-k-practice.jpg)

##### Supervised learning speedup:

imagine we have (x,y) samples that X is 10000 dimensional. if we want to feed all of it in a logistic regression or any other learning algorithm it will be so slow. what we can do is to unlabel the data first (remove y), then we use PCA to reduce the dimensions to 1000 for example. Now we have a new dataset with (z,y) samples so we can use the new dataset and feed into the learning algorithm and find the hypothesis.

__IMPORTANT__: Mapping from x(i) to z(i) should be defined by running PCA __ONLY__ on the training set not cross validation or test sets.
(photo: supervised-learning-speedup.jpg)

__NOTE__: its not a good practice to use PCA to prevent overfitting because when we have PCA we throw away y labels and then we do the dimension reduction and it sometimes doesn't end up as expected. for doing this, it better to use regularization.
(photo: bad-practice.jpg)
