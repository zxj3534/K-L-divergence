function [VN_in_cycles_number,VN_in_cycles_number1, VN_in_cycles_number2,sumv,s] = Indicator(M, N, H_row_one_absolute_index, cn_degree)
% 输入校验矩阵参数 H_row_one_absolute_index, cn_degree
% 输出每个变量节点传播坏信息的能力值s(对应模型中的β)，468圈的数目
VN_in_cycles_number = zeros(1,N) ;
CN_in_cycles_number = zeros(M,1) ; 
[~ , VN_in_cycles_number ,~] = count_4_cycles(H_row_one_absolute_index, cn_degree , VN_in_cycles_number , CN_in_cycles_number);

VN_in_cycles_number1 = zeros(1,N) ;
CN_in_cycles_number1 = zeros(M,1) ; 
[~ , VN_in_cycles_number1 ,~] = count_6_cycles(H_row_one_absolute_index, cn_degree , VN_in_cycles_number1 , CN_in_cycles_number1);

VN_in_cycles_number2 = zeros(1,N) ;
CN_in_cycles_number2 = zeros(M,1) ;
[~ , VN_in_cycles_number2 ,~] = count_8_cycles(H_row_one_absolute_index, cn_degree , VN_in_cycles_number2 , CN_in_cycles_number2);

sumv = VN_in_cycles_number + VN_in_cycles_number1 + VN_in_cycles_number2;

s = zeros(1,N);
for i = 1:N
    s(i) = VN_in_cycles_number(i)*2.4^(-4) + VN_in_cycles_number1(i)*2.4^(-6)+ VN_in_cycles_number2(i)*2.4^(-8);
    %s = VN_in_cycles_number(i)*2.1^(-4) + VN_in_cycles_number1(i)*2.1^(-6);
    %s = VN_in_cycles_number(i)*2.1^(-4);
end
end



