% �����Ѿ���ɵ����������
CompletedTaskData = xlsread('.\Data\Assign.xls');
% ���� ά�� ���� ��� ִ��

% �����Ա��Ϣ
MemberData = xlsread('.\Data\Member.xlsx');
MemberData(:,6) = fix(MemberData(:,3).*24);
MemberData(:,7) = (MemberData(:,3).*24-fix(MemberData(:,3).*24)).*60;
MemberData(:,3) = [];
MemberData(MemberData(:,1)>25,:) = [];
% ά�� ���� ����ֵ Ԥ�������޶� ʱ�䲿�ֵ�Сʱ ʱ�䲿�ֵķ���

% �������������Ϣ
NewAssignment = xlsread('.\Data\NewAssignment.xls');
% ά�� ����
