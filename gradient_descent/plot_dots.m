function h = plot_dots(xy, color)
	h = plot(xy(:,1), xy(:,2), 'xo', 'markersize', 8, 'markerfacecolor', color);
	for i = 2:size(xy, 1)
		drawline(xy(i - 1, 1), xy(i - 1, 2), xy(i, 1), xy(i, 2));
	end
end
