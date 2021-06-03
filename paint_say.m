
%Matlab'da nesne saydýrma
%addpath K:\Bilgisayar Mühendisliði\Doç.Dr.Pakize ERDOGMUS\goruntu_isleme\derste_yapýlanlar\hafta_10
%I=imread('adsýz.bmp');
I=a;
I=rgb2gray(I);
I=imdilate(I,strel('ball',12,12));
imshow(I);
I=I>200;
%I=1-I;
imshow(I);
[cc,Num]=bwlabel(I,8);
