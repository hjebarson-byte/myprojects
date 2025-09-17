function [Edata, filtdata] = Kernal_convolve(im, nscale, minflength, mdata,sigmaOnf)
[rows,cols] = size(im);		
filtdata = zeros(1,size(im,2));
Edata = cell(1, nscale);         
ndata = cols;
if mod(ndata,2) == 1             
    ndata = ndata-1;             
end
Conv_Kernal  = zeros(1,ndata);
result = zeros(rows,ndata);
radius =  [0:fix(ndata/2)]/fix(ndata/2)/2;  
radius(1) = 1;
flength = minflength;       
for s = 1:nscale,                   
    fo = 1.0/flength;                  
    rfo = fo/0.5;                        
    Conv_Kernal(1:ndata/2+1) = exp((-(log(radius/fo)).^2) / (2 * log(sigmaOnf)^2));  
    Conv_Kernal(1) = 0;  
    filter = Conv_Kernal;
    filtdata = filtdata+filter;
    for r = 1:rows
        signal = im(r,1:ndata);
        imagefft = fft( signal );
        result(r,:) = ifft(imagefft .* filter);
    end
    Edata{s} = result;
    flength = flength * mdata;      
end                                    
filtdata = fftshift(filtdata);