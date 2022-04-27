
function h = hash(inp,meth) 
% HASH - Convert an input variable into a message digest using any of  several common hash algorithms 
% ��������Ϣת���ļ��ֳ����Ĺ�ϣ�㷨����
% USAGE: h = hash(inp,'meth') 
% ʹ�÷�����inpΪ���������meth��Ҫʹ�õĹ�ϣ����
% inp  = input variable, of any of the following classes: 
%���������κ�һ�ֱ���������
%        char, uint8, logical, double, single, int8, uint8, 
%        int16, uint16, int32, uint32, int64, uint64 
% h    = hash digest output, in hexadecimal notation  ��16���Ʊ�ʾ����ϣժҪ�����
% meth = hash algorithm, which is one of the following: �����Ǹ��ǹ�ϣ�㷨
%        MD2, MD5, SHA-1, SHA-256, SHA-384, or SHA-512  
% ��Щ��ϣ�㷨��ɶ�����أ�һ�ֽ����ⳤ�ȵ���Ϣѹ����ĳһ�̶����ȵ���ϢժҪ�ĺ�����
% NOTES: (1) If the input is a string or uint8 variable, it is hashed  as usual for a byte stream. Other classes are converted into  their byte-stream values. In other words, the hash of the  following will be identical: 
%       ����������ַ�����uint8����������������һ�����ֽ�������ɢ�С������౻ת��Ϊ���ǵ��ֽ���ֵ�����仰˵������Ĺ�ϣ����ͬ��: 
%                     'abc' 
%                     uint8('abc') 
%                     char([97 98 99]) 
%            The hash of the follwing will be different from the above, because class "double" uses eight byte elements: 
%            �����ɢ�н�������Ĳ�ͬ����Ϊ�ࡰdouble��ʹ����8���ֽ�Ԫ��:
%                     double('abc') 
%                     [97 98 99] 
%            You can avoid this issue by making sure that your inputs  are strings or uint8 arrays.
%              ������ͨ��ȷ�������������ַ�����uint8����������������⡣
%        (2) The name of the hash algorithm may be specified in lowercase  and/or without the hyphen, if desired. For example
%           �����Ҫ����ϣ�㷨�����ƿ�����Сд��ĸ��/�򲻴����ַ�ָ��������
%            h=hash('my text to hash','sha256'); 
%        (3) Carefully tested, but no warranty. Use at your own risk. 
 %        ������ϸ���ԣ���û�б�֤�����ге�ʹ�÷��ա�
%        (4) Michael Kleder, Nov 2005 
% 
% EXAMPLE: 
% 
% algs={'MD2','MD5','SHA-1','SHA-256','SHA-384','SHA-512'}; 
% for n=1:6 
%     h=hash('my sample text',algs{n}); 
%     disp([algs{n} ' (' num2str(length(h)*4) ' bits):']) 
%     disp(h) 
% end 

inp=inp(:); 
% convert strings and logicals into uint8 format 
if ischar(inp) || islogical(inp) 
    inp=uint8(inp); 
else % convert everything else into uint8 format without loss of data 
    inp=typecast(inp,'uint8'); 
end 

% verify hash method, with some syntactical forgiveness: 
meth=upper(meth); 
switch meth 
    case 'SHA1' 
        meth='SHA-1'; 
    case 'SHA256' 
        meth='SHA-256'; 
    case 'SHA384' 
        meth='SHA-384'; 
    case 'SHA512' 
        meth='SHA-512'; 
    otherwise 
end 
algs={'MD2','MD5','SHA-1','SHA-256','SHA-384','SHA-512'}; 
if isempty(strmatch(meth,algs,'exact')) 
    error(['Hash algorithm must be ' ... 
        'MD2, MD5, SHA-1, SHA-256, SHA-384, or SHA-512']); 
end 

% create hash 
x=java.security.MessageDigest.getInstance(meth); 
x.update(inp); 
h=typecast(x.digest,'uint8'); 
h=dec2hex(h)'; 
if(size(h,1))==1 % remote possibility: all hash bytes  128, so pad: 
    h=[repmat('0',[1 size(h,2)]);h]; 
end 
h=lower(h(:)'); 
clear x 
return