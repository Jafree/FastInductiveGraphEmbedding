function [U,S,V] = fast_embedding(A,k,mid_d)
%{
This function is used for fast embedding for matrix A using random
projection.

Input: 
    A is the normalized matrix of the graph that whose nodes need to be embedded.
    k is the final dimension.
    mid_d is the intermediate dimension for the randomized matrix.
Output:
    U: left eigenvectors
    S: eigenvalues
    V: right eigenvectors
%}
n = size(A, 2);
S = randn(n, mid_d) / sqrt(mid_d);
C = A * S;
clear A;
[U,S,V] = svds(C,k,'largest');

end