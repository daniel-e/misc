1;
 
n = 8192;
x = rand(n, n);
tic, x .* x;
y = toc;
printf('Measured GFLOPS: %f\n', n * n / y / 1e9);
