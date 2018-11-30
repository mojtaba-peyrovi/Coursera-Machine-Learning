# Coursera Course for Machine Learning:


## Week 9: (Part 1)

__Anomaly Detection__(نا هنجاری): It is mostly used from unsupervised learrning algorithms.

It finds examples that are kind of out of the normal range of other examples and they may need more consideration and testing.
(photo: anomaly-detectiond-example.jpg)

In order to do this we need to define a p(x) function that is the probability of example X(test) to be smaller or bigger than a specific threshold. If the probability was smaller than the threshold we call the sample Anomalous.
(photo: density-estimation.jpg)

- the most common use of anomaly detection analysis is  fraud detection

for examples in websites, we can have each user as an example and each feature of them as a feature. then we can find out which users are acting strangely and getting to review them more or asking for identification to make sure they are not fraudulent users.


- another example of anomaly detection is in manufacturing, when we want to do quality control and we want to detect samples that are strangely out of the range.

- another example is monitoring computers in a data center to discover some unusual behavior of computers in a data center, such as weird memory use, cpu load, network traffic.

(photo:anamoly-detection-other-use.JPG)


#### Gaussian (Normal) distribution:

we say X is a distributed Gaussian with mean mu and variance simga^2.

- Tilde: ~   this symbol is called Tilde and means distributed as.

Gaussian has 2 parameters. 1) mu which is the mean  2) sigma^2 which is variance.

sigma itself is called _standard deviation_.

(photo: normal-distribution-1.jpg, normal-distribution-2.jpg), (gaussian-parameter-estimation
.jpg)


## Week 9: (Part 2)

__how to evaluate an anomalous learning algorithm?__

although we said the anomaly analysis is an unsupervised algorithm, however we can imagine adding labels to data being 0 if  the examples is normal and 1 if the example is anomalous.

Then we will have to define cross-validation and test sets.

As an exmple we suppose we have 10,000 normal engines versus 20 anomalous examples. Now lets have 6000 of good engines as training set with y=0, then based on that we can calculate p(x).

Also we put 2000 samples for each cross-validation and test sets.
Also we split 20 anomalous examples to 10 cross-validation and 10 test sets.


- A bad practice for splitting to datasets is to have the same dataset for both cross validation and test sets. they have to be different sets.

Now after fitting training set to the model, it will work similar to classification problem with labeled data. But the results would be a bit skewed as we normally have zeros for normal examples are way more common than ones as anomalous examples.

Because of skewed data, we can't use classification accuracy method to evaluate the algorithm.
He offers 3 ways of evaluating the algorithm (photo: algorithm-evaluation.jpg)

__Question:__ If in the case of anomaly analysis, we will have to have labeled data to predict which one has y=1 and which one has y=0, why don't we simply use a classifier using logistic regression, neural networks, or so?

Here are some tips on when its better to use anomaly analysis instead of classification:
(photo: anomaly-vs-classification.jpg)

Sometimes we have some examples that don't really match with Gaussian graph. like the photo: non-gaussian-features.jpg. in these cases we can replace the values of X with log(x) or some exponential functions, etc. to make it look more Gaussian as we can see in the photo.

__His tip on how to pick features:___

He offers to find features that could potentially take very large values or very small values because they are more likely to take anomaly values.

For example if in a data center we capture some errors with a computer that has a large CPU usage but very low traffic, we can come up with a new feature where it has the traffic on the bottom and cpu usage of the top to make up a big value so that we could capture the error.
(photo:data-center-error-analysis.jpg)

## Week 9: (Part 3)


__Recommender systems__:

It is one of the most important machine learning algorithms that companies work on to improve.

Here is an example of rating movies. there are 4 users that rated five movies in different ways.

there are some notations as we can see in the photo: (movie-rating.jpg)

3 first movies are romantic and two latter are action movies. and seems like the first two users like romantic movies more than action movies and the other two of them like action more. Now we want to make recommender system to predict the missing values which are shown in magenta ? mark.

__Important:__

when a user hasn't watched the movie the value for r(i,j) would be zero for it. and if y(i,j) ONLY has values if r(i,j) has value of 1.

__Content based recommendation:__

for each X in the example we define two features. x1 = romance, x2= action and also we can add x0=1 as an intercept. then each movie would be represented as a 3 dimension vector of [1, x1 x2].

- one approach is treating each user j as a linear regression problem and learn a parameter theta which is 3 dimensional and then use theta'.X(i) for x(i) to predict their rating.
 (photo:content-based.jpg)

 In the next photo we see how to formulate the problem with linear regression for each user. also we define m(j) as the number of movies that user j has rated. and since 1/2m(j) is just constant and doesnt make any change in the process of finding the minimum we will just ignore it.

(photo:recommendation-formulation.jpg)
(photo:recommendation-gradient-descent.jpg)
