function [num_8_cycles , VN_in_cycles_number ,CN_in_cycles_number] = count_8_cycles(H, cn , VN_in_cycles_number , CN_in_cycles_number)
num_8_cycles_vec = zeros(3, 1);
disp(' ');
disp('We are now counting the number of length-8-cycles in the target H.');
disp('Let us conut in parallel...This may take few seconds...')
VN_in_cycles_number_tmp = zeros(3,size(VN_in_cycles_number,2));
CN_in_cycles_number_tmp = zeros(size(CN_in_cycles_number,1) , 3);
for i_par = 1 : 12
    switch i_par
        case 1
            [num_8_cycles_vec(i_par) , VN_in_cycles_number_tmp(i_par,:) , CN_in_cycles_number_tmp(:,i_par)] = count_8_cycles_I(H, cn , VN_in_cycles_number_tmp(i_par,:) , CN_in_cycles_number_tmp(:,i_par));
        case 2
            [num_8_cycles_vec(i_par) , VN_in_cycles_number_tmp(i_par,:) , CN_in_cycles_number_tmp(:,i_par)] = count_8_cycles_II(H, cn , VN_in_cycles_number_tmp(i_par,:) , CN_in_cycles_number_tmp(:,i_par));
        case 3
            [num_8_cycles_vec(i_par) , VN_in_cycles_number_tmp(i_par,:) , CN_in_cycles_number_tmp(:,i_par)] = count_8_cycles_III(H, cn , VN_in_cycles_number_tmp(i_par,:) , CN_in_cycles_number_tmp(:,i_par));
    end
end
num_8_cycles = sum(num_8_cycles_vec);
VN_in_cycles_number = VN_in_cycles_number + VN_in_cycles_number_tmp(1,:)+VN_in_cycles_number_tmp(2,:)+VN_in_cycles_number_tmp(3,:);
CN_in_cycles_number = CN_in_cycles_number + CN_in_cycles_number_tmp(:,1) + CN_in_cycles_number_tmp(:,2)+CN_in_cycles_number_tmp(:,3);
disp(' ');
disp(['The number of 8-cycles in the target H is ' num2str(num_8_cycles) '.'])
