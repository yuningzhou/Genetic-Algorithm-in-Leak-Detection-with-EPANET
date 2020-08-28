function [best_fitness, elite, generation, last_generation] = my_ga2( ...
    number_of_variables, ...    
    fitness_function, ...       %  ft
    population_size, ...        
    crossover_rate, ...         
    mutation_rate, ...          
    maximal_generation, ...     
    minimal_cost ...            
)

% best fitness
% initialized as 0
best_fitness = zeros(maximal_generation, 1);

% elite
% 0 initialized for each generation
elite = zeros(maximal_generation, number_of_variables);

% crossover rate
% parent_number, remain unchanged
parent_number = ceil(crossover_rate*population_size);

% child_number
child_number = population_size - parent_number; 

% population
% population_size, no. of row, no. of individuals
% number_of_variables, no. of col£¬no. of parameters
population = zeros(population_size, number_of_variables);

for i = 1:population_size
    randLeak = ceil(number_of_variables*rand());
    population(i,randLeak) = 1;
end

last_generation = 0; 

for generation = 1 : maximal_generation 
    
    % cost
    cost = feval(fitness_function, population); 
    [cost] = sort(cost); 
    best_fitness(generation) = cost(1);
    elite(generation, :) = population(1, :);
    
    % condition of terminate
    if best_fitness(generation) < minimal_cost
        last_generation = generation;
        break; 
    end
    
    % crossover
    for child = 1:2:child_number % each crossover produces 2 children 

        % randomly choose 2 parents 
        mother = ceil(rand * parent_number);
        father = ceil(rand * parent_number);
        % a random crossover point
        crossover_point = ceil(rand*number_of_variables); 
     
        mask1 = [ones(1, crossover_point), zeros(1, number_of_variables - crossover_point)];
        mask2 = ones(1, number_of_variables) - mask1;
        %  .*
        mother_1 = mask1 .* population(mother, :); 
        mother_2 = mask2 .* population(mother, :); 
        
        father_1 = mask1 .* population(father, :); 
        father_2 = mask2 .* population(father, :); 
        
        % new generation 
        population(parent_number + child, :) = mother_1 + father_2; % child 1
        population(parent_number+child+1, :) = mother_2 + father_1; % child 2
        
    % mutation
    mutation_population = population(2:population_size, :); 
    % no mutation to elite, population(1, :)
    % starting from population(2, :)
    
    % number of genes
    number_of_elements = (population_size - 1) * number_of_variables; 
    % number_of_mutations =£¨number of genes*mutation_rate£©
    number_of_mutations = ceil(number_of_elements * mutation_rate); 

    % mutation points
    % the 1D location of mutation points in all genes
    mutation_points = ceil(number_of_elements * rand(1, number_of_mutations)); 
    
    % mutate 0 -> 1, 1 -> 0
    mutation_population(mutation_points) = abs(1-mutation_population(mutation_points));
    
    population(2:population_size, :) = mutation_population; % popu after mutation
    population = round(population,0);
    end
    population = population (1:population_size,:);
end