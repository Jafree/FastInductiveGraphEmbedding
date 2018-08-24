## FI-GRL: Fast Inductive Graph Representation Learning
Author: Fei Jiang (fei.jiang1989@gmail.com)
### Overview
This algorithm is used for accurately graph embedding with theoretical guarantees.

A graph approximation technique is utilized to speedup without losing much accuracy.


### Requirements
Our algorithm is implemented in Matlab. The matlab version of 2016_a is verified, which contains a graph package that is used in our code. If you want to test graph embedding results on clustering task, Python 2.7 is required.

### Code Architecture
nonbacktracking-matlab: this folder contains the implementation of our NOBE and NOBE-GA algorithm.

  main.m: you should do graph embedding in this file and run it in matlab.
  
clustering: this folder contains the implementation used for clustering task including two metrics, modularity and permanence.

### Dataset
The format of the input undirected unweighted graph should be an edge list and nodes' index should be continuous. Each line should contain an edge. Only specification of the edge in one direction is sufficient. For example,
```
1	2
1	3
1	4
1	5
1	6
1	7
8	9
8	10
8	11
8	12
```
### Run the code
In main file "maim.m", to get #d dimension embedding for each node in graph G,use the following function should be executed: 

graph_embedding(G, 'nb'or'ua', #d, 'normalized'or'unnormalized').

Parameters:

G is our graph.

'nb' means NOBE, 'ua' means approximation version.

#d is the number of dimension that you want to embed the graph into.

choose 'normalized' to use the normalized version of embedding which shows better performance that unnormalized for graph embedding

For example, we can write the following code in the "main.m" and run it.
```
#Load the dataset into graph structure
load ../datasets/karateTest.txt    
karateTest = unique(sort(karateTest,2),'rows');
G = graph(karateTest(:,1),karateTest(:,2),'OmitSelfLoops');

#Graph embedding and get all embeddings for nodes as a N by 30 matrix U
[U,V] =graph_embedding(G,'nb',30,'normalized');
save -ascii ../datasets/embedding_results/karate_sparse_nb.txt U
```

## Citation
If you make use of the NOBE algorithm in your work, please cite the following paper:
```
@inproceedings{jiang2018nobe,
  title={On Spectral Graph Embedding: A Non-Backtracking Perspective and Graph Approximation},
  author={Fei Jiang and Lifang He and Yi Zheng and Enqiang Zhu and Jin Xu and Philip S. Yu},
  booktitle={Proceedings of the 2018 SIAM International Conference on Data Mining},
  pages={324--332},
  year={2018},
  organization={SIAM}
}
```
