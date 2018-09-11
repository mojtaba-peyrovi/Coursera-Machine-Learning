# Coursera Course for Machine Learning:


## Week 2: (Part 1)

Accessed Matlab online and waiting for the end of this week to read more of documentation on how to submit the assignments.

## Week 2: (Part 2)

### Multiple Features
---
__some notations__:

n: number of features

m: number of rows or examples


X(i): It is the vector of all features of exmple i out of m examples. X is an n dimensional vector.


X(i)j: means jth feature of ith example's features vector.


* Our hypothesis for 4 features will be h(x)=T0+T1(x1)+T2(x2)+T3(x3)+T4(x4)

__**Important**__: When we have minus teta it means that the associated feature will have negative effect on the target and if we have positive teta it means the associated feature will affect in a positive way to the target.


for convenience of notation we say always x(i)0 = 0

When we do this, we will have our features vector as a ZERO INDEXED vector.

then we will have our parameters as a ZERO INDEXED vector same size as features vector.


By defining our features as a vector (X) and our parameters as a vector (Teta) now we can say:

h(x) = (teta)T * X  ==> means teta vector transposed and multiply it to X which is features vector.

The dimension of X and Teta is (n+1)x1


This mode is called __Multivariate Linear Regression__.

(Check a photo called multiveriate-regression.jpg)

### Gradient descent for Multivariate Regression
---

In this episode we found out that we can come up with one formula for all partial derivatives in the gradient descent formula and since we have x(i)0 = 1, for all cases we have a formula that we can see in a photo saved in the folder called gradient-descent-derivative-formula.jpg.

### Gradient descent for Multivariate Regression in practice 1
---
__feature scaling__: If the features all take similar range of values, it make the gradient descent algorithm converge more easily.

If we have one large scaled feature and one too small scaled variable, the contour plot of the cost function would look so tall and skinny and it makes the gradient descent move so much more back and forth and takes a lot longer for it to find the global minimum.

* __How we do feature scaling__?

    We try to make every variable into approcimately between -1 and 1. They don't have to be necessary between -1, 1 they must be small enough like -3 to +1 or -2 to +0.5, etc.
    Also they shouldn't be so much smaller than 1-to 1 for example -0.00001 to +0.00001 is equally bad.

```
Seems like all values between -3 to +3 is acceptable.
```

   In order to make feature scaling one of the techniques is to divide all values to the maximum.

**__Mean Normalization__**:  it is also another technique to get values become the same scale. The way we do it is to replace xi with:
```
(xi-mean)/maximum.
```
We dont apply it to x0 which is always 1.

Another formula for normalization is
```
(xi-average)/(max-min)  
```
### Gradient descent for Multivariate Regression in practice 2
---

__Debugging__: The rule is that J or the cost function has to reduce after __EVERY__ iteration.


 A graph of J per iterations shows if the cost function is reducing as we iterate more or not.

 We can design automatic convergence test, but the graph sounds easier and more reliable because we can't easily find the threshold of how much decrease is considered acceptable or not.

 *  If the plot shows that the j is increasing as we iterate more it means that the gradient descent is  not working. and usually means that we need to pick a smaller alpha.

### Normal Equation
---
__Normal Equation__: sometimes instead of iterating gradient descent algorithm, we can find teta(parameters) analytically in one step.

* How we do it? well, in mathematics in order to find minimum of a function we just calculate the derivative and set it to zero and calculate the variable.

* But in case of machine learning and linear regression the parameter or teta is not a single number, it is a vector of n+1 features.
* One way to deal with the vector of features we can take partial derivate of j function based on each feature and one by one set them to zero and calculate tetas or parameters.

* another way is making a matrix of all features and their values in all examples and we add a column of ONEs for x0 values. we call this matrix X. Then we make a vector of all lable values and we call it y. this way here is the value of teta to minimize z function:
```
teta =(XT * 8X)^-1XT*y       (XT:Transposed matrix of X)

for calculating it in Octave: pinv(X'*X)*X'*y

in octave:   
-X' means X  transposed
-pinv() function calculates the inverse.
```

When we use normal equation instead of gradient descent we don't need to do __feature scaling__. so features can be in any scale.

__Gradiant Descent vs Normal Equations (Only for linear regression):__

- in GD we need to chose learning rate alpha while in NE we don't.

- in GD we need to have many iterations while in NE we don't need any iteration.

- when we have too many features (large n), GD works so well while NE is so slow and costly.
- (__the idea about too many features__:  when we have features more than 10,000 we can start using GD, otherwise for the features less than that, NE works well)

