test=test(:,:,1);
x=x(:,:,1);
[en,boy]=size(x);
[a,b]=size(test);
T=[];
for i=1:en-a
    for j=1:boy-b
 t=(x(i:i+a-1,j:j+b-1)-test);
 t1=sum(t(:));
 T=[T t1];
    end
end

%Tolerans ortalama+-5 piksel olsa fark=5*81*79 olur.
 sum(T<5*a*b)