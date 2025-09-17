clc;
clear all;
close all
Tdata=input('Do You Need Training Process(Enter (Yes for 1) and (No for 2)...........');
if(Tdata==1)
Traindata
end
disp('Process start....');
%------------ Image Reading ------------------------------------------
[FILENAME,PATHNAME]=uigetfile('*.jpg','Select the IRis Image');
FilePath=strcat(PATHNAME,FILENAME);
disp('The Image File Location is');
disp(FilePath);
[DataArray,map]=imread(FilePath);
[filepath,name,ext] = fileparts(FilePath);
DataArray5=DataArray;
DataArray=imresize(DataArray,[150,200]);
figure,imshow(DataArray,map);
title('Test-image');
testimage=DataArray;
%-------------Calculating Height and Width of picture----------------
[ImH,ImW,C]=size(DataArray);
disp('Image Heigt');
disp(ImH);
disp('Image Width');
disp(ImW);
disp('Color Channel');
disp(C);
rminiris=30;
rmaxiris=100;
if(C==3)
DataArray=rgb2gray(DataArray);
end
[ci,cp,o]=thresh(DataArray,rminiris,rmaxiris);
figure,
imshow(o)
title('Iris and Pupil Boundary');
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
figure,
imshow(uint8(segment))
title('Iris Detection');
segment=uint8(segment);
im=segment;
U=7;
R=U-1;
Input_Im = uint8(segment);
row_max = size(Input_Im,1)-U+1;
col_max = size(Input_Im,2)-U+1;
F = zeros(row_max+R, col_max+R);
Y = zeros(row_max+R, col_max+R); 
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

F1 = zeros(row_max+R, col_max+R);
Y1 = zeros(row_max+R, col_max+R); 
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
% 
A=uint8(Y_Med);
radial_res = 60;
angular_res = 240;
[Pdata,Ndata] = normaliseiris(double(DataArray), ci(2),...
    ci(1), ci(3), cp(2), cp(1), cp(3), radial_res, angular_res);
figure,imshow(Pdata)
title('Normalized image');

% % ---------------CNN------
addpath('SWIMdata')
load train.mat
TrainLab=[Train_LabP Train_LabN];
TrainF=zeros(66,66,size(TrainLab,2)/2);
P_Train=imresize(PPData,[66 66]);
N_Train=imresize(NPData,[66 66]);
TrainF(:,:,1:size(P_Train,3))=P_Train(:,:,1:1:size(P_Train,3));
TrainF(:,:,size(P_Train,3)+1:size(TrainLab,2)/2)=N_Train(:,:,size(P_Train,3)+1:1:size(TrainLab,2)/2);
cnn.namaste=1; 
cnn=initcnn(cnn,[66 66]);
cnn=cnnAddConvLayer(cnn, 8, [3 3], 'tanh');
 cnn=cnnAddPoolLayer(cnn, 2, 'mean');
cnn=cnnAddConvLayer(cnn, 4, [3 3], 'tanh');
 cnn=cnnAddPoolLayer(cnn, 2, 'mean');
cnn=cnnAddFCLayer(cnn,36, 'tanh' ); %add fully connected layer
cnn=cnnAddFCLayer(cnn,2, 'sigm' ); %add fully connected layer % last layer no of nodes = no of lables
no_of_epochs = 8;
batch_size=2;
display 'training started...Wait for ~200 seconds...'
tic
cnn=traincnn(cnn,TrainF,TrainLab, no_of_epochs,batch_size);
display '...training finished.'
[a,Out]=predictcnn(cnn, Pdata,Ndata);
Mimg=char(Fname{Out});
if(a==1)
    Mdata=strcat('Train_Data/',Mimg,'.jpg');
    figure,
    suptitle('Iris Recognition');
    subplot(1,2,1)
    imshow(testimage);
    title('Original Image');
    subplot(1,2,2)
    imshow(Mdata);
    title('Matched Image');
    pause(0.5);
    Mchar=strcat('Matched ID: ',Mimg);
    msgbox(Mchar);
    
else
    figure,
    suptitle('Iris Recognition');
    subplot(1,2,1)
    imshow(testimage);
    title('Original Image');
    subplot(1,2,2)
    imshow(zeros(size(testimage,1),size(testimage,2)));
    title('Not Matched Image');   
    pause(0.5);
    msgbox('Not Matched: Image added to Train Database');
    
%     Mdata=strcat('Train_Data/',name,'.jpg');
%     imwrite(DataArray5,Mdata);
    
end
