% clc;
% clear all;
% close all;
delete train.mat
FilePathStorage=pwd;
FilePathname=strcat(FilePathStorage,'/Train_Data/');
FilePathname1=strcat(FilePathStorage,'/SWIMdata/');
matfileName1=strcat(FilePathname1,'train','.mat');
delete(matfileName1);
FiledirName=dir([FilePathname '*.jpg']);
TotalImages=size(FiledirName,1);
PPData=zeros(60,240,TotalImages);
NPData=zeros(60,240,TotalImages);
Train_LabP=zeros(2,TotalImages);
Train_LabN=zeros(2,TotalImages);
h = waitbar(0,'Please wait...');
for jjjj=1:TotalImages
Filename=FiledirName(jjjj).name;
FilePathDatabase=[FilePathname,Filename];
[filepath,name,ext] = fileparts(FilePathDatabase);
[DataArray,map]=imread(FilePathDatabase);
DataArray=imresize(DataArray,[150,200]);
disp('Training');
disp(Filename);
testimage=DataArray;
%-------------Calculating Height and Width of picture----------------
[ImH,ImW,C]=size(DataArray);
% disp('Image Heigt');
% disp(ImH);
% disp('Image Width');
% disp(ImW);
% disp('Color Channel');
% disp(C);
rminiris=30;
rmaxiris=100;
if(C==3)
DataArray=rgb2gray(DataArray);
end
[ci,cp,o]=thresh(DataArray,rminiris,rmaxiris);
% figure,
% imshow(o)
% title('Iris and Pupil Boundary');
circleImage = false(ImW,ImH);
[x, y] = meshgrid(1:ImW, 1:ImH); 
circleImage((x - ci(2)).^2 + (y - ci(1)).^2 <= ci(3).^2) = true; 
% circleImage((x - cp(2)).^2 + (y - cp(1)).^2 <= cp(3).^2) = true; 
maskedImage = DataArray;
maskedImage(~circleImage) = 255;
circleImage1 = false(ImW,ImH);
circleImage1((x - cp(2)).^2 + (y - cp(1)).^2 <= cp(3).^2) = true; 
maskedImage1 = maskedImage;
maskedImage1(~circleImage1) = 255;
segment=zeros(ImH,ImW);
for ii=1:ImH
    for jj=1:ImW
        if(maskedImage1(ii,jj)<100)
            segment(ii,jj)=255;
        else
            segment(ii,jj)=maskedImage(ii,jj);
        end
    end
end
% figure,
% imshow(uint8(segment))
% title('Iris Detection');
segment=uint8(segment);
im=segment;
% Fuzzified Image Filters
U=7;
R=U-1;
Input_Im = uint8(segment);
row_max = size(Input_Im,1)-U+1;
col_max = size(Input_Im,2)-U+1;
F = zeros(row_max+R, col_max+R);
Y = zeros(row_max+R, col_max+R); 
% Triangular Fuzzy Average Filter
for i = 1:row_max
    for j = 1:col_max     
        A = Input_Im(i:i+U-1, j:j+U-1);
        Amax=max(max(A));
        Amin=min(min(A));
        Amav=mean(mean((A)));
        xmv=max(Amax-Amav,Amav-Amin);
        if((abs(Input_Im(i,j))-Amav)/xmv)<=xmv
        F(i,j) = 1-((abs(Input_Im(i,j))-Amav)/xmv);
        elseif(xmv==0)
        F(i,j)=1;   
        end
    end      
end
for i = 1:row_max
    for j = 1:col_max
        A = Input_Im(i:i+U-1, j:j+U-1);
        B=F(i:i+U-1, j:j+U-1);
        P=sum(sum(A)).*sum(sum(B));
        P1=sum(sum(B));
        Y(i,j) = P/P1;
   end      
end;  
Y_Avg=Y./max(max(Y));
Y_Avg=uint8(Y_Avg.*255);
% figure,imshow(Y_Avg);
% title('Triangular Fuzzy Average Filter');
F1 = zeros(row_max+R, col_max+R);
Y1 = zeros(row_max+R, col_max+R); 
% Triangular Fuzzy Average Filter
for i = 1:row_max
    for j = 1:col_max     
        A = Input_Im(i:i+U-1, j:j+U-1);
        Amax=max(max(A));
        Amin=min(min(A));
        Amedian=median(median((A)));
        xmedian=max(Amax-Amedian,Amedian-Amin);
        if((abs(Input_Im(i,j))-Amedian)/xmedian)<=xmedian
        F1(i,j) = 1-((abs(Input_Im(i,j))-Amedian)/xmedian);
        elseif(xmedian==0)
        F1(i,j)=1;   
        end
    end      
end
for i = 1:row_max
    for j = 1:col_max
        A = Input_Im(i:i+U-1, j:j+U-1);
        B=F1(i:i+U-1, j:j+U-1);
        P=sum(sum(A)).*sum(sum(B));
        P1=sum(sum(B));
        Y1(i,j) = P/P1;
   end      
end;  
Y_Med=Y1./max(max(Y1));
Y_Med=uint8(Y_Med.*255);
% figure,imshow(Y_Med);
% title('Triangular Fuzzy Median Filter');
% 
A=uint8(Y_Med);
radial_res = 60;
angular_res = 240;
[Pdata,Ndata] = normaliseiris(double(DataArray), ci(2),...
    ci(1), ci(3), cp(2), cp(1), cp(3), radial_res, angular_res);
% figure,imshow(Pdata)
% title('Normalized image');
PPData(:,:,jjjj)=Pdata(:,:);
NPData(:,:,jjjj)=Ndata(:,:);
Fname{jjjj,1}=name;
Train_LabP(1,jjjj)=1;
Train_LabP(2,jjjj)=0;
Train_LabN(1,jjjj)=0;
Train_LabN(2,jjjj)=1;
pause(0.1);
waitbar(jjjj / TotalImages, h, sprintf('Progress: %d %%', floor(jjjj / TotalImages * 100)));
end
close(h);
msgbox('Training Done!')
save train.mat PPData NPData Fname Train_LabP Train_LabN
matfileName=strcat(FilePathname1,'train','.mat');
save(matfileName,'PPData','NPData','Fname','Train_LabP','Train_LabN');