%% Rastgele resim oluþturma
I=zeros(400,400,3);
n=input('Rastgele daire sayýsý');
for i=1:n
    kx=fix(rand*400);
    ky=fix(rand*400);
    R=fix(rand*60);
    r=fix(rand*256); g=fix(rand*256); b=fix(rand*256);
    for i=1:400
        for j=1:400
            if(i-kx)^2+(j-ky)^2<R^2
                I(i,j,1)=r;
                I(i,j,2)=g;
                I(i,j,3)=b;
            end
        end
    end
end
imshow(uint8(I))
            