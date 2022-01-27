clear; clc;
%Example of my own implementation of INTEGRATORS
%This specific example code showcases the solution of a
%swinging PENDULUM

global theta_0;
global omega_0;
global g;
global L;
global t_max;

theta_0=pi/40;
omega_0=0;
g=9.81;
L=0.61;
t_max=8;

%% Euler
figure
% close all; clc;
hold on
w=[theta_0 omega_0];
h=0.1;
theta_fcn=EulerMethod(w,h,0,[]);
plot(0:h:t_max,theta_fcn(:,1),'r')

h=0.05;
theta_fcn=EulerMethod(w,h,0,[]);
plot(0:h:t_max,theta_fcn(:,1),'b')

h=0.01;
theta_fcn=EulerMethod(w,h,0,[]);
plot(0:h:t_max,theta_fcn(:,1),'g')

beta=sqrt(g/L);
phi=pi/2;
t=0:0.1:t_max;
plot(t,sin(beta.*t+phi),'c')

legend('0.1','0.05','0.01','Analytical')
title('Euler')
%% Midpoint
figure
% close all; clc;
hold on
w=[theta_0 omega_0];
h=0.1;
theta_fcn=MidpointMethod(w,h,0,[]);
plot(0:h:t_max,theta_fcn(:,1),'r')

h=0.05;
theta_fcn=MidpointMethod(w,h,0,[]);
plot(0:h:t_max,theta_fcn(:,1),'b')

h=0.01;
theta_fcn=MidpointMethod(w,h,0,[]);
plot(0:h:t_max,theta_fcn(:,1),'g')

beta=sqrt(g/L);
phi=pi/2;
t=0:0.1:t_max;
plot(t,sin(beta.*t+phi),'c')

legend('0.1','0.05','0.01','Analytical')
title('Midpoint')
%% Runge-Kutta 4th Order
% close all; clc;
figure
hold on
w=[theta_0 omega_0];
h=0.1;
theta_fcn=RK4(w,h,0,[]);
plot(0:h:t_max,theta_fcn(:,1),'r')

h=0.05;
theta_fcn=RK4(w,h,0,[]);
plot(0:h:t_max,theta_fcn(:,1),'b')

h=0.01;
theta_fcn=RK4(w,h,0,[]);
plot(0:h:t_max,theta_fcn(:,1),'g')

beta=sqrt(g/L);
phi=pi/2;
t=0:0.1:t_max;
plot(t,sin(beta.*t+phi),'c')

legend('0.1','0.05','0.01','Analytical')
title('Runge-Kutta')