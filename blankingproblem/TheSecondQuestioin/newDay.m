function [AllMaterial,componentData]=newDay(componentData)
[m,n] = size(componentData);
typen = n;
stripe_n = 2000;
Material = [3000,zeros(1,43),0];         % 原料长度，各零件生产量，浪费量
AllMaterial = repmat(Material,[stripe_n,1]);
for  i = 1:stripe_n
    flag = 1;
    while AllMaterial(i,1)>0 && flag
        %         if componentData(3,1) ~= 0
        for j = 1:typen
            if AllMaterial(i,1) > componentData(2,j)
                if componentData(4,j) > 0
                    AllMaterial(i,1) = AllMaterial(i,1) - componentData(2,j); % 排在队首的是优先级最高
                    componentData(4,j) = componentData(4,j)-1;
                    AllMaterial(i,componentData(1,j)+1) = AllMaterial(i,componentData(1,j)+1)+1;
                    
%                     % 更新优先级
%                     prior_val = calculatePriority(componentData);
%                     componentData(5,:) = prior_val;
%                     temp = sortrows(componentData',5,'descend');
%                     componentData = temp';
%                     % 更新优先级完成
                    break;
                elseif j~= typen
                    continue;
                else 
                    flag = 0;
                    break;
                end
            elseif j ~= typen
                continue;
            else
                flag = 0;
            end
        end
        %         else
        %             break;
        %         end
    end
    AllMaterial(i,end) = AllMaterial(i,1);
    if AllMaterial(i,end)<0
        AllMaterial(i,end) = 0;         % 既然不考虑损耗，那么此处不会小于0
    end
end

% 更新优先级
prior_val = calculatePriority2(componentData);
componentData(6,:) = prior_val;
temp = sortrows(componentData',6,'descend');
componentData = temp';
% 更新优先级完成

% 更新优先数？？？
componentData(4,:) = componentData(4,:);