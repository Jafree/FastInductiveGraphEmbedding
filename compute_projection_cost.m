clear all
%parameters
final_d = 20

%load graph
load datasets/karateTest.txt
karateTest = unique(sort(karateTest,2),'rows');
G = graph(karateTest(:,1),karateTest(:,2),'OmitSelfLoops');

%compute some variables for embedding
N = numnodes(G);
I = speye(N);
D = spdiags(degree(G),0,N,N);
A = adjacency(G);
D_inv = spdiags(1./degree(G),0,N,N);
Normalized_random_walk = sqrt(D_inv)*A*sqrt(D_inv);

%get the residual, namely,L\k
[U,S,V] = svds(Normalized_random_walk,final_d+1,'largest');
singular_21 = S(final_d+1,final_d+1);
errors =[];
variances = [];
%for different intermediate dimensions, compute errors and variances of
%projection cost
for intermediate_d = [10,20,50,100,200,500,1000]
epsilon = [];
for i=1:2
S = randn(N, intermediate_d) / sqrt(intermediate_d);
C = Normalized_random_walk * S;
[U,S,V] = svds(C,final_d,'largest');
epsilon = [epsilon,(norm(Normalized_random_walk - U*U.'*Normalized_random_walk)-singular_21)/singular_21];
end
errors = [errors,mean(epsilon)];
variances = [variances,var(epsilon)];
end
errors
variances
