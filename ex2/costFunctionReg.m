function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
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
m= size(X,1);
reg= sum(theta.^2);
reg = reg- (theta(1))^2;
reg =(lambda/(2*m))*reg;
B=X*theta;
A= (-1/m).*(y.*log(sigmoid(B))+(1.-y).*log(1.-sigmoid(B))) ;
J=sum(A)+reg;
A=0;
A = (sigmoid(B)-y).*X ;
A=(1/m)*(sum(A))' + (lambda/m)*theta;
A(1)= A(1) -(lambda/m)*theta(1);
grad= A;

% =============================================================

end
