%% Plaka Tanýma 
clc;
clear all;
% Bu proje üç aþamadan oluþuyor. 
%% 1 -Görüntü ön iþleme
I=imread('plakam_2.png');                       % Görüntüyü yükleme ve ön iþleme
I=rgb2gray(I);
imshow(I);
figure;
t=graythresh(I);
bw=~im2bw(I,t);%Resmin ikili halinin tümleyenini alýyorum. Matlab görüntü iþlemede arkaplan siyah, önplan beyaz olmalý.

%% 2- Carakter tanýma
%imagen = bwareaopen(imagen,30);%Eðer resim gerçek resim ise;
word=[ ];
re=I;
%Plakayý texte çevirip yazmak için dosya oluþtur.
fid = fopen('text.txt', 'wt');
%Daha önceden oluþturulmuþ templateleri yükle
load templates
global templates
num_letras=size(templates,2);%  Templetedeki harf ve karakter sayýsý elde ediliyor.

    [L Ne] = bwlabel(bw);    %Ne bulunan harf sayýsý
    for n=1:Ne
        [r,c] = find(L==n); % Bulunan kapalý bölgeinin row ve columnlarý
        % Bu alaný kapalý bir dikdortgen içine al
        n1=bw(min(r):max(r),min(c):max(c));  
        % Yeniden boyutlandýr
        img_r=imresize(n1,[42 24]);
        % Görüntüyü texte dönüþtürme iþlemil
        letter=read_letter(img_r,num_letras);
        % Harfi texte ekle
        word=[word letter];
    end
    
    fprintf(fid,'%s\n',word);%Yaz
fclose(fid);
%Open 'text.txt' file
winopen('text.txt')
