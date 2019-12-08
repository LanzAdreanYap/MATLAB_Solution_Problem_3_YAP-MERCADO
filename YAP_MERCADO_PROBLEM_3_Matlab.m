function ExpPo()
%Input values
a = input('Input experimental points [xi,yi]: ');
least = inf;

%   Get the x values of a
xi = a(:,1);
%Get the y values of a
yi = a(:,2);

%Get the size of a
%-1 to the size to disregard constant
s = (size(a,1))-1;

for d = 1:s %Set a for loop 1 to s
    pf = polyfit(xi,yi,d);
    pv = polyval(pf,xi);
    e = yi-pv;
    en = norm(e);
    if en < least
        least = en;
        bestfit = pf;
    end
end
bestfit
plot(xi,yi,'o','markerfacecolor','r')
hold on
plot(min(xi):0.0001:max(xi),polyval(bestfit,min(xi):0.0001:max(xi)))
hold off
grid on
xlabel 'x'
ylabel 'y'
legend('Best fit graph','xi and yi')
