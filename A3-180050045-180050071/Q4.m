x=randn(1000,1);
y=4*x;
T=y(1:750);
V=y(751:1000);
sigma=[0.001, 0.1, 0.2, 0.9, 1, 2, 3, 5, 10, 20, 100];

g=arrayfun(@(z) log_likelihood(T,V,z),sigma);
[M,I] = max(g);
disp("Printing for Log Likelihood");
disp("Value of Sigma for which maximum occurs:")
disp(sigma(I));
disp("Corresponding Value for Log Likelihood:")
disp(M);

logsigma = arrayfun((@(x) log(x)),sigma);
figure(1);
plot(logsigma,g);
xlabel('log(sigma)');
ylabel('Log Likelihood');
title('Log Likelihood versus Log Sigma');

sumdiff = arrayfun(@(x) sumsquare(T,V,x),sigma);
[M1,I1] = min(sumdiff);
disp("Printing for D");
disp("Value of Sigma for which minimum occurs:");
disp(sigma(I1));
disp("Corresponding Value for D:");
disp(M1);
figure(2);
plot(logsigma,sumdiff);
xlabel('log(sigma)');
ylabel('D');
title('D versus Log Sigma');

%returns value of pdf at x
function[v]= probab(T,x,sigma)
temp=numel(T);
v=sum(arrayfun(@(y) exp(-1*((y-x)^2)/(2*sigma*sigma))/(temp*sigma*sqrt(2*pi)),T));
end

%returns log likelihood for a particular sigma
function[ll]= log_likelihood(T,V,sigma)
ll=sum(arrayfun(@(x) log(probab(T,x,sigma)),V));
end

%returns probability from a Gaussian Distribution
function[prob] = gs(x,sig)
prob = exp(-1*x*x/(2*sig*sig))/(sig*sqrt(2*pi));
end

%returns value of D
function[s]= sumsquare(T,V,sigma)
s = sum(arrayfun(@(x) (gs(x,4)-probab(T,x,sigma)).^2,V));
end
