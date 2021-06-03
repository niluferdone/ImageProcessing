%Kodlama ile yayma
I=zeros(400);
for i=1:400
    for j=1:400
        if (i-200)^2+(j-200)^2<40^2
            I(i,j)=1;
        end
    end
end
imshow(I)
se=ones(15);
for i=8:392
    for j=8:392
        P=I(i-7:i+7,j-7:j+7);
        P1=and(se,P);
        P1=P1(:);
        P2=P1==1;
        if sum(P2)~=0
        J(i,j)=1;
        else
            J(i,j)=0;
        end
    end
end
imshow(I);figure;imshow(J)