%    Adýmda resimde her  bir madeni paradan kaç adet olduðunu saydýrma
%% 1-Önce resmin olduðu dosya okunur.
%% 2- Resmin arka planý yok edilir.
%%Dikkat ilgilenilen eleman beyaz,arka plan siyah olacak   
I=paralar(:,:,1)/3+paralar(:,:,2)/3+paralar(:,:,3)/3;
%I=rgb2gray(I);
I=255-I;
imshow(I);figure
background=imopen(I,strel('ball',50,50));
%% Burda disk çapýný büyütüp küçülterek sonucu inceleyiniz.
imshow(background);figure
I=I-background;%Iþýk farklýlýklarý yok oluyor.Çekimden kaynaklý
imshow(I)
%3- Görüntü kontrastý ayarlanýr.
 figure; 
 I=imadjust(I);
 %4-Görüntü filtrelenir.
 I=medfilt2(I);
  figure; imshow(I) 
%5-Görüntü ikili resme dönüþtürülür. 
level = graythresh(I);
bw = im2bw(I,level);
imshow(bw)
%6- Görüntüde açma yapýlýr
%bw1 = bwareaopen(bw, 60);
bw1=imclose(bw,strel('disk',3));
bw1=imerode(bw1,strel('disk',6));
figure, imshow(bw1)
%7-Görüntüde boþluklar doldurulur.
bw = imfill(bw,'holes');
figure, imshow(bw)
%8- 8 komþulukla birbirine baðlý nesneler bulunur.        
cc = bwconncomp(bw, 8);
cc.NumObjects

grain = false(size(bw));
grain(cc.PixelIdxList{20}) = true;
figure, imshow(grain);
labeled = labelmatrix(cc)
RGB_label = label2rgb(labeled, @spring, 'c', 'shuffle');
figure, imshow(RGB_label)
graindata = regionprops(cc, 'basic')
 for i=1:cc.NumObjects
a(i)=graindata(i).Area
 end
 
 
 
 
 
 a=[12 12 12 31 31 31 4 4 4 4 4 4 4 4 4 4 4 4 4 12 12 12 12 12 12 12 31 31 31 31 31]
 fark=ones(cc.NumObjects+1,1);
  k=a(1);nesne_say=1;kontrol=1;
for p=1:cc.NumObjects
    kontrol=1;
  for i=2:cc.NumObjects
                
if a(i)==k
    fark(nesne_say)=fark(nesne_say)+1;
                    
end

     
 end
 for j=2:cc.NumObjects
        if k==a(j)
            continue;
        else
              k=a(j);nesne_say=nesne_say+1;kontrol=0;break;
        end
    
 end
 if kontrol==1 
     break;
 end
end
for i=1:nesne_say;
    fark(i) 
end
    

 

 

 