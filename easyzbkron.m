function [zb]=easyzbkron(A,B)  %根据公式，计算半张量积
[m,n]=size(A);  %判断矩阵A的大小
[p,q]=size(B);  %判断矩阵B的大小
if n>p         
    t=n/p;     %n=tp
    IT=eye(t);  %生成t维单位矩阵
    zb=A*kron(B,IT);
end
if n<p
    t=p/n;
    IT=eye(t);
    zb=kron(A,IT)*B;
end