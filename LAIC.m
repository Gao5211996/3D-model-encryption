 function [x,y]=LAIC(x0,y0,mu,n)
% clc
% clear
% n=10000;
% a =1;
% x0=0.6254125;
% y0=0.15236925;
a=mu;
x(1)=x0;
y(1)=y0;
for i=1:n+200
    x(i+1) = sin(pi*a*x(i)*(1-x(i)) + pi*sin(a*(1-a)/y(i))+exp(1));
    y(i+1) = sin(pi*(1-a)*y(i)*(1-y(i)) + pi*sin(x(i)/a)+exp(1));
end
x=abs(x(202:end));
y=abs(y(202:end));

% figure('color',[1 1 1]);
% plot(x0,y0,'r')
%plot(x(1000:end),y(1000:end),'.')
% plot(x(1000),y(1000),'.')

% scatter(x(1000:end),y(1000:end),'.','g')
% % set(gca,'FontSize',12,'Fontname', 'Times New Roman');
% xlabel('x','Fontname', 'Times New Roman','Fontangle','italic')
% ylabel('y','Fontname', 'Times New Roman','Fontangle','italic')
% % xlabel('\mu','Fontname', 'Times New Roman','Fontangle','italic')
% % ylabel('y','Fontname', 'Times New Roman','Fontangle','italic')