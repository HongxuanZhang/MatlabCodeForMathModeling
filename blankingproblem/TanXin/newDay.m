function [AllMaterial,componentData]=newDay(componentData)
typen = 53;
Material = [3000,zeros(1,53),0];         % ԭ�ϳ��ȣ���������������˷���
AllMaterial = repmat(Material,[100,1]);
for  i = 1:100
    flag = 1;
    while AllMaterial(i,1)>0 && flag
        %         if componentData(3,1) ~= 0
        for j = 1:typen
%             if mod(j,10)==0
%                 
%                 % �������ȼ�
%                 prior_val = calculatePriority(componentData);
%                 componentData(5,:) = prior_val;
%                 temp = sortrows(componentData',5,'descend');
%                 componentData = temp';
%                 % �������ȼ����
%             end
            if AllMaterial(i,1) > componentData(2,j)
                if componentData(3,j) > 0
                    AllMaterial(i,1) = AllMaterial(i,1) - componentData(2,j) - 5; % ���ڶ��׵������ȼ���ߵģ�5 Ϊ�и����
                    componentData(3,j) = componentData(3,j)-1;
                    AllMaterial(i,componentData(1,j)+1) = AllMaterial(i,componentData(1,j)+1)+1;
%                     
%                     % �������ȼ�
%                     prior_val = calculatePriority(componentData);
%                     componentData(5,:) = prior_val;
%                     temp = sortrows(componentData',5,'descend');
%                     componentData = temp';
%                     % �������ȼ����
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
        AllMaterial(i,end) = 0;
    end
end
                    % �������ȼ�
                    prior_val = calculatePriority(componentData);
                    componentData(5,:) = prior_val;
                    temp = sortrows(componentData',5,'descend');
                    componentData = temp';
                    % �������ȼ����
componentData(4,:) = componentData(4,:);