# Probability of Ruin

Goal is to replicate some results from a paper via simulations. In particular, 3 Monte Carlo methods are compared.

## Usage
```
Rscript ProbabilityofRuin.R
```

## Results

### Algorithm I
u      actual value (only 2 sig digits)   our generated confidence interval
------ ---------------------------------- -----------------------------------
10     0.55                               $0.563 \pm 0.0031$
50     0.19                               $0.192 \pm 0.0024$
100    0.085                              $0.087 \pm 0.0017$
500    0.011                              $0.011 \pm 0.00065$
1000   0.0054                             $0.0052 \pm 0.00044$
