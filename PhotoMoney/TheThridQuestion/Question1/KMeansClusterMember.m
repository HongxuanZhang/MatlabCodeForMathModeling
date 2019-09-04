opts = statset('Display','final');
 
%����Kmeans����
%X N*P�����ݾ���
%Idx N*1������,�洢����ÿ����ľ�����
%Ctrs K*P�ľ���,�洢����K����������λ��
%SumD 1*K�ĺ�����,�洢����������е���������ĵ����֮��
%D N*K�ľ��󣬴洢����ÿ�������������ĵľ���;
 
X = CompletedTaskData;
[Idx,Ctrs,SumD,D] = kmeans(X(:,1:2),100,'Replicates',3,'Options',opts);

hold off;
plot(X(Idx==1,1),X(Idx==1,2),'r.','MarkerSize',4)
hold on
plot(X(Idx==2,1),X(Idx==2,2),'b.','MarkerSize',4)
hold on
plot(X(Idx==3,1),X(Idx==3,2),'g.','MarkerSize',4)
hold on 
% plot(X(Idx==4,1),X(Idx==4,2),'c.','MarkerSize',4)
% hold on
% plot(X(Idx==5,1),X(Idx==5,2),'m.','MarkerSize',4)
% hold on
% plot(X(Idx==6,1),X(Idx==6,2),'y.','MarkerSize',4)
% hold on 
% plot(X(Idx==7,1),X(Idx==7,2),'k.','MarkerSize',4)
% hold on
% plot(X(Idx==8,1),X(Idx==8,2),'r*','MarkerSize',4)
% hold on
% plot(X(Idx==9,1),X(Idx==9,2),'g*','MarkerSize',4)
% hold on
% plot(X(Idx==10,1),X(Idx==10,2),'b*','MarkerSize',4)
% hold on
% plot(X(Idx==11,1),X(Idx==11,2),'c*','MarkerSize',4)
% hold on
% plot(X(Idx==12,1),X(Idx==12,2),'m*','MarkerSize',4)
% hold on 
% plot(X(Idx==13,1),X(Idx==13,2),'k*','MarkerSize',4)
% hold on
% plot(X(Idx==14,1),X(Idx==14,2),'y*','MarkerSize',4)
% hold on
% plot(X(Idx==15,1),X(Idx==15,2),'rx','MarkerSize',4)