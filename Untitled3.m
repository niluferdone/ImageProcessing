%% Rastgele resim olu�turma
I=zeros(400);
n=input('Rastgele daire say�s�');
for i=1:n
    kx=fix(rand*400);
    ky=fix(rand*400);
    R=fix(rand*60);
    for i=1:400
        for j=1:400
            if(i-kx)^2+(j-ky)^2<R^2
                I(i,j)=1;
            end
        end
    end
end
imshow(I)
%% Erozyon i�lemi
se=strel('disk',20);%Kare yap� eleman� ile
J=imerode(I,se);
figure;imshow(J)
            