% 该文件用于计算距离三个聚类中心的距离以及其最近的一个的弧长度
Kmeans_center = [23.1135,113.2603;22.9163,113.8287;22.6449,114.0765;];
aDsoai = xlsread('C:\Users\Lenovo\Desktop\对应附件一的.xlsx');
[m,~] = size(aDsoai);
aDsoai = [aDsoai,distance(aDsoai(:,1),aDsoai(:,2),Kmeans_center(1,1),Kmeans_center(1,2))];
aDsoai = [aDsoai,distance(aDsoai(:,1),aDsoai(:,2),Kmeans_center(2,1),Kmeans_center(2,2))];
aDsoai = [aDsoai,distance(aDsoai(:,1),aDsoai(:,2),Kmeans_center(3,1),Kmeans_center(3,2))];
aDsoai = [aDsoai,zeros(m,1)];
for i = 1:m
    aDsoai(i,11) = min(aDsoai(i,8:10));
end