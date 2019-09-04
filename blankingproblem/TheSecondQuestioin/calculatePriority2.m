function [priority]=calculatePriority2(componentData)
[~,n] = size(componentData);
priority = zeros(1,n);
priority(1,:) = (componentData(2,:)./200).*componentData(4,:).*componentData(5,:).^5;