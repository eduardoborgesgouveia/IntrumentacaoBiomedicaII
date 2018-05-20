function [filtSig] = LowPassFilt(xdt,n,fc,fs)
   
    Wn = fc/(fs/2);
    ftype = 'low';

    [B,A] = butter(n,Wn,ftype);

    XdtFiltered = filtfilt(B,A,xdt);
    filtSig = XdtFiltered;
end