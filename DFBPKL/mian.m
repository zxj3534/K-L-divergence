clear,clc
addpath('load_H_matrix');
addpath('countNode');

H1 = [1 1 0 0 0 1 0 0;
      0 1 1 0 0 0 1 0;
      0 0 1 1 0 0 0 1;
      1 0 0 1 1 0 0 0;
      1 0 1 0 0 0 0 0];

H2 = [1 1 0 0 0 0 1 0 0;
      0 1 1 0 0 0 0 1 0;
      0 0 1 1 0 0 0 0 1;
      1 0 0 1 0 1 0 0 0;
      1 0 0 0 1 0 0 0 0;
      0 0 1 0 1 0 0 0 0]; 

H3 = [1 1 0 0 0 1 0 0 0 0;
      0 1 1 0 0 0 1 0 0 0;
      0 0 1 1 0 0 0 1 0 0;
      1 0 0 1 1 0 0 0 0 0;
      1 0 1 0 0 0 0 0 0 0;
      0 0 0 1 0 0 0 0 1 1];
  
H4 = [1 1 0 0 0 1 1;
      1 1 0 1 1 0 0;
      1 0 1 0 0 0 0;
      0 1 1 0 0 0 0];

H5 = [1 1 1 0 0 0 1;
      1 1 0 0 0 1 0;
      1 1 0 0 0 0 0;
      0 1 0 1 1 0 0];
  
H6 = [1 1 1 0 0 0 0 0 0;
      0 0 1 1 1 1 0 0 0;
      0 0 1 0 0 1 0 0 0;
      0 0 0 0 0 1 1 1 0;
      1 0 0 0 0 0 0 1 1];
  
H7 = [1 1 1 0 0 0 0 0 0 0;
      0 0 1 1 1 0 0 0 0 0;
      0 0 0 0 1 1 1 0 0 0;
      0 0 1 0 0 0 1 0 0 0;
      0 0 0 0 0 0 1 1 1 0;
      1 0 0 0 0 0 0 0 1 1];
 
H8 = [1 1 1 0 0 0;
      1 0 1 1 1 0;
      1 0 0 0 1 1];
  
H9 = [1 1 1 0 0 1 0 0;
      0 0 1 1 1 0 0 0;
      1 0 0 0 1 1 1 0;
      1 0 0 0 0 0 1 1];
  
H10 =[1 1 0 0 0 1 0; 
      0 1 1 1 0 0 0;
      0 0 0 1 1 1 0;
      1 0 0 0 0 1 1]; 
 
H = H1; % 
[M, N, K, vn_degree, cn_degree, P, H_row_one_absolute_index, H_comlumn_one_relative_index, vn_distribution, cn_distribution] = H_matrix_process(H);
[VN_in_cycles_number,VN_in_cycles_number1, VN_in_cycles_number2, p,dam] = damping(M, N, H_row_one_absolute_index, cn_degree);

R = K/N;
max_iter = 20;
max_runs = 1000000;
ebno_vec = 1; %snr

[L1,L2] = simulation(ebno_vec, P, H_row_one_absolute_index, H_comlumn_one_relative_index, N, M, K, vn_degree,cn_degree, max_iter, max_runs,H, dam);%L是一个max_iter行，N列，max_runs页的三维矩阵，L(i,j,k)表示第k次译码，第i次迭代结束时，第j个变量节点的后验llr值。

disp('llr simulation is finished.')

% H1
w1 = L1(20,1,:);
y1 = reshape(w1,1,[]);
w4 = L1(20,4,:);
y4 = reshape(w4,1,[]);
w6 = L1(20,6,:);
y6 = reshape(w6,1,[]);
y12 = L2(:,1)';
y42 = L2(:,4)';
y62 = L2(:,6)';
[P1,Q1,KL1] = Probability_distribution_KL(y1,y12); 
[P4,Q4,KL4] = Probability_distribution_KL(y4,y42);
[P6,Q6,KL6] = Probability_distribution_KL(y6,y62);

% H2
% w1 = L1(20,1,:);
% y1 = reshape(w1,1,[]);
% w2 = L1(20,2,:);
% y2 = reshape(w2,1,[]);
% w6 = L1(20,6,:);
% y6 = reshape(w6,1,[]);
% y12 = L2(:,1)';
% y22 = L2(:,2)';
% y62 = L2(:,6)';
% [P1,Q1,KL1] = Probability_distribution_KL(y1,y12); 
% [P2,Q2,KL2] = Probability_distribution_KL(y2,y22); 
% [P6,Q6,KL6] = Probability_distribution_KL(y6,y62);

% H3
% w1 = L1(20,1,:);
% y1 = reshape(w1,1,[]);
% w4 = L1(20,4,:);
% y4 = reshape(w4,1,[]);
% w8 = L1(20,8,:);
% y8 = reshape(w8,1,[]);
% y12 = L2(:,1)';
% y42 = L2(:,4)';
% y82 = L2(:,8)';
% [P1,Q1,KL1] = Probability_distribution_KL(y1,y12); 
% [P4,Q4,KL4] = Probability_distribution_KL(y4,y42);
% [P8,Q8,KL8] = Probability_distribution_KL(y8,y82);

