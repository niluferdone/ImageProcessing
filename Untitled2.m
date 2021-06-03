% Resim üzerinde Morfolojik iþlemler
%% 400X400 alanda yarýcapý 60 olan daire
I=zeros(400);
for i=1:400
    for j=1:400
        if (i-200)^2+(j-200)^2<60^2
            I(i,j)=1;
        end
    end
end
I(190:210,190:210)=0;
imshow(I)
%% Yayma iþlemi
se=strel('square',25);%Kare yapý elemaný ile
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
  
