function plot_rosenbrock_contour()
	x = linspace(-3, 3, 30);
	y = linspace(-3, 7, 30);
	[xx, yy] = meshgrid(x, y);
	zz = f_rosenbrock(xx, yy);
	contour(xx, yy, zz, 25, 'linewidth', 2);
	hold on;
	plot([1], [1], 'xo', 'markersize', 8, 'markerfacecolor', 'red');
	%xlabel('x');
	%ylabel('y');
end
