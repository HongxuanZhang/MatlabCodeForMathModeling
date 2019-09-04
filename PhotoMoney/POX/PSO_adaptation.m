function[xm,fv] = PSO_adaptation(fitness,N,c1,c2,wmax,wmin,M,D,AdaptFuncData,uesToPredictPrice)
% c1,c2��ѧϰ����
% wmax������Ȩ�����ֵ
% wmin������Ȩ����Сֵ
% M������������
% D�������ռ�ά��
% N����ʼ��Ⱥ�������Ŀ
% ����Ҫ�õ������ռ�ά��Ӧ����3  a , t1 ,t3

% ��ʼ����Ⱥ�ĸ��壨�����������޶�λ�ú��ٶȵķ�Χ��
for i = 1:N
    x(i,1) = randi(20)-10;  % a��ֵӦ����0~1֮��
    x(i,2) = randi(20)-10;
    x(i,3) = randi(20)-10;
    for j=1:D
%         x(i,j) = abs(randn); % �����ʼ��λ��
%         v(i,j) = randn; % �漴��ʼ���ٶ�
        v(i,j) = randn;
    end
end


%�ȼ���������ӵ���Ӧ�ȣ�����ʼ���������Ž�pi���������Ž�pg %
%��ʼ��pi %
for i = 1:N
    p(i) = fitness(x(i,:),AdaptFuncData,uesToPredictPrice);
    y(i,:) = x(i,:) ;
end
%��ʼ��pg %
pg = x(N,:) ;
%�õ���ʼ��ȫ������pg %
for i = 1:(N-1)
    if fitness(x(i,:),AdaptFuncData,uesToPredictPrice) < fitness(pg,AdaptFuncData,uesToPredictPrice)
        pg = x(i,:) ;
    end
end
 
%��ѭ�����������е�����ֱ���ﵽ���ȵ�Ҫ�� %
for t = 1:M
    for j = 1:N
        fv(j) = fitness(x(j,:),AdaptFuncData,uesToPredictPrice) ;
    end
    if t == 50
        daosj = 1;
    end
    fvag = sum(fv)/N ;
    fmin = min(fv);
    for i = 1:N    %���º���,����v���ٶ�������xΪλ��,iΪ��������
        if fv(i) <= fvag
            w = wmin+(fv(i)-fmin)*(wmax-wmin)/(fvag-fmin) ;   %�������������̶Ⱥ���Ӧ��ֵ���е���
        else
            w = wmax ;
        end
        v(i,:) = w*v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(pg-x(i,:)) ;
        x(i,:) = x(i,:)+v(i,:) ;
        if x(i,1)>20
            x(i,1) = randi(20)-10;
        elseif x(i,1)<-20
            x(i,1) = randi(20)-10;
        end
        if x(i,2)>20
            x(i,2) = randi(20)-10;
        elseif x(i,2)<-20
            x(i,2) = randi(20)-10;
        end
        if x(i,3)>20
            x(i,3) = randi(20)-10;
        elseif x(i,3)<-20
            x(i,3) = randi(20)-10;
        end
        if fitness(x(i,:),AdaptFuncData,uesToPredictPrice) < p(i)
            p(i) = fitness(x(i,:),AdaptFuncData,uesToPredictPrice);
            y(i,:) = x(i,:);
        end
        if p(i) < fitness(pg,AdaptFuncData,uesToPredictPrice)
            pg = y(i,:) ;
        end
    end
    Pbest(t) = fitness(pg,AdaptFuncData,uesToPredictPrice) ;
end
 
%�������ļ����� %
xm = pg' ;
fv = fitness(pg,AdaptFuncData,uesToPredictPrice) ;
 
plot(Pbest)
xlabel('��������') ;
ylabel('��Ӧ��ֵ') ;

%% 
%����
[xm,fv] = PSO_adaptation(@AdaptFunc,150,2,2,0.8,0.6,50,3,AdaptFuncData,uesToPredictPrice);