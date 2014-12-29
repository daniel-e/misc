function [J, grad] = rosenbrock_cost(params)
	x = params(1);
	y = params(2);
	J = f_rosenbrock(x, y);
	[gradx, grady] = f_rosenbrock_grad(x, y);
	grad = [gradx, grady];
end
