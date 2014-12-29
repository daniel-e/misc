function plot_gd_example()
	x = linspace(-6, 5, 100);
	y = f(x);
	plot(x, y, 'linewidth', 2, 'k');
	axis([-6, 5, 0, 70]);
	title('error function');
	xlabel('parameter x');
	ylabel('error');
	grid on;

	hold on;
	x = linspace(0, 8, 7);
	x = x .* x / 64 * 6 - 3;
	plot(x, f(x), 'xo', 'markersize', 8, 'markeredgecolor', 'black', 'markerfacecolor', 'blue');

	text(x(7) - 0.4, f(x(7)) + 4, 'x_0', 'interpreter', 'tex', 'fontsize', 14);
	text(x(6) - 0.4, f(x(6)) + 4, 'x_1', 'interpreter', 'tex', 'fontsize', 14);
	text(x(5) - 0.4, f(x(5)) + 4, 'x_2', 'interpreter', 'tex', 'fontsize', 14);

	x = [0, 4.5];
	y = [12 * x(1) + 9.5, 12 * x(2) + 9.5];
	plot(x, y, 'r', 'linewidth', 2);

	% on the left side
	x = [-5];
	plot(x, f(x), 'xo', 'markersize', 8, 'markeredgecolor', 'black', 'markerfacecolor', 'magenta');
	x = [-6, -3];
	y = f_prime(-5) * x - 6.2;
	plot(x, y, 'b', 'linewidth', 2);

end

function y = f(x)
	y = (x + 3) .^ 2 + 10;
end

function y = f_prime(x)
	y = 2*(x+3);
end
