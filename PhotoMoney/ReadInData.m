% 读入已经完成的任务的数据
CompletedTaskData = xlsread('.\Data\Assign.xls');
% 四列 维度 经度 标价 执行

% 读入会员信息
MemberData = xlsread('.\Data\Member.xlsx');
MemberData(:,6) = fix(MemberData(:,3).*24);
MemberData(:,7) = (MemberData(:,3).*24-fix(MemberData(:,3).*24)).*60;
MemberData(:,3) = [];
MemberData(MemberData(:,1)>25,:) = [];
% 维度 经度 信誉值 预定任务限额 时间部分的小时 时间部分的分钟

% 读入新任务的信息
NewAssignment = xlsread('.\Data\NewAssignment.xls');
% 维度 经度
