function[xm,fv] = PSO_adaptation(fitness,N,c1,c2,wmax,wmin,M,D,AdaptFuncData,uesToPredictPrice)
% c1,c2：学习因子
% wmax：惯性权重最大值
% wmin：惯性权重最小值
% M：最大迭代次数
% D：搜索空间维数
% N：初始化群体个体数目
% 我们要用的搜索空间维数应该是3  a , t1 ,t3

% 初始化种群的个体（可以在这里限定位置和速度的范围）
for i = 1:N
    x(i,1) = randi(20)-10;  % a的值应该在0~1之间
    x(i,2) = randi(20)-10;
    x(i,3) = randi(20)-10;
    for j=1:D
%         x(i,j) = abs(randn); % 随机初始化位置
%         v(i,j) = randn; % 随即初始化速度
        v(i,j) = randn;
    end
end


%先计算各个粒子的适应度，并初始化个体最优解pi和整体最优解pg %
%初始化pi %
for i = 1:N
    p(i) = fitness(x(i,:),AdaptFuncData,uesToPredictPrice);
    y(i,:) = x(i,:) ;
end
%初始化pg %
pg = x(N,:) ;
%得到初始的全局最优pg %
for i = 1:(N-1)
    if fitness(x(i,:),AdaptFuncData,uesToPredictPrice) < fitness(pg,AdaptFuncData,uesToPredictPrice)
        pg = x(i,:) ;
    end
end
 
%主循环函数，进行迭代，直到达到精度的要求 %
for t = 1:M
    for j = 1:N
        fv(j) = fitness(x(j,:),AdaptFuncData,uesToPredictPrice) ;
    end
    if t == 50
        daosj = 1;
    end
    fvag = sum(fv)/N ;
    fmin = min(fv);
    for i = 1:N    %更新函数,其中v是速度向量，x为位置,i为迭代特征
        if fv(i) <= fvag
            w = wmin+(fv(i)-fmin)*(wmax-wmin)/(fvag-fmin) ;   %依据早熟收敛程度和适应度值进行调整
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
 
%给出最后的计算结果 %
xm = pg' ;
fv = fitness(pg,AdaptFuncData,uesToPredictPrice) ;
 
plot(Pbest)
xlabel('进化次数') ;
ylabel('适应度值') ;

%% 
%调用
[xm,fv] = PSO_adaptation(@AdaptFunc,150,2,2,0.8,0.6,50,3,AdaptFuncData,uesToPredictPrice);