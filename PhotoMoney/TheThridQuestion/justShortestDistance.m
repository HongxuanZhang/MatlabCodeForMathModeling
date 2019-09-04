function [dist]=justShortestDistance(Lat,Long)
Kmeans_center = [23.1135,113.2603;22.9163,113.8287;22.6449,114.0765;];
dis = distance(Kmeans_center(:,1),Kmeans_center(:,2),Lat,Long);
dist = 10;
if dis(1) == min(dis)
    dist = dis(1);
elseif dis(2) == min(dis)
    dist = dis(2);
elseif dis(3) == min(dis)
    dist = dis(3);
end