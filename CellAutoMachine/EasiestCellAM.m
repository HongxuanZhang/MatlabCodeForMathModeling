%% ��ʼ��
m = 50;
X = zeros(m,m);
X(25,25) = 1;

% �ƺ������ڶ���߽������� ��������ע
n = [m 1:m-1];
e = [2:m 1];
s = [2:m 1];
w = [m 1:m-1];
% ���Ƴ�ʼͼ��
[i,j] = find(X);
figure(gcf);
plothandle = plot(i,j,'.', ...
'Color','blue', ...
'MarkerSize',12);
axis([0 m+1 0 m+1]);
%% �ݻ�
for k = 1:50
    %�ھ���
    N = X(n,:) + X(s,:) + X(:,e) + X(:,w) + X(n,e) + X(n,w) + X(s,e) + X(s,w);
    %������?
    RAND = rand(m);
    %����
    X = X | (N.*RAND>0.99);
    %��ͼ
    [i,j] = find(X);
    set(plothandle,'xdata',i,'ydata',j)
    drawnow
    pause(0.2)
    k
end