function [resid] = residuals(y,theta,p)

%function to compute the residual

H = -hankelMatrix(y,p);           %using the function to compute the Hankel Matrix (with negative sign)
resid = y((p+1):end)-H*theta;     %formula of the the residuals

end