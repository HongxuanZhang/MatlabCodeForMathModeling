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
            fprintf('����%d�����%d����',j-1,M(i,j));
        elseif M(i,j)~=0
            fprintf('����%d�����%d��&%d\\\\',j-1,M(i,j),a(i));
        end
    end
     fprintf('\n');
end

for j = [5,7,9,12,15,18,20,25, 28,36,48]
    fprintf('������%d�����%d��\n',j,sum(Material(:,j+1)));
end