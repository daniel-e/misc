a=csvread('allresults.csv');

bar(a);
title('Multiplication and addition of a 5000x5000 matrix');
ylabel('time in seconds');
grid on;
set(gca, 'xticklabel', {'default', 'satlas', 'tatlas', 'openblas'});
legend('matrix multiplication', '100 matrix additions');
print -dpng perfchartmult.png '-S640,400' -F:6:

