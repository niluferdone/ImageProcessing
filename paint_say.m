
%Matlab'da nesne sayd�rma
%addpath K:\Bilgisayar M�hendisli�i\Do�.Dr.Pakize ERDOGMUS\goruntu_isleme\derste_yap�lanlar\hafta_10
%I=imread('ads�z.bmp');
I=a;
I=rgb2gray(I);
I=imdilate(I,strel('ball',12,12));
imshow(I);
I=I>200;
%I=1-I;
imshow(I);
[cc,Num]=bwlabel(I,8);
