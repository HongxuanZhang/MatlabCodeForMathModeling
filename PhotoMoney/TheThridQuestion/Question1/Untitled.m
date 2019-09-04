CompletedTaskData = xlsread('..\Data\Assign.xls');
[m,n] = size(X);
K = zeros(m,n);
for i = 1:m
    for j = 1:n
        K(i,j) = findTopTenClosestPoint(CompletedTaskData,X(1,j),Y(i,1));
    end
end
%%
MemberData = xlsread('..\Data\Member.xlsx');
MemberData(:,6) = fix(MemberData(:,3).*24);
MemberData(:,7) = (MemberData(:,3).*24-fix(MemberData(:,3).*24)).*60;
MemberData(:,3) = [];

[m,n] = size(X);
K = zeros(m,n);
Cre = zeros(m,n);
for i = 1:m
    for j = 1:n
        [K(i,j),Cre(i,j)]= findTopHundredClosestMember(MemberData,X(1,j),Y(i,1));
    end
end
%%
[num,~] = size(CompletedTaskData);
M = [];  % Member_density
C = [];  % Cre
A = [];  % Assign_density
M1 = [];  % Member_density
C1 = [];  % Cre
A1 = [];  % Assign_density
P = [];  % ¼Û¸ñ
P1= [];
TrainData = [];
for i = 1:num
    [Member_density,Cre]= findTopHundredClosestMember(MemberData,CompletedTaskData(i,1),CompletedTaskData(i,2));
    Assign_density = findTopHundredClosestPoint(CompletedTaskData,CompletedTaskData(i,1),CompletedTaskData(i,2));
    if CompletedTaskData(i,4) == 1
        M = [M,Member_density];
        C = [C,Cre];
        A = [A,Assign_density];
        P = [P,CompletedTaskData(i,3)];
    else
        M1 = [M1,Member_density];
        C1 = [C1,Cre];
        A1 = [A1,Assign_density];
        P1 = [P1,CompletedTaskData(i,3)];
    end
    TrainData = [TrainData;CompletedTaskData(i,1),CompletedTaskData(i,2),Member_density,Cre,Assign_density,CompletedTaskData(i,3:4)] ;
end
subplot(3,1,1);
scatter(P,M,'.');
hold on 
scatter(P1,M1,'r.');
hold off;
subplot(3,1,2);
scatter(P,C,'.');
hold on 
scatter(P1,C1,'r.');
hold off;
subplot(3,1,3);
scatter(P,A,'.');
hold on 
scatter(P1,A1,'r.');
hold off;
%%
NN = TrainData(randperm(size(TrainData,1)), :);
Train = NN(1:626,3:7);
Train_Ans = NN(1:626,7);
Test = NN(626:end,3:7);
Test_ans = NN(626:end,7);
