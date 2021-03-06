function results=RK4(w_i,h,t,results)
global L;
global g;
global t_max;
if t==0
    disp(['Current time: ' num2str(0)])
    global theta_0;
    global omega_0;
    w_ii=[theta_0 omega_0];
    t=h;
    results=[results; w_ii];
    results=EulerMethod(w_ii,h,t,results);
elseif t<t_max
    disp(['Current time: ',num2str(t)])

    k1=gFcn(t,w_i,h);
    k2=gFcn(t+h/2,w_i+k1.*h/2);
    k3=gFcn(t+h/2,w_i+k2.*h/2);
    k4=gFcn(t,w_i+k3.*h);
    
    w_ii=w_i+((k1+2*k2+2*k3+k4)./6).*h;
    t=t+h;
    results=[results; w_ii];
    results=RK4(w_ii,h,t,results);
end

end