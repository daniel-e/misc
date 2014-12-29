function [gradx, grady] = f_rosenbrock_grad(x, y)
	a = 1;
	b = 100;
	gradx = -2*(a - x) + 2*b*(y-x^2) * (-2) * x;
	grady = 2*b * (y - x^2);
end
