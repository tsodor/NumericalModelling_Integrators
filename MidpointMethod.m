function results=MidpointMethod(w_i,h,t,results)
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
    gVal=gFcn(t,w_i,h);
    gVal=gFcn(t+h/2,w_i+0.5*h.*gVal);
    w_ii=w_i+h.*gVal;
    t=t+h;
    results=[results; w_ii];
    results=EulerMethod(w_ii,h,t,results);
end

end