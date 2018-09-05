# Coursera Course for Machine Learning:


## Week 1:

### Welcome:
some examples of machine learning:

* Database Mining:

Companies are dealing with large datasets and they need more advanced ways to find insights from massive datasets. 


Now Silicon Valley companies and many others deal with Web Click Data or Click Stream Data. They use machine learning to understand customer behavior better.

* Applications we can't write with hands:
Autonomous helicopters, hadwriting recognition, NLP, recommendations, for example we can't write a custom app for each visitor to give them recommendations based on their own preferences, instead we can make a program that can learn from each person's preferences and then customize their app.

* understanding human learning(brain, real AI)

### What is Machine learning?

Arthur Samuel: Field of study that gives computers the ability to learn without being explicitly programmed.

Tom Mitchel: A computer program is said to learn from experience E with respect to some task T and some performance measure P, if its performance on T, as measured by P, improves with experience E.

for example in example of playing checkers:

E: The expernience of playing many games of checkers.

T: The task of playing checkers.

P: The probability that the program will win the next game.

Types of machine learning:

* __Supervised__ Learning: we teach the computer what to do.
* __Unsupervised Learning__: Computer will learn it by itself.
* There are other types such as __Reinforcement learning__ and __Recommender systems__.
### Supervised Learning
---
Supervised Learning: when we give right answers as a dataset to the computer. like regression, it can be linear or non linear and classification. 

Classification problems can have 0-1 results or more than 2 results. like 0-1-2-3. 

0 for no cancer, 1 for cancer type 1, 2 cancer type 2, and 3 cancer type 3.

sometimes the predictor in classification is not only one. for example in cancer example we can have 2 predictors like Age and Tumor size.

* __how computers can deal with infinite number of predictors instead on two or three or so?__

There is a mathematical trick called Support Vector Machine (SVM) to deal with this.

### Unsupervised Learning
---

A good example of it is clustering algorithm. It finds trend among unlabeled data and categorizes them based on the trends into different groups.

A very good example of clustering is [Google News](https://news-google.com)

other examples: finding among a large group of people, similar structures that people can be clustered based on them.

Or in data-centers which of them can be categorized together in order to have better performance or less cost, or market segmentations, etc.

* there are other types of unsupervised learning:

	__cocktail party problem__: imagine we are in a cocktail party and there are several people talking at the same time and there are several microphones capturing combinations of different voices. This algorithm tries to find similar structures in each person's voice among different microphones and separates each person's voice from others.
    
#### Octave environment: 

Its a very powerful feature of Matlab that normally companies use to prototype a machine learning situation and get it work properly then they will write it in Java, C, Python, etc. Its so much faster than writing it in a programming language.
