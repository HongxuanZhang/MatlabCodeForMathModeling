clc
M = unique(Material(1:600,:),'rows');
[m,n] = size(M);
a = zeros(m,1);
k = zeros(m,1);
for i =1:m
    a(i) = sum(Stripe_30(1:16+3*47,1) == M(i));
    for j =2:44
        if M(i,j) ~=0
            k(i) = j;
        end
    end
    for j = 2:44
        if M(i,j)~=0 && j ~= k(i)
            fprintf('生产%d号零件%d个，',j-1,M(i,j));
        elseif M(i,j)~=0
            fprintf('生产%d号零件%d个&%d\\\\',j-1,M(i,j),a(i));
        end
    end
     fprintf('\n');
end

for j = [5,7,9,12,15,18,20,25, 28,36,48]
    fprintf('共生产%d号零件%d个\n',j,sum(Material(:,j+1)));
end