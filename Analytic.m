% analytic solution to mx'' + cx' + kx = Asin(ft)

% spring constants
m = 2;
c = 1;
k = 1.2;

% applied force variables
A = 1;
f = 1;

if c^2 >= 4*m*k
	error('must be an oscillation')
end

if (k-m*(f^2)) == 0
    error('')
end

% set initial conditions
x_0 = 10;
xdot_0 = 0;

w = sqrt(-((c^2)/(4*m^2))+(k/m));

G = A*(k-m*(f^2))/((k-m*(f^2))^2-(c*f)^2);
H = A*c*f/((k-m*(f^2))^2-(c*f)^2);
D = (G*f - xdot_0)*2*m/c;
E = x_0 - H;

delta_t = 0.1;

t = 0:delta_t:100;
x = exp(-c*t/(2*m)).*(D*sin(w*t)+E*cos(w*t)) + G*sin(f*t) + H*cos(f*t);

plot(t,x,'b-')





