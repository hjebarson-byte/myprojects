function [Tdata, Mdata] = CNN_Data(Pdata,Ndata)
nscales=1;
mlength=18;
mdata=1; 
sigmaOnf=0.5;
Edata = Kernal_convolve(Pdata, nscales, mlength, mdata, sigmaOnf);
length = size(Pdata,2)*2*nscales;
Tdata = zeros(size(Pdata,1), length);
length2 = size(Pdata,2);
h = 1:size(Pdata,1);
Mdata = zeros(size(Tdata));
for k=1:nscales
    E1 = Edata{k};
    H1 = real(E1) > 0;
    H2 = imag(E1) > 0;
    H3 = abs(E1) < 0.0001;
    for i=0:(length2-1)
        ja = double(2*nscales*(i));
        Tdata(h,ja+(2*k)-1) = H1(h, i+1);
        Tdata(h,ja+(2*k)) = H2(h,i+1);
        Mdata(h,ja+(2*k)-1) = Ndata(h, i+1) | H3(h, i+1);
        Mdata(h,ja+(2*k)) =   Ndata(h, i+1) | H3(h, i+1);
    end
end 