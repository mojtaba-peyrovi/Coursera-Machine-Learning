function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%

 
  X_no_zero__index = X(:,2:size(X,2));
  theta_no_zero_index = theta(2:length(theta),:);
  
  pred = sigmoid(X*theta); 
  first_part = y' * log(pred);
  second_part = (1-y')*log(1-pred);
  third_part = lambda/(2*m) * sum(theta_no_zero_index.^2);
  J = 1/(-m) * sum(first_part + second_part) + third_part; 
  %J = 1/(2*m)*(sum(pred-y) + lambda * sum(theta_no_zero_index));
  grad_third = (lambda/m)*(theta_no_zero_index)';
  grad_zero = 1/m * sum(pred'-y')*X(1);
  grad_no_zero_index = 1/m *(pred' - y')*X_no_zero__index + grad_third;
  grad = [grad_zero, grad_no_zero_index];








% =============================================================

grad = grad(:);

end
