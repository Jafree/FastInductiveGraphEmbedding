clear all
%Parameters
intermediate_dim = 100;
final_dim = 20;

%load graph
load datasets/karateTest.txt
karateTest = unique(sort(karateTest,2),'rows');
G = graph(karateTest(:,1),karateTest(:,2),'OmitSelfLoops');

%variables used in the embedding
N = numnodes(G);
I = speye(N);
D = spdiags(degree(G),0,N,N);
A = adjacency(G);
D_inv = spdiags(1./degree(G),0,N,N);
Normalized_random_walk = sqrt(D_inv)*A*sqrt(D_inv);

%fast embedding
tic
S = randn(N, intermediate_dim) / sqrt(intermediate_dim);
C = Normalized_random_walk * S;
[U,S,V] = svds(C,final_dim,'largest');
U = sqrt(D_inv)*U;
toc

save -ascii ./karate_figrl.txt U;

