close ('ALL');
clear;
clc;
load('glass.mat');

[t_row,t_col]=size(X);
inp = X(:,(2:(t_col-1)));
oup = X(:,t_col);

%inp=X;
k=6; %No. of clusters
iter = 100;
tol = 1e-3;
[calc_val, centre]= fcm(k,inp,iter,tol);
FC_inc_dist = inc(inp,centre,calc_val)
[pred_hyb,centre1]= HPSOFCM(k,inp,iter);
Hps_inc_dist = inc(inp,centre1,pred_hyb)
[k_centre,k_pred]=k_means(k,inp,iter);
KM_inc_dist = inc(inp,k_centre,k_pred);
centre
centre1
k_centre
pred_hyb;
calc_val;
k_pred;
oup';
FC_f_m=f_measure(oup,k,calc_val')
Hyb_f_m=f_measure(oup,k,pred_hyb')
KM_f_m=f_measure(oup,k,k_pred')
%{
scatter(X(:,1),X(:,2));
hold on;
plot(k_centre(:,1),k_centre(:,2),'rx','MarkerSize',10);
scatter(X(:,1),X(:,2));
hold on;
plot(centre1(:,1),centre1(:,2),'rx','MarkerSize',10);
%}