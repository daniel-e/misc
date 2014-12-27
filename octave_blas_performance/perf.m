disp('multiplication');
fflush(stdout);
x = rand(5000, 5000);
tic
x*x;
t=toc;
disp(t);

disp('addition');
fflush(stdout);
tic
for i=1:100
	x+x;
end
p=toc;
disp(p);

csvwrite("result.csv", [t, p]);
