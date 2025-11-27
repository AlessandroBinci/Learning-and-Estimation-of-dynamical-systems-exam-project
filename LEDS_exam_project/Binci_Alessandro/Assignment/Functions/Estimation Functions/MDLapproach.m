function [ MDL ] = MDLapproach(y, J, p)

% function used to compute the MDL criterion

N=length(y)-p;
MDL=N*log(J)+p*log(N);  % MDL formula

end
