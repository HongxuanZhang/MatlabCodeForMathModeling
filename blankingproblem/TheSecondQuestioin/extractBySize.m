function [mat_20,mat_30,mat_35,mat_50] = extractBySize(gb_mat)
% mat_20 的数据结构是 【i1，j1;i2,j2】存储20mm零件在gb_mat中的位置 i为行数，j为列数
[m, n] = size(gb_mat);
mat_35 = [];
mat_20 = [];
mat_30 = [];
mat_50 = [];
for i = 1:m
    for j = 1:n
        if gb_mat(i,j)>=5000
            mat_50 = [mat_50;i,j];
        elseif gb_mat(i,j)>=3500 && gb_mat(i,j)<5000
            mat_35 = [mat_35;i,j];
        elseif gb_mat(i,j)>=3000 && gb_mat(i,j)<3500
            mat_30 = [mat_30;i,j];
        elseif gb_mat(i,j)>=2000 && gb_mat(i,j)<3000
            mat_20 = [mat_20;i,j];
        else
            1;
        end
    end
end