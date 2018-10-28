function zwnew = zwsolve(t,z,dzdt) 
    global c;
    global m;
    global k;
    global g;
    global l_0;
    retz = dzdt;
    retdzdt = -(c/m)*dzdt - (k/m)*z - g + k*l_0/m;    
	zwnew = [retz retdzdt];
end