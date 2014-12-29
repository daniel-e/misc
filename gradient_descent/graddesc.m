function [p, hist] = graddesc(cfun, params, alpha, iters)
	p = params;
	n = length(params);
	hist = [0, 0, zeros(1, n), alpha, p, zeros(1, n)];
	for i = 1:iters
		[J, grad] = cfun(p);
		p += -alpha * grad;
		hist = [hist; i, J, grad, alpha, p, -alpha * grad];
	end
end