% H4
% w2 = L1(20,2,:);
% y2 = reshape(w2,1,[]);
% w3 = L1(20,3,:);
% y3 = reshape(w3,1,[]);
% w5 = L1(20,5,:);
% y5 = reshape(w5,1,[]);
% y22 = L2(:,2)';
% y32 = L2(:,3)';
% y52 = L2(:,5)';
% [P2,Q2,KL2] = Probability_distribution_KL(y2,y22); 
% [P3,Q3,KL3] = Probability_distribution_KL(y3,y32);
% [P5,Q5,KL5] = Probability_distribution_KL(y5,y52);

% H5
% w1 = L1(20,1,:);
% y1 = reshape(w1,1,[]);
% w5 = L1(20,5,:);
% y5 = reshape(w5,1,[]);
% y12 = L2(:,1)';
% y52 = L2(:,5)';
% [P1,Q1,KL1] = Probability_distribution_KL(y1,y12); 
% [P5,Q5,KL5] = Probability_distribution_KL(y5,y52);

% H6
% w1 = L1(20,1,:);
% y1 = reshape(w1,1,[]);
% w3 = L1(20,3,:);
% y3 = reshape(w3,1,[]);
% w5 = L1(20,5,:);
% y5 = reshape(w5,1,[]);
% y12 = L2(:,1)';
% y32 = L2(:,3)';
% y52 = L2(:,5)';
% [P1,Q1,KL1] = Probability_distribution_KL(y1,y12); 
% [P3,Q3,KL3] = Probability_distribution_KL(y3,y32);
% [P5,Q5,KL5] = Probability_distribution_KL(y5,y52);

% H7
% w1 = L1(20,1,:);
% y1 = reshape(w1,1,[]);
% w2 = L1(20,2,:);
% y2 = reshape(w2,1,[]);
% w3 = L1(20,3,:);
% y3 = reshape(w3,1,[]);
% w5 = L1(20,5,:);
% y5 = reshape(w5,1,[]);
% y12 = L2(:,1)';
% y22 = L2(:,2)';
% y32 = L2(:,3)';
% y52 = L2(:,5)';
% [P1,Q1,KL1] = Probability_distribution_KL(y1,y12); 
% [P2,Q2,KL2] = Probability_distribution_KL(y2,y22); 
% [P3,Q3,KL3] = Probability_distribution_KL(y3,y32);
% [P5,Q5,KL5] = Probability_distribution_KL(y5,y52);

% H8
% w1 = L1(20,1,:);
% y1 = reshape(w1,1,[]);
% w2 = L1(20,2,:);
% y2 = reshape(w2,1,[]);
% w3 = L1(20,3,:);
% y3 = reshape(w3,1,[]);
% y12 = L2(:,1)';
% y22 = L2(:,2)';
% y32 = L2(:,3)';
% [P1,Q1,KL1] = Probability_distribution_KL(y1,y12); 
% [P2,Q2,KL2] = Probability_distribution_KL(y2,y22); 
% [P3,Q3,KL3] = Probability_distribution_KL(y3,y32);

% H9
% w1 = L1(20,1,:);
% y1 = reshape(w1,1,[]);
% w2 = L1(20,2,:);
% y2 = reshape(w2,1,[]);
% w3 = L1(20,3,:);
% y3 = reshape(w3,1,[]);
% w6 = L1(20,6,:);
% y6 = reshape(w6,1,[]);
% w7 = L1(20,7,:);
% y7 = reshape(w7,1,[]);
% y12 = L2(:,1)';
% y22 = L2(:,2)';
% y32 = L2(:,3)';
% y62 = L2(:,6)';
% y72 = L2(:,7)';
% [P1,Q1,KL1] = Probability_distribution_KL(y1,y12); 
% [P2,Q2,KL2] = Probability_distribution_KL(y2,y22); 
% [P3,Q3,KL3] = Probability_distribution_KL(y3,y32);
% [P6,Q6,KL6] = Probability_distribution_KL(y6,y62);
% [P7,Q7,KL7] = Probability_distribution_KL(y7,y72);

% H10
% w1 = L1(20,1,:);
% y1 = reshape(w1,1,[]);
% w2 = L1(20,2,:);
% y2 = reshape(w2,1,[]);
% w3 = L1(20,3,:);
% y3 = reshape(w3,1,[]);
% w6 = L1(20,6,:);
% y6 = reshape(w6,1,[]);
% y12 = L2(:,1)';
% y22 = L2(:,2)';
% y32 = L2(:,3)';
% y62 = L2(:,6)';
% [P1,Q1,KL1] = Probability_distribution_KL(y1,y12); 
% [P2,Q2,KL2] = Probability_distribution_KL(y2,y22); 
% [P3,Q3,KL3] = Probability_distribution_KL(y3,y32);
% [P6,Q6,KL6] = Probability_distribution_KL(y6,y62);

