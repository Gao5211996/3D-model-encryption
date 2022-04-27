 function [x1,x2,y1,y2,mu1,mu2]=key(S)
%   [Face, Vertex] = stlread('racingcar.stl');
 P=double(S);
h = hash(P,'SHA-256') ;
[b] = T_16_to_2(h,256);
for i=1:16
    c=b((16*(i-1)+1):(16*i));
   c=num2str(c);
   c=bin2dec(c);
     d(i)=c;
end
for i=1:8
    q(i)=bitxor(d(2*i-1),d(2*i));
end
for i=1:6
    k(i)=bitxor(bitxor(q(i),q(i+1)),q(i+2));
end
for i=7:18
    k(i)=bitxor(k(i-1),k(i-6));
end
x1=k(13)/65536;
x2=k(14)/65536;
y1=k(15)/65536;
y2=k(16)/65536;
mu1=k(17)/65536*96+4;
mu2=k(18)/65536*96+4;