**_normal equation doesn't work for classification and some other algorithms. for those algorithms we need to used gradient descent._**

(Check a photo called normal-equation.jpg)

### Normal Equation Noninvertibility (Optional)
---
Sometimes the XT*X is non-invertible and cant be inverted (it's called _singular_ or _degenerate_). in 2 cases it is possible to happen:

1- redundant features: when one feature is a linear function of the other feature for each if a feature is square meter and the other is square feet, their relationship would be always: X1 = (3.28)^X2

**_the solution is to see if there is any redundancy in data and try to resolve it by deleting one of the features._**

2- when m<=n  when we have 10 samples and 100 features.

**_in this case we can delete some features or use a technique called  Regulization._**

## Week 2: (Part 3)

### Basic Octave operations
---

1) We can simply write
```
2+4   ==> Result: 6
```
It works for all basic operations like sum, subtract, multiply and divide.

2) We can also do logical operations like this:
```
1==2   ==> Result: 0
```
and the answer would be zero which is a representation of false. and if we say:
```
1~=2  ==> Result: 1
```
it returns 1 as true. also we can use  % as the sign of comments. for example:
```
1==2 % false.  ==> Result: 0
```


3) and operator is shown by && and or is show by || just like php.
4) In order to change the command prompt indicator to >> for example we can type:
```
PS1('>> ');  ==>Result: >>_
```

5) We can assign values to variables for example a = 3 will assign 3 to variable a.

6) The semicolon at the end will prevent octave to show the result immediately after executing that row.  if we don't do the ; we can see the result of the execution.
```
a = 3  ==> Result: a = 3

a = 3; ==> Result: nothing
```
7) We can also assign strings like this:  
```
a = 'moji'
```

8) We can assign the result of a comparison operation to a variable like this:
```
c = 3>1 ==> Result: c = 1
```

9) We can assign pi(3.14) to a variable. like this:
```
a = pi ==> Result: a = 3.1416
```
and if we want to retrieve a value of the variable later we just say a and enter. sometimes for more complex variable results we say:
```
disp(a);
```
9) When we want to round a value for example pi we can use this:
```
disp(sprintf('2 decimals: %0.2f', a))  ==> Result: 2 decimals: 3.14

Or

disp(sprint('%0.2f', a)  ==> Result: 3.14
```

Another example for 6 decimals:
```
disp(sprint('6 decimals: %0.6f', a))  ==> Result: 6 decimals: 3.141593
```

10) Also there is a default long and short operators in octave that we can use like this:
```
a = pi

format long

a  ===> Result: 3.14159265358979
```
And
```
format short

a ==> Result: 3.1416
```
11) In order to make matrices we can do this way:
```
A = [1 2; 3 4; 5 6] ==>Result: a 3x2 matrix with 1 2 as the first and 3 4 as second row
```
12) Horizontal vector:
```
V = [1 2 3 4]
```

13. vertical vector:
```
 V = [1; 2; 3; 4]
```

14. We can use this notation to create a vector with values between 1-2 and having equal intervals of 0.1 between each.
```
V = 1:0.1:2  ==> Result: a horizontal vector with 11 values: 1 1.1 1.2 1.3. etc.
```

15. In order to return integers between 1-6 we say:
```
V = 1:6
```
16. If we want a 2x3 matrix of ones we say:

