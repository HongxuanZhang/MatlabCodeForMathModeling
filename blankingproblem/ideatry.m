%%
i = [5,7,9,12,15,18,20,25,28,36,48];
sum(b(2,i).*(b(3,i)))/3000
%%
[m,n] = size(finalpattern);
for i = 1:m
    fprintf('��%d�ַ���Ϊ��',i);
    for j = 1:n-1
        if finalpattern(i,j) ~= 0
            fprintf('����%d�����%d��,',j,finalpattern(i,j));
        end
    end
    fprintf('ԭ��ʣ����Ϊ%dmm\n',finalpattern(i,54));
end

%%
[m,n] = size(bestPro);
value = zeros(m,1);
for i = 1:m
    value(i,1) = 3000-sum(bestPro(i,:).*componentData(2,:))-sum(bestPro(i,:)).*5;
end
value
%%
sum(bestPro(1,:).*componentData(2,:))


%%
de = zeros(60,1);
for i = 1:60
    de(i,1)=sum(cutp(i,:).*componentData(2,:))+sum(cutp(i,:))*5;
end
k = zeros(60,1);
k = 3000-de;
k(k==-5) = 0;

%%
save('cutp','cutp')



