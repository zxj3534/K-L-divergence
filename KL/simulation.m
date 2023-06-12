function [L1,L2] = simulation(ebno_vec, P, H_row_one_absolute_index, H_comlumn_one_relative_index, N, M, K, vn_degree,cn_degree, max_iter, max_runs,H)
% R = K/N;
L1 = zeros(max_iter,N,max_runs);
L2 = zeros(max_runs,N);
% profile viewer
for i_run = 1 : max_runs
%     u = round(rand(K, 1));
%     parity_check_bits = mod(P * u, 2);
%     x = [u; parity_check_bits];
    x = zeros(N,1);
    symbol = 1 - 2*x;
    rng(i_run);
    n = randn(N, 1);
    sigma = 10^(-ebno_vec/20);%snr
    y = symbol + sigma * n;
    llr = 2/sigma^2*y;
    [llr1] = Flooding_BP_llr(llr, H_row_one_absolute_index, H_comlumn_one_relative_index, N, M, vn_degree, cn_degree, max_iter);
    L1(:,:,i_run) = llr1;
    [llr2] = MAP_decoder(llr',H,N); 
    L2(i_run,:) = llr2;
end
% profile viewer
%toc