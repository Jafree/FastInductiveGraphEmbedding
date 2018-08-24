## FI-GRL: Fast Inductive Graph Representation Learning via Projection-cost Preservation
Author: Fei Jiang (fei.jiang1989@gmail.com)
### Overview
This is a graph embedding algorithm using random projection for fast and accurate embedding with theoretical guarantees.

### Requirements
This algorithm is implemented in Matlab. The matlab version of 2016_a is verified, which contains a graph package used in our code. 

### Code Architecture
fast_embedding.m: This is a function for graph embedding.

demo_plot_karate.m: a demo for generating embedding and plotting nodes in 3-D and 2-D dimensions on Katate dataset.

compute_projection_cost.m: shows how to compute the projection cost in the experimental part of our paper.

inductive_learning.m: shows how to generalize to unseen nodes.

example_fast_embedding.m: an example showing how to do graph embedding on Karate dataset.
  

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

## Citation
If you make use of this algorithm in your work, please cite the following paper:
```
@inproceedings{jiang2018figrl,
  title={FI-GRL: Fast Inductive Graph Representation Learning via Projection-Cost Preservation},
  author={Fei Jiang and Lei Zheng and Jin Xu and Philip S. Yu},
  booktitle={International Conference on Data Mining},
  year={2018},
  organization={ICDM}
}
```
