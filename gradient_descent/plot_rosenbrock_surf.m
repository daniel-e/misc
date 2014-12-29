function plot_rosenbrock_surf()
	x = linspace(-2.5, 3, 30);
	y = linspace(-1, 5, 30);
	[xx, yy] = meshgrid(x, y);
	zz = f_rosenbrock(xx, yy);
	surf(xx, yy, zz);
	title('Rosenbrock function');
	xlabel('x');
	ylabel('y');
end
