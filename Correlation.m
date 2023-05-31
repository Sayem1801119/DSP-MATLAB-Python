clc
clear all;
x=[3 4 5 6 2];
y=[4 5 6];
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
    CRs=A.*Xnew;
    CRR(i)=sum(CRs);
end
Cross_correlation=[Lag;CRR]
subplot(3,1,1)
n1=1:m;
stem(n1,x,'filled','blue',linewidth=2)
title('x[n]')
xlabel('Sample Index')
text(n1, x, num2str(x', '%d\n'), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left')
subplot(3,1,2)
n2=1:n;
stem(n2,y,'filled','red',linewidth=2)
title('y[n]')
xlabel('Sample Index')
text(n2, y, num2str(y', '%d\n'), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left')
subplot(3,1,3)
n3=-(n-1):(m-1);
stem(n3,CRR,'filled','green',linewidth=2)
title('Correlation, r[n]')
xlabel('Lag Index')
text(n3, CRR, num2str(CRR', '%d\n'), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left')
