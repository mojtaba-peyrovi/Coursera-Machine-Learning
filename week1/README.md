# Coursera Course for Machine Learning:


## Week 1: (Part 1)

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


## Week 1: (Part 2)

### Model Representation
---
In this course they call continuous data, 'real-valued' data.
in Regression we tend to predict real-valued data, while in Classification algorithm, we tend to predict discrete-valued data.

__some notations:__

m: number of training examples.

x: features

y: output, target, class, or label.

(x,y): A single training example. a pair of feature(s) and output.

(xi,yi) as i-th training example.


* when we have the training set, we use learning algorithm and the result of the algorithm will be 'h' referring to **__Hypothesis__**.
* this h function will take the size of a new house and predicts the price of it.
* __h__: is a function that maps x's to y's.

(Check photo saved in the folder called linear-regression-scheme.png)

linear regression function: h(x)= ax + b 

The name of this model is: __Linear Regressioin with one variable__. or __Univariate Linear Regression__.

### cost function
---
in hypothesis model h(X) = ax + b  we call a and b __parameters__ of the model.

* the idea of linear regession is to find the values of a,b to make our h(x) as close as possible to y which is the right answer.

we need to minimize (h(x)-y)^2  and we need to sum up all of these values for each training record. and then the average of it has to be minimized.

(check the photo in the folder called linear-regression-cost-function.png)

* the cost function is sometimes called __Squared Error Function__.

### Gradient Descent
---
	
   it is an algorithm that finds the best values for parameters in order to minimize the cost function J. 
   
   This algorithm is not only used in linear regression. It's used in so many other algorithms of machine learning.
   
   How gradient descent works?
  
  1- it picks random initial values for all parameters. for example if we have 2 parameters a,b it may say: a=0, b=0
  2- then it keeps changing a,b to minimize J. it starts to look 360 degree around and finds the best direction for the next step in order to make the height of the point (cost value) lowest in fastest time.
  
 
* some notations of the gradient descent function:

:=    Assignment operator, for example: a:=b means take the value of b and assign it to a.

Alpha: learning rate which tells how big the steps must be.

Derivative term: will learn later.

__important__: in gradient descent the left hand value is calculated and simultaneously teta0 and teta1 will be updated. Not updating after the value calculation;
It means that first calculate the gradient descent for both teta0, teta1, then update both of them, not calculating teta1 and update it then calculate teta2 and update it.

(check the photo in the folder called gradient-descent.jpg)

### Gradient Descent Intuition
---

__Explanation__: the derivative term that we have in gradient descent formula is partial derivative. it means if we have more than one variable we treat the others as constants and take the derivate of the function based on only one variable. in case of having only one variable, derivative and partial derivative are the same.


Simply when the derivate is negative, the value of cost function will increase and when the derivative is positive, the cost function will decrease.

* When Alpha or learning rate is too small the gradient descent will be so slow.
* When Alpha is too big, gradient descent will overshoot the minimum and may fail to find the right minimum.
* As we approach the local minimum, the gradient descent will automatically take smaller steps so, no need to change learning rate (Alpha) over time. 

(In order to understand it better look at 3 photos called gradient-descent-math-1,2,3.jpg)

### Gradient Descent for Linear Regression
---
__Convex Function__: means a bowl shaped function. 

Gradeient decent function is always a convex function so we won't worry for having more than one local minimum. It means local and global minimums are always identical.


__Batch Gradient Descent__: it refers to the fact that in each step of gradient descent we calculate the partial derivatives for the whole batch of training examples.


* there are some other versions of gradient descent that don't calculate the whole batch and just examine a fraction of the whole training data.

## Week 1: (Part 3)

### Matrices and vectors
---

__Matrix Dimension__: the number of rows times the number of columns. e.g. 4x2  four by two.

__addressing a value in the matrix__: Aij means the ith row and jth column of matrix A.

__vector__: vector is a subset of matrix or a type of matrix that has only one column. so its dimension is always nx1.


* sometimes when we have a vector with n values and one row we can call it __**n dimensional vector**__.

* also another notation for matrices is R3x4 it means a 3x4 dimensional matrix and R4 means a 4 dimensional vector.
* in vectors we say Y2 means second element of vector Y.

__1 indexed vector__ is a vector that its index numbers start with 1. 
__0 indexed vector__ is a vector that its index numners start with 0.

1 indexed vectors are more common and we assume by default that vectors are 1 indexed.
* we use uppercase letters to refer to matrices.

* we use lowercase for single numbers or variables or __vectors__.

### Addition and Scalar Multiplication
---

__Addition__: Matrices must be in the same dimension and each counterpart pairs would sum up and the result would be written in the result matrix at the same location.

__Multiplying matrices by the scaler number__: it's gonna be a number that multiplying it to the matrix will cause each element to be multiplied to the same number. dividing the matrix is the same as multiplying.

### Matrix Vector Multiplication
---
the rule is the number of columns of the matrix must be equal to the vector rows.

We can use this to predict the hypothesis function for example for linear regression:
h(x) = -40 + 0.25x ==> we can define a martix of all training data and time it to another matrix of all parameters and will end up having all predictions:

```
Predictions_vector = data_matrix * parameters_vector
```

### Matrix Matrix Multiplication
---
Again the rule is the columns of the first matrix must be equal to the rows of the second matrix. and the outcome would be in the dimension of rows from the first matrix and columns of the second matrix.

* An easy trick to do this is to start picking up the columns of the second matrix and multiply them to the first matrix as a simple matrix-vector multiplication and then do it with all columns of the second matrix. then we put all the results in a new matrix and it would be the result.

We can use this method to programmatically compare several hypothesis formulas at the same time. 
(Check a picture called matrix-matrix-hypothesis-example.jpg)

### Matrix Multiplication Properties
---

__Commutative__: قابل جابجایی


Matrix multiplication is __NOT__ commutative.

__Associative__: when we have 3 numbers multiplied we are free to do any of the operations first. this is called be associative.

Matrix multiplication __IS__ associative.

__Identity Matrix__: the type of matrix that has all zero values except diagonal values which are all 1. we show it like: I(nXn)


* Matrix multiplication is commutable when one of the matrices is an identity matrix.

### Matrix Inverse and Matrix Transpose
---

__Inverse Matrix__: If A is a mxm matrix (Square matrix), A^-1 is a matrix that when we multiply it to A it gives us the Identity matrix of I.


**__Only square matrices have inverse matrices.__**

__Transpose Matrix__: it is simply made by switching between rows and columns of the matrix. it means we make the first row of matrix A and make it the first column of AT matrix.and second row for second column.



