%% Plaka Tan�ma 
clc;
clear all;
% Bu proje �� a�amadan olu�uyor. 
%% 1 -G�r�nt� �n i�leme
I=imread('plakam_2.png');                       % G�r�nt�y� y�kleme ve �n i�leme
I=rgb2gray(I);
imshow(I);
figure;
t=graythresh(I);
bw=~im2bw(I,t);%Resmin ikili halinin t�mleyenini al�yorum. Matlab g�r�nt� i�lemede arkaplan siyah, �nplan beyaz olmal�.

%% 2- Carakter tan�ma
%imagen = bwareaopen(imagen,30);%E�er resim ger�ek resim ise;
word=[ ];
re=I;
%Plakay� texte �evirip yazmak i�in dosya olu�tur.
fid = fopen('text.txt', 'wt');
%Daha �nceden olu�turulmu� templateleri y�kle
load templates
global templates
num_letras=size(templates,2);%  Templetedeki harf ve karakter say�s� elde ediliyor.

    [L Ne] = bwlabel(bw);    %Ne bulunan harf say�s�
    for n=1:Ne
        [r,c] = find(L==n); % Bulunan kapal� b�lgeinin row ve columnlar�
        % Bu alan� kapal� bir dikdortgen i�ine al
        n1=bw(min(r):max(r),min(c):max(c));  
        % Yeniden boyutland�r
        img_r=imresize(n1,[42 24]);
        % G�r�nt�y� texte d�n��t�rme i�lemil
        letter=read_letter(img_r,num_letras);
        % Harfi texte ekle
        word=[word letter];
    end
    
    fprintf(fid,'%s\n',word);%Yaz
fclose(fid);
%Open 'text.txt' file
winopen('text.txt')
