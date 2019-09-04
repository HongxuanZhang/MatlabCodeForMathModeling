function y = AdaptFunc(N_max,K_means_Data)
    %y = ((sin(x(1)^2+x(2)^2))^2-cos(x(1)^2+x(2)^2)+1)/((1+0.1*(x(1)^2+x(2)^2))^2)-0.7;
    ti = - 5.97108 + 0.09115.*K_means_Data(:,5) - 2.29772.*K_means_Data(:,6)+2.02514.*K_means_Data(:,7)+0.22267.*K_means_Data(:,8)-3.27788.*K_means_Data(:,9);
    SuccessRate = 1./(1+exp(-ti)).*(1-((K_means_Data(:,4)-1)./(2.*N_max)).^(2));
    Success = mean(SuccessRate);
    Price = K_means_Data(:,3);
    y = 60./Success + 0.6.*sum(Price)./(8.*40);
end