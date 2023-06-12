function [P,Q,KL] = Probability_distribution_KL(y1,y2)
N = length(y1); 
M = 100000;
a1 = ceil(max(y1)); 
a2 = ceil(max(y2)); 
a = max(a1,a2);
b1 = floor(min(y1)); 
b2 = floor(min(y2)); 
b = min(b1,b2);
c = (a - b)/M; 
number1 = zeros(1,M); 
number2 = zeros(1,M); 
for i = 1:N
    llr1 = ceil((y1(i)-b)/c); 
    number1(llr1) = number1(llr1) + 1;
end
P = number1/N; 

for j = 1:N
    llr2 = ceil((y2(j)-b)/c); 
    number2(llr2) = number2(llr2) + 1;
end
Q = number2/N; 


t = [];
for s = 1:M
    if (P(s) == 0 && Q(s) == 0)
        t = [t s];
    end
end
P(t) = [];
Q(t) = [];

Q = Q + eps; 

KL = 0;
for k = 1:length(P)
    if P(k) == 0
        dpq = 0; 
    else
        dpq = P(k)*log(P(k)/Q(k));
    end
    KL = KL + dpq;
end




        
    
    