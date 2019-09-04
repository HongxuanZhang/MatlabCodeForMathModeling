function [f,g] = fun1(x,res,A,AAeq,bbeq,AAAeq,bbbeq)
f=res*x*0.0008^(length(x)-sum(x==0));
h1=A*x-[400;600];
h2=AAeq*x-bbeq';
h3=AAAeq*x-bbbeq';
g(1)=sum(h1<=0)==2;
g(2)=sum(h2<=0 & h2>=-0.9*bbeq')==53;
g(3)=sum(h3<=0)==53;
