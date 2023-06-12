function [num_8_cycles , VN_in_cycles_number , CN_in_cycles_number] = count_8_cycles_III(H, cn , VN_in_cycles_number , CN_in_cycles_number)
num_8_cycles = 0;
M = size(H, 1);
for m1 = 1 : M - 3
    for i1 = 1 : cn(m1)
        index_1 = H(m1, i1);
        for m2 = m1 + 3 : M
            for i2 = 1 : cn(m2)
                index_2 = H(m2, i2);
                if index_2 == index_1
                    for j1 = 1 : cn(m2)
                        index_3 = H(m2, j1);
                        if index_3 == index_2
                            continue;
                        else
                            for m3 = m1 + 1 : m2 - 2
                                for i3 = 1 : cn(m3)
                                    index_4 = H(m3, i3);
                                    if index_4 == index_3
                                        for j2 = 1 : cn(m3)
                                            index_5 = H(m3, j2);
                                            if index_5 == index_4 || index_5 == index_1
                                                continue
                                            else
                                                for m4 = m3 + 1 : m2 - 1
                                                    for i4 = 1 : cn(m4)
                                                        index_6 = H(m4, i4);
                                                        if index_6 == index_5
                                                            for j3 = 1 : cn(m4)
                                                                index_7 = H(m4, j3);
                                                                if index_7 == index_6 || index_7 == index_4 || index_7 == index_1
                                                                    continue
                                                                else
                                                                    for j4 = 1 : cn(m1)
                                                                        index_8 = H(m1, j4);
                                                                        if index_8 == index_1
                                                                            continue
                                                                        else
                                                                            if index_8 == index_7
                                                                                num_8_cycles = num_8_cycles + 1;
                                                                                VN_in_cycles_number(index_1) =  VN_in_cycles_number(index_1) + 1;
                                                                                VN_in_cycles_number(index_3) = VN_in_cycles_number(index_3) + 1;
                                                                                VN_in_cycles_number(index_5) = VN_in_cycles_number(index_5) + 1;
                                                                                VN_in_cycles_number(index_7) = VN_in_cycles_number(index_7) + 1;
                                                                                CN_in_cycles_number(m1) = CN_in_cycles_number(m1) + 1;
                                                                                CN_in_cycles_number(m2) = CN_in_cycles_number(m2) + 1; 
                                                                                CN_in_cycles_number(m3) = CN_in_cycles_number(m3) + 1;
                                                                                CN_in_cycles_number(m4) = CN_in_cycles_number(m4) + 1;
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
                    end
                end
            end
        end
    end
end