```
V = ones(2,3)
```
Moreover when we want to make a 2x3 matix of all twos we can say:
```
V = 2* ones(2,3)
```
17. we have similarly the same functionality for zeros by just typing zeros(2,3)
18. When we want to generate a matrix of random numbers:
```
W = rand(5,5)
```
19. In order to have a matrix of random variables from normal distribution:
```
W = randn(1,3)
````
20. An example of a bit more complicated matrix generation:
```
W = -6 + sqrt(10)*randn(1,10000))
```
21. And we can quickly see the histogram of W like this:
```
hist(W)
```
Also if we want more bins we say:
```
hist(W, 50)
```
22. __Important__: In order to generate identity matrix(all zeros excep ones at diameter) we can say:
```
eye(4)  ==> Result: a diagonal matrix 4x4
```
23. for each of the items if we need more info we can type:
```
help eye, or help rand, etc.
```
### Moving Data Around
---

1. In order to see the size of matrix A we can simply say:
```
size(A)  ==> Result: a 1x2 matrix showing the rows and columns of A
```
2. If we want only the number of rows in matrix A we say:
```
size(A,1)
```
Similarly size(A,2) shows the number of columns in A.

3. If we have a vector like V =[1 2 3 5] and we want the length of it:
```
length(V)  ==> Result: 4
```
If we run length for a matrix not a vector it return the maximum between column and row.

4. To see the current working directory:

```
pwd  
```
5. In order to load data into octave we have to navigate octave to say:
```
load <filename>   or   load('file_name')
```
6. In order to have a list of variables in working directory:

```
who  or whos
```
7. We can clear a variable like this:

```
clear <variable_name>
```
8. when we want the first 10 variables of a vector:

```
v = <vector_name>(1:10)
```
9. If we want to save a variable(e.g. v) to a file in working directory we just say:
```
save test.mat v
```
10. If we want to clear all variables defined in current working space:

```
clear
```
11. If we want to retrieve the variable from the file we saved we say:

```
load test.mat
```
12. For saving variable v as a file with txt format we can say:
```
save test.txt v -ascii  % save as text (ASCII)
```
13. Indexing: In order to return a specific index from matrix A:
```
A(2,3)  ==> Result: the value saved at second row and third column
```
14. In order to index all second row:

```
A(2,:)   , similarly A(:,2) returns second column
```
15. If we want to return the first and third row of the the index:

```
A([1 3],:)
```
16. In order to assign a value to a specific index, lets say in order to assign new values to the second column of matrix A:

```
A(2,:) = [10; 11; 12]
```
17. We can append a new column to the end of matrix A:
```
A = [A, [101; 102; 103]
```
18. Sometimes we want to see all values of a matrix as a vector:
```
A(:) ==> Result: if A is 2x3 it returns a 6 dimensional vector
```
19. For concatenating 2 matrices (if they are of the same dimension):
```
C = [A B]  ==> Result: B columns will be added at the right side of A
```
20. For adding values of B at the bottom of A values:

```
C = [A; B]
```
21. [A B] is identical to [A, B]

### Computing on Data
---
1. When we want to multiply two matrices:
```
A*B
```
2. When we have 2 matrices of the same dimension and we want element wise multiplication we just say:

```
A .* B
```
**_normally this period . next to operations is the sign of element wise operations. e.g._**

```
A .^ B
```
3. some other operations:
```
log(v): لگاریتم  exp(v)   abs(v): قدرمطلق
```
4. We can do some operations like this if v=[1 2 3]:
```
v + ones(legth(v),1)  ==> Result: v =[2 3 4]

or

v + 1    ==> Result: v =[2 3 4]
```
5. How to calculate transpose of matrix A?
```
A'
```
6. Suppose we have a vector a=[1 15 2 5]

```
val = max(a) ===> Result: val = 15

Also:

[val, ind] = max(a)  ==> Result: val = 15   ind = 2
```
7. If we want to see if each element is smaller than 3:
```
a < 3  => Result: 1 0 1 0

If we want octave to find them :  find(a < 3)  ==> Result: 1 2
```
8. Magic matrix is a matrix that has the sum of all rows and columns and diagonals equal:
```
A = magic(3)
```
9. if we want to see the row and column indexes of all values less than 7 in a:
```
[r,c] = find(a < 7) ==> Result: r = [1 1 1] c=[1 3 4]
```
10. In order to sum up all elements in a matrix or vector:

```
sum(a) ==> Result: 1+15+2+5 = 23
```
11. For multiplying all values of the matrix together:
```
prod(a) ==> Result: 1*15*2*5 = 150
```
12. We can round down, and up all values of the matrix

```
floor(a) for down and ceil(a) for up
```
13. We can generate two random matrices of the same size and compare counterpart values one by one and return the max:

```
max(rand(3), rand(3))
```
14. Column wise maximum of matrix A:
```
max(A,[],1)  => Result: a vector of max of each column as a value
```
15. Row wise maximum of matrix A:

```
max(A,[],2)
```
16. If we want to see the max of max values:

```
max(max(A))

or
max(A(:))
```
17. Imagine A is a magic(9), we can see the sum of each column(1 is the index number for columns, and 2 for rows):

```
sum(A,1)  ==> Result: Nine 369 values for each column
sum(A,2) ==> Result: Nine 369 values for each row
```
18. For summing the diagonal values up we should multiply elementwise of an identity matrix to the main matrix and it makes everything else than the diagonal to zero. then we can sum them twice, once for columns and once for rows:

```
sum(sum(A.*eye(9)))  ==> Result: 369
```
19. If we want to make a matrix mirrored vertically:

```
flipud(A)
```
20. To calculate the inverse of matrix A:

```
pinv(A)
```
