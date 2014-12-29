function rosenbrock_gd()
	[p, hist] = graddesc(@(t) rosenbrock_cost(t), [-1.6, 6], 0.0004, 15000);
	params = hist(:, 6:7);
	a = plot_dots(params([1, 2, 3, 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000, 11000, 12000, 13000, 14000, 15000], :), 'magenta');

	[p, hist] = graddesc(@(t) rosenbrock_cost(t), [-1.6, 6], 0.0008, 10000);
	params = hist(:, 6:7);
	b = plot_dots(params([1, 2, 3, 100, 300 ,600, 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000], :), 'yellow');

	h = legend([a, b], {'\alpha = 0.0004', '\alpha = 0.0008'});
	legend location southoutside;
	legend orientation horizontal;
	set(h, 'fontsize', 18);
	set(h, 'interpreter', 'tex');
end
