% 统计各种切割方案的个数
programme = Stripe_50;
[m,n] = size(unique(programme(:,2:44),'rows'));
plannum_50 = zeros(1,m);
[number, ~] = size(programme(:,2:44));
k_old = programme(1,1);
k = 0;
j = 1; %plannum数组的索引
for i = 1:number
    k = programme(i,1);
    if k==k_old
        k_old=k;
        plannum_50(1,j) = plannum_50(1,j)+1;
    else
        k_old=k;
        j = j+1;
        plannum_50(1,j) = plannum_50(1,j)+1;
    end
end