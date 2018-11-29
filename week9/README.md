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

Now we want to calculate the probability of each x with their own mean and variance.
(photo: algorithm-density-estimation.jpg)

in the next photo we see the algorithm we need to define. in the photo we have to choose one of the examples that we know it has some weird behavior. then we calculate mean and variance of each feature for example i. then given a new example x we compute p(x) as we see in the photo called algorithm-steps.jpg.

__Important__: here is a good example of the anomaly detection with numbers and graphs:
(photo: anomaly-detection-example.jpg)
