function [LLR] = MAP_decoder(llr,H,N)
C = [];
for i = 0:2^N-1
    a = dec2bin(i,N);
    b = double(a)-'0';
    d = sum(mod(H*b',2));
    if d == 0
        C = [C;b];
    end
end
m = size(C,1);

LLR = zeros(1,N);
for t = 1:N
    L0 = 0; 
    L1 = 0; 
    for j = 1:m
        if C(j,t) == 0
            c0 = C(j,:);
            L01 = 0;
            for k = 1:N
                if c0(1,k) == 0
                    L01 = L01 + llr(k);
                end
            end
            L0 = L0 + exp(L01);
        else
            c1 = C(j,:); 
            L11 = 0;
            for s = 1:N
                if c1(1,s) == 0
                    L11 = L11 + llr(s);
                end
            end
            L1 = L1 + exp(L11);
        end
    end
    LLR(1,t) = log(L0/L1);
end