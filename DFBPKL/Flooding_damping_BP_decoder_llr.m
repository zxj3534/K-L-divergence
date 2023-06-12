function [llr1] = Flooding_damping_BP_decoder_llr(llr, H_row_one_absolute_index, H_comlumn_one_relative_index, N, M, vn_degree, cn_degree, max_iter, dam)
llr1 = zeros(max_iter,N);
VN_array = zeros(max(vn_degree), N);
CN_tanh_tmp = zeros(max(cn_degree), 1);%CN temporary memory.
for t = 1 : max_iter
    sum_VN = sum(VN_array);             %VN update
    for v = 1:N
        for v_neighbor = 1 : vn_degree(v)
            VN_array(v_neighbor, v) =  dam(v)*sum_VN(v) - dam(v)*VN_array(v_neighbor, v) + llr(v);%Belief Propagation Rule. The initial 2/sigma^2*y is automatically incorporateed here.
        end
    end
    for c = 1 : M                        %CN update
        product = 1;
        for c_neighbor = 1 : cn_degree(c)%read data from VNs, and then store in CNs memory.
            CN_tanh_tmp(c_neighbor) = 1 - 2/(1 + exp(VN_array(H_comlumn_one_relative_index(c, c_neighbor), H_row_one_absolute_index(c, c_neighbor))));%Exact decoding.
            product = product * CN_tanh_tmp(c_neighbor);
        end
        for c_neighbor = 1 : cn_degree(c)
            x = product/CN_tanh_tmp(c_neighbor);
            x = sign(x) * min(abs(x), 1 - 1e-15);%Numerical Stability.
            VN_array(H_comlumn_one_relative_index(c, c_neighbor), H_row_one_absolute_index(c, c_neighbor)) = log((1 + x)/(1 - x));%Exact decoding.
        end
    end
    llr2 = sum(VN_array)'+ llr;
    llr1(t,:) = llr2';  
end

