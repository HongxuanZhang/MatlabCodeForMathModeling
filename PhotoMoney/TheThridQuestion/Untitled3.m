%% 处理第二问数据价格 已经完成的价格不予上调
PriceOfSecond((CompletedTaskData(:,4) == 1),1) = CompletedTaskData((CompletedTaskData(:,4) == 1),3) 