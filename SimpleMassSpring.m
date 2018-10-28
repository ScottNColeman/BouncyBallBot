global c;
global m;
global k;
global l_0;
global g;


c = 1;
m = 1;
d = 11;
g = 9.8;
l_0 = 1;
k = 10;
A = 1;

z_0 = l_0;
dzdt_0 = 0;

omega = 1;

w = 1;

    if c^2 >= 4*m*k
        error('must be an oscillation')
    end

    zw_init = [z_0;dzdt_0];

    delta_t = 0.01;

    t = 0:delta_t:100;
z = zeros(size(t));
dzdt = zeros(size(t));
d2zdt2 = zeros(size(t)-1);
z(1) = z_0;
dzdt(1) = dzdt_0;
f = @(t_,z_,dzdt_) zwsolve(t_,z_,dzdt_);
T = 1;

for i = 1:length(t)-1
    k1 = f(t(i),z(i),dzdt(i)); 
    k2 = f(t(i)+0.5*delta_t,z(i)+0.5*delta_t*k1(1),dzdt(i) ...
        +0.5*delta_t*k1(2)); 
    k3 = f(t(i)+0.5*delta_t,z(i)+0.5*delta_t*k2(1),dzdt(i) ...
        +0.5*delta_t*k2(2));  
    k4 = f(t(i)+delta_t,z(i)+k3(1)*delta_t,dzdt(i)+k3(2)*delta_t);
    
    z(i+1) = z(i) + (delta_t/6)*(k1(1)+2*k2(1)+2*k3(1)+k4(1));
    
    d2zdt2(i) = delta_t*(1/6)*(k1(2)+2*k2(2)+2*k3(2)+k4(2));

%         if z(i+1)<d 
%             if dzdt >= 0 % Thrust
%                 d2zdt2(i) =  d2zdt2(i) + 10/m;
%             else % Compression
%             %    d2zdt2(i) = 0.1*d2zdt2(i);
%             end
%         end

    d2zdt2(i) = d2zdt2(i) + A*sin(w*t(i))/m;

    
    dzdt(i+1) = dzdt(i) + d2zdt2(i);

end
figure
plot(t,z,'b-')
legend({'Height'})
grid


figure
plot(t,dzdt,'r-')
legend({'Velocity'})
grid

figure
plot(t(2:end),d2zdt2,'g-')
legend({'Acceleration'})
grid


    

    



