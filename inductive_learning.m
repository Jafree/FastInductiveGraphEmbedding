clear all
%Parameters
intermediate_dim = 100;
final_dim = 20;
ratio = 0.5;

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

%randomly select unseen nodes from original graph
selected_nodes = [];
for i = 1:N
selected_nodes = [selected_nodes,rand()<ratio];
end
non_zero_count = nnz(selected_nodes);
non_zero_index = find(selected_nodes);
SG = subgraph(G,non_zero_index);
SA = adjacency(SG);
SD_inv = spdiags(1./degree(SG),0,non_zero_count,non_zero_count);
SNormalized_random_walk = sqrt(SD_inv)*SA*sqrt(SD_inv);

%embedding for seen nodes
S = randn(non_zero_count, intermediate_dim) / sqrt(intermediate_dim);
C = SNormalized_random_walk * S;
[U,Sigma,V] = svds(C,final_dim,'largest');

%fold in for unseen nodes
j = 0;
Y = [];
for i =1:N
    if selected_nodes(i)==1
        j=j+1;
        Y = [Y;U(j,:)];
    else
        v=Normalized_random_walk(i,non_zero_index);
        p= v*S;
        p_=p*V*inv(Sigma);
        Y=[Y;p_];
    end
end

Y = sqrt(D_inv)*Y;
save -ascii ./inductive_karate.txt Y;