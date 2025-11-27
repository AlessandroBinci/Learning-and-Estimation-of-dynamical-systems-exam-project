function H = hankelMatrix(y,p)

% function used to build the Hankel matrix. y is the signal to compute the Hankel matrix and p is the model complexity

  N = length(y)-p;                             
  H = zeros(N,p);

    for i=1:N
        for j=1:p
            H(i,j)=y(i-j+p);   %cicle used to fullfill the matrix                       
        end
    end
end

