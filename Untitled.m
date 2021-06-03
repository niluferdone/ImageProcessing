% Resim üzerinde Morfolojik iþlemler
%% 400X400 alanda yarýcapý 40 olan daire
I=zeros(400);
for i=1:400
    for j=1:400
        if (i-200)^2+(j-200)^2<40^2
            I(i,j)=1;
        end
    end
end
imshow(I)
%% Yayma iþlemi
se=strel('square',85);%Kare yapý elemaný ile
J=imdilate(I,se);
figure;imshow(J)
%Disk ile
se=strel('disk',25);%Kare yapý elemaný ile
J=imdilate(I,se);
figure;imshow(J)
%Ball ile 
se = strel('line',200,2);  
J=imdilate(I,se);
figure;imshow(J)
%%% Resim üzerinde aþýndýrma iþlemi
imshow(I);figure;
se=strel('square',25);%Kare yapý elemaný ile
J=imerode(I,se);
figure;imshow(J)
