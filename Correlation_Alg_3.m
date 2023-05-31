clc
close all
clear all;
A = [3 4 5 6 2];
B = [4 5 6];
Correlation_Function=xcorr(A,B)
correlation_length = length(A) + length(B) - 1;

correlation = zeros(1, correlation_length);

for i = 1:length(A)
    for j = 1:length(B)
        correlation(1,i+j-1) = correlation(1,i+j-1) + A(1,i)*B(1,end-j+1);
    end
end
disp('Correlation_Code=')
disp(correlation);
