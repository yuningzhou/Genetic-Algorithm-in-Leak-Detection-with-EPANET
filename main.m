clear all;
close all;
clc

[best_fitness, elite, generation, last_generation] = my_ga( ...
    16, ...    % 求解问题的参数个数 16,all; 36, Net2; 95, Net3. 
    @ft, ...       % 自定义适应度函数名 ft
    7, ...        % 种群规模（每一代个体数目）15
    0.8, ...          % 每一代中保持不变的数目（除了变异）= 0.8
    0.1, ...          % 变异概率mutation 0.1
    50, ...     % 最大演化代数 100
    0.01 ...            % 最小目标值（函数值越小，则适应度越高）0.01
);

% 最佳适应度的演化情况
 figure
semilogx(best_fitness, 'linewidth',2);
xlim([0 100]);
xlabel('Generation','fontsize',15);
ylabel('Best Fitness','fontsize',15);
set(gca,'fontsize',15,'ticklength',get(gca,'ticklength')*2);

