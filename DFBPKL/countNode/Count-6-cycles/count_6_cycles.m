function [num_6_cycles , VN_in_cycles_number ,CN_in_cycles_number] = count_6_cycles(H, cn, VN_in_cycles_number , CN_in_cycles_number)
%H表示H_row_one_absolute_index,该矩阵为M*max(cn_degree),第i行第j列表示H矩阵中第i行第j个非零元素所在列索引
%cn表示cn_degree，该向量为M*1,第i行表示第i个校验节点的度
disp('We are now counting the number of length-6-cycles in the target H.');
M = size(H, 1);
num_6_cycles = 0;
for m1 = 1 : M - 2
    for i1 = 1 : cn(m1)
        index_1 = H(m1, i1);
        for m2 = m1 + 1 : M - 1
            for i2 = 1 : cn(m2)
                index_2 = H(m2, i2);
                if index_2 == index_1
                    for j1 = 1 : cn(m2)
                        index_3 = H(m2, j1);
                        if index_3 ~= index_2
                            for m3 = m2 + 1 : M
                                for i3 = 1 : cn(m3)
                                    index_4 = H(m3, i3);
                                    if index_4 == index_3
                                        for j2 = 1 : cn(m3)
                                            index_5 = H(m3, j2);
                                            if index_5 ~= index_2 && index_5 ~= index_4
                                                for j3 = 1 : cn(m1)
                                                    index_6 = H(m1, j3);
                                                    if index_6 == index_5
                                                        num_6_cycles = num_6_cycles + 1;
                                                        VN_in_cycles_number(index_1) =  VN_in_cycles_number(index_1) + 1;
                                                        VN_in_cycles_number(index_3) = VN_in_cycles_number(index_3) + 1;
                                                        VN_in_cycles_number(index_5) = VN_in_cycles_number(index_5) + 1;
                                                        CN_in_cycles_number(m1) = CN_in_cycles_number(m1) + 1;
                                                        CN_in_cycles_number(m2) = CN_in_cycles_number(m2) + 1; 
                                                        CN_in_cycles_number(m3) = CN_in_cycles_number(m3) + 1; 
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
disp(' ');
disp(['The number of 6-cycles in the target H is ' num2str(num_6_cycles) '.'])

