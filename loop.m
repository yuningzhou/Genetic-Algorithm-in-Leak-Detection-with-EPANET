clear all;
close all;
clc

% set leak
P0 = setLeak(90);

% loop through the network
[nrow, ncol] = size (P0);
n = ncol;
F = zeros(ncol,1);

for i = 1: ncol
    R = zeros(1,ncol);
    R(i) = 1;
    P1 = callEPA(R);
    D = P0 - P1;
    S = D.^2;
    F(i) = sum(sum(S));
    
    if F(i) < 1e-6 
        break; 
    end
    
end

% for i = 1: ncol
%     for j = 1:ncol
%         if i~= j
%     R = zeros(1,ncol);
%     R(i) = 1;
%     R(j) = 1;
%     P1 = callEPA(R);
%     D = P0 - P1;
%     S = D.^2;
%     F(ncol+10*i+j-10) = sum(sum(S));
%         end
%     end
%     
%     if F(i) < 1e-6 
%         break; 
%     end
%     
% end


figure
semilogx(F, 'linewidth',2);
% xlim([0 100]);
xlabel('Generation','fontsize',15);
ylabel('Best Fitness','fontsize',15);
set(gca,'fontsize',15,'ticklength',get(gca,'ticklength')*2);
