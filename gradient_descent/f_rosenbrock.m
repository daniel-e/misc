function z = f_rosenbrock(x, y)
	a = 1;
	b = 100;
	z = (a .- x) .^ 2 .+ b .* (y .- x .^2) .^ 2;
end
