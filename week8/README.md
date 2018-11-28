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

How to randomly initialize the centroids?

first we have to make sure k < m. number of centroids have to be less than the number of samples.

Then we can pick some of the points within the sample points as the centroids. sometimes if we don't have a good random selection of the centroids we may end up having __Local Optimas__.
check this photo: (k-means-local-optima.jpg)


The solution for this is, to pick the random points several times and run the algorithm several times. a good practice is to do it between 50-1000 times. Then we will calculate the cost function for each time, and pick the one with the minimum distortion(cost function).

How to pick the number of clusters? in order to do this we need to calculate cost function for different values of K (number of clusters) and see where we have an Elbow (Elbow method)
(check the photo called elbow-method.jpg)


### from assignment:

randidx = randperm(size(X, 1));   randomly changes the indices of matrix X (examples).
