clear all
%Parameters
intermediate_dim = 100;
final_dim = 20;

%load graph
load datasets/karateTest.txt
karateTest = unique(sort(karateTest,2),'rows');
G = graph(karateTest(:,1),karateTest(:,2),'OmitSelfLoops');

%Variables used in the embedding
N = numnodes(G);
I = speye(N);
D = spdiags(degree(G),0,N,N);
A = adjacency(G);
D_inv = spdiags(1./degree(G),0,N,N);
Normalized_random_walk = sqrt(D_inv)*A*sqrt(D_inv);

%Fast_embedding
S = randn(N, intermediate_dim) / sqrt(intermediate_dim);
C = Normalized_random_walk * S;
[U,S,V] = svds(C,final_dim,'largest');
U = sqrt(D_inv)*U;

%Plot
gc = [1 1 1 1 1 1 1 1 2 2 1 1 1 1 2 2 1 1 2 1 2 1 2 2 2 2 2 2 2 2 2 2 2 2];
color = [];
for i = 1:34
    if gc(i) == 1
        color =[color; [1 0 0]];
    else 
        color = [color;[0 0 1]];
    end
end

%idx1 = kmeans(U(:,1:200),2);
%figure;bar(getcolumn(U(1:N,2:4),1));


figure;scatter(getcolumn(U(1:N,2:3),1),getcolumn(U(1:N,2:3),2),140,color,'filled');
figure;scatter3(getcolumn(U(1:N,2:4),1),getcolumn(U(1:N,2:4),2),getcolumn(U(1:N,2:4),3),60,color,'filled');
