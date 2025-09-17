function [a l1]=predictcnn(cnn,test_xx,test_yy)
 [testcnn1,testcnn2]=CNN_Data(test_xx,test_yy);
 cnn = ffcnn(cnn, test_xx);
 rsdata=zeros(1,size(cnn.cnndata1,3));
 for ii=1:size(cnn.cnndata1,3)
      rsdata(1,ii)=1-ffncnn(testcnn1,testcnn2,cnn.cnndata1(:,:,ii),cnn.cnndata2(:,:,ii));
 end
 cnn.out=rsdata;
 if cnn.layers{cnn.no_of_layers}.type ~= 'f'
  zz=[];
  for k=1:cnn.layers{cnn.no_of_layers}.no_featuremaps
                   ss =size(cnn.layers{cnn.no_of_layers}.featuremaps{k});
                   zz =[zz; reshape(cnn.layers{cnn.no_of_layers}.featuremaps{k}, ss(1)*ss(2), ss(3))];
  end
   cnn.layers{cnn.no_of_layers}.outputs = zz;
 end
[a1, l1]=max(cnn.out);
if a1>=0.6
    a=1;
else
    a=2;
end

