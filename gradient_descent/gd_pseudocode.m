function gd_pseudocode()
	gd(6, 0.1, 50)
end

function p = gd(params, alpha, iters)

	% the derivative of (x + 3) ^ 2 + 10;
	fprime =  @(x) 2 * (x + 3);

	p = params;
	for i = 1:iters
		p += -alpha * fprime(p);
	end
end
