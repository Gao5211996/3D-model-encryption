 function [CCCC,MAC,AA,MM,S]=jiami1(Vertex)
% clc
% clear
% [Face, Vertex] = stlread('pumpkin.stl');
tic
P=Vertex;
[x1,x2,y1,y2,mu1,mu2]=key(P);
tic
MM=min(min(P));
if MM<=0
    P=P-MM+1;
end
 A=max(max(P));
 for i=1:20
     if 2^i>=A
         AA=2^i;
         break
     end
 end

% AA=floor(A)+1;
[Ar,As]=size(Vertex);
P=reshape(P,Ar/3,9);
[x,y]=LAIC(x1,y1,mu1,Ar*3);
[u,v]=LAIC(x2,y2,mu2,Ar*3);
h1(1,:)=1:Ar/3;
h1(2,:)=x(1:Ar/3);
h1=h1';
H1=sortrows(h1,2);  
L1=H1(:,1);   %产生第1个序列


hh1(1,:)=1:9;
hh1(2,:)=y(1:9);
hh1=hh1';
HH1=sortrows(hh1,2);  
L2=HH1(:,1);   %产生第1个序列
for i=1:9
    for j=1:Ar/3
        S1(j,i)=P(L1(j),L2(i));
    end
end
S=S1-floor(S1);

% S=S1;
NN=1000;
n= floor(Ar/(3*NN));
for i=1:n
    ZZ=u(9*i-8:9*i);
    ZZ=reshape(ZZ,3,3);
    SS=S((NN*i-NN+1):NN*i,1:9);
%     C((NN*i-NN+1):NN*i,1:9)=SS*ZZ;
      F((NN*i-NN+1):NN*i,1:9)=easyzbkron(SS,ZZ);
end
ZZ=u(9*n-8:9*n);
    ZZ=reshape(ZZ,3,3);
 F(n*NN+1:Ar/3,1:9)=easyzbkron(S(n*NN+1:Ar/3,1:9),ZZ);
 MAC=floor(max(max(F)))+1;
%  for i=1:100
%      if MAC>=10^(i-1)
%          MAC=(10^i);
%          break
%      end
%  end
  C=F/MAC;
 
%   C=C



IS = floor(S1);
D=v(1:Ar*3);
D=reshape(D,Ar/3,9);
D=floor(D*AA);
% IC=bitxor(D,IS);
IC(1,1)=bitxor(IS(1,1),D(1,1));

for i=2:Ar/3
    IC(i,1) = bitxor(bitxor(IC(i-1,1),IS(i,1)),D(i,1));
end
for i=2:9
        IC(:,i) = bitxor(bitxor(IC(:,i-1),IS(:,i)),D(:,i));
end
E=y(1:Ar*3);
E=reshape(E,Ar/3,9);
E=floor(E*AA);
ICC=zeros(Ar/3,9);
ICC(1,9)=bitxor(IC(1,9),E(1,9));

for i=2:Ar/3
    ICC(i,9) = bitxor(bitxor(ICC(i-1,9),IC(i,9)),E(i,9));
end
% for i=8:-1:1
%         ICC(:,i) = bitxor(bitxor(ICC(:,i+1),IC(:,i)),E(:,i+1));
% end
for i=8:-1:1
        ICC(:,i) = bitxor(bitxor(ICC(:,i+1),IC(:,i)),E(:,i));
end
CCCC1=ICC+C;
% toc
CCCC=reshape(CCCC1,Ar,3);
toc






