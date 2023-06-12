function [VN_in_cycles_number,VN_in_cycles_number1, VN_in_cycles_number2, p,s1] = damping(M, N, H_row_one_absolute_index, cn_degree)
% 输入校验矩阵(置换后的）参数 H_row_one_absolute_index, cn_degree
% 输出需要加阻尼的位置，对应的阻尼系数
VN_in_cycles_number = zeros(1,N) ;
CN_in_cycles_number = zeros(M,1) ; 
%[num_8_cycles , VN_in_cycles_number ,CN_in_cycles_number] = count_8_cycles(H_row_one_absolute_index, cn_degree , VN_in_cycles_number , CN_in_cycles_number);
[~ , VN_in_cycles_number ,~] = count_4_cycles(H_row_one_absolute_index, cn_degree , VN_in_cycles_number , CN_in_cycles_number);

VN_in_cycles_number1 = zeros(1,N) ;
CN_in_cycles_number1 = zeros(M,1) ; 
[~ , VN_in_cycles_number1 ,~] = count_6_cycles(H_row_one_absolute_index, cn_degree , VN_in_cycles_number1 , CN_in_cycles_number1);
% 
VN_in_cycles_number2 = zeros(1,N) ;
CN_in_cycles_number2 = zeros(M,1) ;
[~ , VN_in_cycles_number2 ,~] = count_8_cycles(H_row_one_absolute_index, cn_degree , VN_in_cycles_number2 , CN_in_cycles_number2);

%sumv = VN_in_cycles_number + VN_in_cycles_number1;
%sumc = CN_in_cycles_number + CN_in_cycles_number1;

%求阻尼系数s1
value = [];
p = [];%需要加阻尼的位置
for i = 1:N
    s = VN_in_cycles_number(i)*1.12^(-4) + VN_in_cycles_number1(i)*1.12^(-6)+ VN_in_cycles_number2(i)*1.12^(-8);
    %s = VN_in_cycles_number(i)*2.1^(-4) + VN_in_cycles_number1(i)*2.1^(-6);
    %s = VN_in_cycles_number(i)*2.1^(-4);
    if s>1
        p = [p i];
        value = [value s];
    else
        p = [p i];
        value = [value 1];
    end
end
s1 = ones(size(value))./value;
end

