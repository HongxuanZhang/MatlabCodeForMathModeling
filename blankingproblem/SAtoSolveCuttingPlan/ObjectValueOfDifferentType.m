function [differentType] = ObjectValueOfDifferentType(gb_mat)
[m_gbmat,~] = size(gb_mat);
o_mat=reshape(gb_mat,[5,m_gbmat*7/5]);
[differentType,~] = size(unique(o_mat','rows'));