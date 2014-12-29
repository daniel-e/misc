function rosenbrock_fminunc()
	opts = optimset('MaxIter', 100, 'GradObj', 'on', 'OutputFcn', @storepar);
	[params, fval] = fminunc(@(t) rosenbrock_cost(t), [-1, 6], opts);
	r = storepar(0, 0, 'end');
	plot_dots(r, 'green');
end

function r = storepar(par, optimvalues, state)
	persistent history = [];
	if strcmp(state, 'end') == 1
		r = history;
	else
		if strcmp(state, 'init') == 1
			history = [];
		end
		history = [history; par(:)'];
		r = false;
	end
end
