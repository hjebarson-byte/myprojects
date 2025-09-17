function fmap = ffncnn(Fdata, Sdata, Mdata, Kdata)
scales=1;
Fdata = logical(Fdata);
Sdata = logical(Sdata);
Mdata = logical(Mdata);
Kdata = logical(Kdata);
fmap = NaN;
for shifts=-8:8
    Fdatas = shiftbits(Fdata, shifts,scales);
    Sdatas = shiftbits(Sdata, shifts,scales);
    mask = Sdatas | Kdata;
    nummaskbits = sum(sum(mask == 1));
    totalbits = (size(Fdatas,1)*size(Fdatas,2)) - nummaskbits;
    C = xor(Fdatas,Mdata);
    C = C & ~mask;
    bitsdiff = sum(sum(C==1));
    if totalbits == 0
        fmap = NaN;
    else
        fmap1 = bitsdiff / totalbits;
        if  fmap1 < fmap || isnan(fmap)
            fmap = fmap1;
        end
    end
end