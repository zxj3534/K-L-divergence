function [num_4_cycles , VN_in_4cycles_number ,CN_in_4cycles_number] = count_4_cycles(H, cn , VN_in_4cycles_number , CN_in_4cycles_number)
%H��ʾH_row_one_absolute_index,�þ���ΪM*max(cn_degree),��i�е�j�б�ʾH�����е�i�е�j������Ԫ������������
%cn��ʾcn_degree��������ΪM*1,��i�б�ʾ��i��У��ڵ�Ķ�
disp('We are now counting the number of length-4-cycles in the target H.');
M = size(H, 1);
num_4_cycles = 0;
for m1 = 1 : M - 1
    for i1 = 1 : cn(m1)
        index_1 = H(m1, i1);
        for m2 = m1 + 1 : M 
            for i2 = 1 : cn(m2)
                index_2 = H(m2, i2);
                if index_2 == index_1
                    for j1 = i2+1:cn(m2)
                        index_3 = H(m2, j1);
                        if index_3 ~= index_2
                             for j3 = 1:cn(m1)
                                index_4 = H(m1,j3);
                                if index_4 == index_3
                                    num_4_cycles = num_4_cycles + 1;
                                    VN_in_4cycles_number(index_1) =  VN_in_4cycles_number(index_1) + 1;
                                    VN_in_4cycles_number(index_3) = VN_in_4cycles_number(index_3) + 1;
                                    CN_in_4cycles_number(m1) = CN_in_4cycles_number(m1) + 1;
                                    CN_in_4cycles_number(m2) = CN_in_4cycles_number(m2) + 1; 
%                                     [m1 m2 index_1 index_2 index_3 index_4]
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
disp(['The number of 4-cycles in the target H is ' num2str(num_4_cycles) '.'])