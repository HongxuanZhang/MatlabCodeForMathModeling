ans1 = HuData;
[m1,~] = size(ans1);
randomA1 = [];
for i = 1:2000
    i1 = randi(m1);
    randomA1 = [randomA1;ans1(i1,:)];
end
randomAns = randomA1
