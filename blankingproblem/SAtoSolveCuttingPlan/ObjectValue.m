function [objvalue] = ObjectValue(cutn,componentData)
value = sum(cutn.*componentData(2,:))+ sum(cutn).*5;
if value>3000 && value ~= 3005
    objvalue = 10000;
elseif value == 3005  %ǡ�����һ���в��� 
    objvalue = 0;
else
    objvalue = 3000 - value;
end