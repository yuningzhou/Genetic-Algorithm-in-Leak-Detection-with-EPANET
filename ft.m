function F = ft(population)

% [population_size, number_of_variables] = size(population);
population_size = 7; 
F = zeros(population_size,1); % num of population 

% set the leakage on node 4 all.inp
P0 = callEPA([0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0]);

% % set the leakage on node 7 Net3.inp
% Node_Status = zeros(95,1);
% Node_Status(7) = 1;
% P0 = callEPA(Node_Status);


for i = 1:population_size
    P1 = callEPA(population(i,:));
    D = P0 - P1;
    S = D.^2;
    F(i) = sum(sum(S));
end

end 