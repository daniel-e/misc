1;
% functions:
%                  plot_rosenbrock_surf()
%                  plot_rosenbrock_contour();
% z =              f_rosenbrock(x, y)
% [gradx, grady] = f_rosenbrock_grad(x, y)
% [J, grad] =      rosenbrock_cost(params)
%                  rosenbrock_fminunc()
%                  drawline(x1, y1, x2, y2)
%                  plot_dots(xy, color)

% ----- plot simple gradient descent example
%figure;
%plot_gd_example();
%pause;

% ----- pseudocode for gd
gd_pseudocode();

% ----- plot the rosenbrock function
%figure;
%plot_rosenbrock_surf();
%pause;

% ----- plot contour and find the minimum with fminunc
%figure;
%plot_rosenbrock_contour();
%rosenbrock_fminunc();
%pause;

% ----- plot gd for rosenbrock function
%plot_rosenbrock_contour();
%rosenbrock_gd();

