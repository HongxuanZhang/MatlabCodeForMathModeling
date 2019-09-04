function [priority]=calculatePriority(componentData)
[~,n] = size(componentData);
priority = zeros(1,n);
priority(1,:) = ((componentData(2,:)./200).^(4)).*componentData(3,:).*componentData(4,:).^5;
