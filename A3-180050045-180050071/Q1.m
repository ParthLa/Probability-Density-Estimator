n_array=[1:2000];
f=arrayfun(@(y) expect(y),n_array);
%g=arrayfun(@(z) z*log,n_array);
plot(n_array,f);
xlabel('n');
ylabel('E(X(n))');
%hold on;
%plot(n_array,g);

function[val]=expect(n)
a=[1:n];
s=sum(arrayfun(@(x) 1/x,a));
val=s*n;
end
