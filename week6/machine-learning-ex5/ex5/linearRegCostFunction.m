function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
  
  h = X*theta;
  theta_no_zero_index = theta(2:length(theta),:);
  X_prime_no_zero_index = X'(2:size(X',1),:);
  J = (1/(2*m))*sum((h-y).^2) + (lambda/(2*m))*sum(theta_no_zero_index.^2);

  
  grad_zero = (1/m)*sum(X'(1,:)*(h-y));   

 grad_rest = (1/m)*(X_prime_no_zero_index*(h-y)) + (lambda/m)*(theta_no_zero_index);
 grad = [grad_zero; grad_rest];






% =========================================================================

grad = grad(:);

end
