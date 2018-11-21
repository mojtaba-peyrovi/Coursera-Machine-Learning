function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%





%all_c = [0.01 0.1 1 10 100];
%all_sigma = [0.03 0.3 3 30 300];
%for i = 1:length(all_c),
 % for j = 1:length(all_sigma),
  %  C = all_c(i);
   % sigma = all_sigma(j);    
    %prediction = svmPredict(y, Xval);
   %err(i,j) = mean(double(prediction ~=yval)) 
  %endfor   
%endfor

results = eye(64,3);
base = 0;
for all_c = [0.01 0.03 0.1 0.3 1, 3, 10 30]
    for all_sigma = [0.01 0.03 0.1 0.3 1, 3, 10 30]
        base = base + 1;
        model = svmTrain(X, y, all_c, @(x1, x2) gaussianKernel(x1, x2, all_sigma));
        prediction = svmPredict(model, Xval);
        err = mean(double(prediction ~= yval));

        results(base,:) = [all_c, all_sigma, err];     
    end
end
final = sortrows(results, 3);
C = final(1,1);
sigma = final(1,2);




% =========================================================================

end
