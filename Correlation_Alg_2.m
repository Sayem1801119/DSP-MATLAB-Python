clc
clear all;
x=[2 -1 3 7 1 2 -3];
y=[1 -1 2 -2 4 1 -2 5];
r=xcorr(x,y);
m=length(x);
n=length(y);
Lag=-(n-1):(m-1);
L=m+n-1;
znum=L-m;
Z=zeros(1,znum);
Xnew=[Z x Z];
for i=1:L
    A=zeros(1,L+znum);
    for k=1:n
        p=n-k;
    A(1,i+p)=y(1,p+1);
    end
    CRs=0;
    for j=1:L+znum
        if A(j)~=0 && Xnew(j)~=0
    CRs(j)=A(j).*Xnew(j);
    CRR(i)=sum(CRs);
        end
    end
end
Correlation=CRR
