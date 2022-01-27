function gVec=gFcn(t,w,h)
global L;
global g;

g2=-(g/L)*sin(w(1));
g1=w(2);
gVec=[g1 g2];
end
