# Hybrid-Fuzzy-c-means
Run start.m

For glass dataset:
inp = X(:,(2:(t_col-1)));
oup = X(:,t_col);
k=6;

For iris dataset:
inp = X(:,(1:(t_col-1)));
oup = X(:,t_col);
k=3;

For wine dataset:
inp = X(:,(2:(t_col)));
oup = X(:,1);
k=3;
