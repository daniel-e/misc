function drawline(x, y, x2, y2)
	if x > x2
		plot([x2, x], [y2, y], 'r', 'linewidth', 2);
	else
		plot([x, x2], [y, y2], 'r', 'linewidth', 2);
	end
end
