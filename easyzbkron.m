function [zb]=easyzbkron(A,B)  %���ݹ�ʽ�������������
[m,n]=size(A);  %�жϾ���A�Ĵ�С
[p,q]=size(B);  %�жϾ���B�Ĵ�С
if n>p         
    t=n/p;     %n=tp
    IT=eye(t);  %����tά��λ����
    zb=A*kron(B,IT);
end
if n<p
    t=p/n;
    IT=eye(t);
    zb=kron(A,IT)*B;
end