clear all;
close all;
clc

[best_fitness, elite, generation, last_generation] = my_ga( ...
    16, ...    % �������Ĳ������� 16,all; 36, Net2; 95, Net3. 
    @ft, ...       % �Զ�����Ӧ�Ⱥ����� ft
    7, ...        % ��Ⱥ��ģ��ÿһ��������Ŀ��15
    0.8, ...          % ÿһ���б��ֲ������Ŀ�����˱��죩= 0.8
    0.1, ...          % �������mutation 0.1
    50, ...     % ����ݻ����� 100
    0.01 ...            % ��СĿ��ֵ������ֵԽС������Ӧ��Խ�ߣ�0.01
);

% �����Ӧ�ȵ��ݻ����
 figure
semilogx(best_fitness, 'linewidth',2);
xlim([0 100]);
xlabel('Generation','fontsize',15);
ylabel('Best Fitness','fontsize',15);
set(gca,'fontsize',15,'ticklength',get(gca,'ticklength')*2);

